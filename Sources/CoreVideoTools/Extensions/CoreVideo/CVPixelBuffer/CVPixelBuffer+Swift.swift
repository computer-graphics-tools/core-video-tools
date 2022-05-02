import CoreVideo

public extension CVPixelBuffer {

    /// The width of the PixelBuffer.
    var width: Int { CVPixelBufferGetWidth(self) }
    
    /// The height of the PixelBuffer.
    var height: Int { CVPixelBufferGetHeight(self) }
    
    /// The `CVPixelFormat` of the PixelBuffer.
    var cvPixelFormat: CVPixelFormat { .init(rawValue: CVPixelBufferGetPixelFormatType(self)) }
    
    /// The base address of the PixelBuffer.
    ///
    /// Retrieving the base address for a PixelBuffer requires that the buffer base address be locked
    /// via a successful call to CVPixelBufferLockBaseAddress.
    ///
    /// - Returns: For chunky buffers, this will return a pointer to the pixel at 0,0 in the buffer.
    /// For planar buffers this will return a pointer to a PlanarComponentInfo struct (defined in QuickTime).
    var baseAddress: UnsafeMutableRawPointer? { CVPixelBufferGetBaseAddress(self) }
    
    /// The rowBytes of the PixelBuffer.
    /// - Returns: Bytes per row of the image data.
    /// For planar buffers this will return a rowBytes value such that `bytesPerRow * height`
    /// will cover the entire image including all planes.
    var bytesPerRow: Int { CVPixelBufferGetBytesPerRow(self) }
    
    /// Returns the data size for contigous planes of the PixelBuffer.
    /// - Returns: The size of the memory if the planes are contiguous, or NULL if it is not.
    var dataSize: Int { CVPixelBufferGetDataSize(self) }
    
    /// Returns if the PixelBuffer is planar.
    /// - Returns: True if the PixelBuffer was created using CVPixelBufferCreateWithPlanarBytes.
    var isPlanar: Bool { CVPixelBufferIsPlanar(self) }
    
    /// Returns number of planes of the PixelBuffer.
    /// - Returns: Number of planes.  Returns 0 for non-planar CVPixelBufferRefs.
    var planeCount: Int { CVPixelBufferGetPlaneCount(self) }
    
    /// Locks the BaseAddress of the PixelBuffer to ensure that the memory is accessible.
    ///
    /// This API ensures that the CVPixelBuffer is accessible in system memory.
    /// This should only be called if the base address is going to be used and the pixel data will be accessed by the CPU.
    ///
    /// - Parameter lockFlags: See CVPixelBufferLockFlags.
    /// - Throws: `CVError` code on failure
    func lockBaseAddress(lockFlags: CVPixelBufferLockFlags) throws {
        try CVPixelBufferLockBaseAddress(self, lockFlags).result.throwOnError()
    }
    
    /// Unlocks the BaseAddress of the PixelBuffer.
    /// - Parameter unlockFlags: See CVPixelBufferLockFlags.
    /// - Throws: `CVError` code on failure
    func unlockBaseAddress(unlockFlags: CVPixelBufferLockFlags) throws {
        try CVPixelBufferUnlockBaseAddress(self, unlockFlags).result.throwOnError()
    }
    
    /// Returns the width of the plane at planeIndex in the PixelBuffer.
    ///
    /// On OSX 10.10 and earlier, or iOS 8 and earlier, calling this
    /// function with a non-planar buffer will have undefined behavior.
    ///
    /// - Parameter planeIndex: Identifying the plane.
    /// - Returns: Width in pixels, or 0 for non-planar CVPixelBufferRefs.
    func width(of planeIndex: Int) -> Int {
        return CVPixelBufferGetWidthOfPlane(self, planeIndex)
    }
    
    /// Returns the height of the plane at planeIndex in the PixelBuffer.
    ///
    /// On OSX 10.10 and earlier, or iOS 8 and earlier, calling this
    /// function with a non-planar buffer will have undefined behavior.
    ///
    /// - Parameter planeIndex: Identifying the plane.
    /// - Returns: Height in pixels, or 0 for non-planar CVPixelBufferRefs.
    func height(of planeIndex: Int) -> Int {
        return CVPixelBufferGetHeightOfPlane(self, planeIndex)
    }
    
