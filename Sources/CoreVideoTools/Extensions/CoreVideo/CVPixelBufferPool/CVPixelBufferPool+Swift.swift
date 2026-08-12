import CoreVideo

public extension CVPixelBufferPool {
    /// Attributes that control a pixel buffer pool.
    enum PropertyKey: Sendable {
        /// The minimum number of buffers the pool should keep allocated.
        case minimumBufferCount

        /// The maximum time, in seconds, that an unused buffer should remain in the pool.
        case maximumBufferAge

        public var rawValue: CFString {
            switch self {
            case .minimumBufferCount:
                kCVPixelBufferPoolMinimumBufferCountKey
            case .maximumBufferAge:
                kCVPixelBufferPoolMaximumBufferAgeKey
            }
        }
    }

    /// Creates a pool with typed pool and pixel-buffer attributes.
    static func create(
        pixelBufferAttributes: [CVPixelBuffer.PropertyKey: Any],
        poolAttributes: [PropertyKey: Any]? = nil,
        allocator: CFAllocator? = nil
    ) throws -> CVPixelBufferPool {
        let rawPoolAttributes = poolAttributes?.reduce(into: [CFString: Any]()) {
            $0[$1.key.rawValue] = $1.value
        } as CFDictionary?
        let rawPixelBufferAttributes = pixelBufferAttributes.reduce(into: [CFString: Any]()) {
            $0[$1.key.rawValue] = $1.value
        } as CFDictionary
        var optionalPool: CVPixelBufferPool?

        let result = CVPixelBufferPoolCreate(
            allocator,
            rawPoolAttributes,
            rawPixelBufferAttributes,
            &optionalPool
        ).result
        try result.throwOnError()

        guard let pool = optionalPool
        else { throw CVError.poolAllocationFailed }
        return pool
    }

    /// Creates a pixel buffer using the pool's configured attributes.
    func makePixelBuffer(allocator: CFAllocator? = nil) throws -> CVPixelBuffer {
        var optionalPixelBuffer: CVPixelBuffer?
        let result = CVPixelBufferPoolCreatePixelBuffer(
            allocator,
            self,
            &optionalPixelBuffer
        ).result
        try result.throwOnError()

        guard let pixelBuffer = optionalPixelBuffer
        else { throw CVError.allocationFailed }
        return pixelBuffer
    }
}