    /// Returns the base address of the plane at planeIndex in the PixelBuffer.
    ///
    /// Retrieving the base address for a PixelBuffer requires that the buffer base address be locked
    /// via a successful call to CVPixelBufferLockBaseAddress. On OSX 10.10 and earlier, or iOS 8 and
    /// earlier, calling this function with a non-planar buffer will have undefined behavior.
    ///
    /// - Parameter planeIndex:  Identifying the plane.
    /// - Returns: Base address of the plane, or NULL for non-planar CVPixelBufferRefs.
    func baseAddress(of planeIndex: Int) -> UnsafeMutableRawPointer? {
        return CVPixelBufferGetBaseAddressOfPlane(self, planeIndex)
    }
    
    /// Returns the row bytes of the plane at planeIndex in the PixelBuffer.
    ///
    /// On OSX 10.10 and earlier, or iOS 8 and earlier, calling this
    /// function with a non-planar buffer will have undefined behavior.
    ///
    /// - Parameter planeIndex: Identifying the plane.
    /// - Returns: Row bytes of the plane, or NULL for non-planar CVPixelBufferRefs.
    func bytesPerRow(of planeIndex: Int) -> Int {
        return CVPixelBufferGetBytesPerRowOfPlane(self, planeIndex)
    }
    
    /// Size of extended pixels of the PixelBuffer
    struct ExtendedPixels {
        /// The pixel row padding to the left.
        let extraColumnsOnLeft: Int
        /// The pixel row padding to the right.
        let extraColumnsOnRight: Int
        /// The pixel row padding to the top.
        let extraRowsOnTop: Int
        /// The pixel row padding to the bottom.
        let extraRowsOnBottom: Int
    }
    
    /// Returns the size of extended pixels of the PixelBuffer.
    ///
    /// On OSX 10.10 and earlier, or iOS 8 and earlier, calling this
    /// function with a non-planar buffer will have undefined behavior.
    ///
    /// - Returns: Returns the pixel row paddings.
    func extendedPixels() -> ExtendedPixels {
        var left: Int = 0, right: Int = 0, top: Int = 0, bottom: Int = 0
        CVPixelBufferGetExtendedPixels(self, &left, &right, &top, &bottom)
        return .init(
            extraColumnsOnLeft: left,
            extraColumnsOnRight: right,
            extraRowsOnTop: top,
            extraRowsOnBottom: bottom
        )
    }
    
    /// Fills the extended pixels of the PixelBuffer.
    ///
    /// This function replicates edge pixels to fill the entire extended region of the image.
    ///
    /// - Returns: kCVReturnSuccess if the unlock succeeded, or error code on failure
    @discardableResult
    func fillExtendedPixels() -> CVReturn {
        CVPixelBufferFillExtendedPixels(self)
    }
    
    /// Returns all attachments of a CVBuffer object
    /// `CVBufferGetAttachments` is a convenience call that returns all attachments with their corresponding keys in a `CFDictionary`.
    /// - Returns: A CFDictionary with all buffer attachments identified by there keys. If no attachment is present, the dictionary is empty.
    /// Returns nil for invalid attachment mode.
    func attachments(mode: CVAttachmentMode) -> CFDictionary? {
        return CVBufferGetAttachments(self, mode)
    }
    
    /// Returns a copy of pixelBufferAttributes dictionary used to create the PixelBuffer.
    ///
    /// Can be used to create similar pixelbuffers.
    ///
    /// - Returns: A copy of pixelBufferAttributes dictionary.
    @available(iOS 15.0, macOS 12.0, *)
    @discardableResult
    func copyCreationAttributes() -> CFDictionary {
        return CVPixelBufferCopyCreationAttributes(self)
    }
    
    /// The Core Foundation type identifier of the pixel buffer type.
    static var typeID: CFTypeID { CVPixelBufferGetTypeID() }
    
    /// Creates a single pixel buffer for a given size and pixel format.
    ///
    /// This function allocates the necessary memory based on the pixel dimensions, format, and extended pixels described in the pixel buffer’s attributes.
    /// Some of the parameters specified in this call override equivalent pixel buffer attributes.
    /// For example, if you define the `kCVPixelBufferWidth` and `kCVPixelBufferHeight` keys in the pixel buffer attributes parameter (pixelBufferAttributes),
    /// these values are overridden by the width and height parameters.
    ///
    /// - Parameters:
    ///   - width: Width of the pixel buffer, in pixels.
    ///   - height: Height of the pixel buffer, in pixels.
    ///   - cvPixelFormat: The pixel format identified by its respective four-character code.
    ///   - attachments: A dictionary with additional attributes for a pixel buffer. This parameter is optional. See Pixel Buffer Attribute Keys for more details.
    ///   - allocator: The allocator to use to create the pixel buffer. Pass `nil` to specify the default allocator.
    /// - Returns: Returns the newly created pixel buffer. Ownership follows the The Create Rule.
    static func create(
        width: Int,
        height: Int,
        cvPixelFormat: CVPixelFormat = .type_32BGRA,
        attachments: CFDictionary? = nil,
        allocator: CFAllocator? = nil
    ) throws -> CVPixelBuffer {
        
        var optionalPixelBuffer: CVPixelBuffer?
        
        let result = CVPixelBufferCreate(
            allocator,
            width,
            height,
            cvPixelFormat.rawValue,
            attachments,
            &optionalPixelBuffer
        ).result
        
        try result.throwOnError()
        
        guard let pixelBuffer = optionalPixelBuffer
        else { throw CVError.allocationFailed }
        return pixelBuffer
    }
    
    /// Call to create a single PixelBuffer for a given size and pixelFormatType based on a passed in piece of memory.
    ///
    /// Creates a single PixelBuffer for a given size and pixelFormatType.
    /// Not all parameters of the pixelBufferAttributes will be used here.
    /// It requires a release callback function that will be called, when the PixelBuffer gets destroyed so that the owner of the pixels can free the memory.
    ///
    /// - Parameters:
    ///   - width: Width of the PixelBuffer in pixels
    ///   - height: Height of the PixelBuffer in pixels
    ///   - cvPixelFormat: Pixel format indentified by its respective `CVPixelFormat`.
    ///   - baseAddress: Address of the memory storing the pixels.
    ///   - bytesPerRow: Row bytes of the pixel storage memory.
    ///   - releaseCallback: `CVPixelBufferReleaseBytePointerCallback` function that gets called when the PixelBuffer gets destroyed.
    ///   - releaseRefCon: User data identifying the PixelBuffer for the release callback.
    ///   - allocator: The allocator to use to create the pixel buffer. Pass `nil` to specify the default allocator.
    /// - Returns: Returns the newly created pixel buffer. Ownership follows the The Create Rule.
    static func create(
        width: Int,
        height: Int,
        cvPixelFormat: CVPixelFormat,
        baseAddress: UnsafeMutableRawPointer,
        bytesPerRow: Int,
        releaseCallback: CVPixelBufferReleaseBytesCallback? = nil,
        releaseRefCon: UnsafeMutableRawPointer? = nil,
        pixelBufferAttributes: CFDictionary? = nil,
        allocator: CFAllocator? = nil
    ) throws -> CVPixelBuffer {
        
        var optionalPixelBuffer: CVPixelBuffer?
        
        let result = CVPixelBufferCreateWithBytes(
            allocator,
            width,
            height,
            cvPixelFormat.rawValue,
            baseAddress,
            bytesPerRow,
            releaseCallback,
            releaseRefCon,
            pixelBufferAttributes,
            &optionalPixelBuffer
        ).result
        
        try result.throwOnError()
        
        guard let pixelBuffer = optionalPixelBuffer
        else { throw CVError.allocationFailed }
        return pixelBuffer
    }
}
