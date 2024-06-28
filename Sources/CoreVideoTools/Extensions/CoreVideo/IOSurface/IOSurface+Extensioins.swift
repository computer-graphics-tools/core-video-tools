public extension IOSurface {

    /// Describes the cache mode for an IOSurface.
    ///
    /// This enum provides a Swift-friendly interface to the IOSurface cache mode options.
    /// The cache mode determines how memory operations are handled for the IOSurface,
    /// which can affect performance and coherency in different usage scenarios.
    enum CacheMode: UInt32 {
        /// The default cache mode.
        ///
        /// This mode uses the system's default caching behavior, which is generally
        /// a good choice if you're unsure about your specific caching needs.
        case `default`

        /// Inhibits caching.
        ///
        /// In this mode, memory accesses bypass the cache entirely. This can be useful
        /// in scenarios where you need to ensure that all reads and writes go directly
        /// to main memory, bypassing the CPU cache hierarchy.
        case inhibit

        /// Write-through caching.
        ///
        /// In this mode, all write operations are immediately written to both the cache
        /// and main memory. This ensures that main memory always has the most up-to-date
        /// data, which can be beneficial in multi-processor or multi-device scenarios
        /// where memory coherency is critical.
        case writeThrough

        /// Copy-back (also known as write-back) caching.
        ///
        /// In this mode, write operations are performed on the cache, and the modified
        /// cache lines are only written back to main memory when necessary (e.g., when
        /// the cache line is evicted). This can improve performance for frequently
        /// accessed data, but may introduce latency for other devices that need to
        /// access the most recent data.
        case copyback

        /// Write-combine caching.
        ///
        /// This mode is optimized for sequential writes. It allows multiple write
        /// operations to be combined into a single, larger write operation to memory.
        /// This can significantly improve performance for algorithms that perform
        /// many small, sequential writes.
        case writeCombine

        /// Copy-back caching for the inner cache levels.
        ///
        /// This mode is similar to `copyback`, but it only applies the copy-back
        /// behavior to the inner levels of the cache hierarchy. This can be useful
        /// in specific scenarios where you want to optimize for both performance
        /// and coherency across different cache levels.
        case copybackInner

        /// Posted-write combining.
        ///
        /// This mode allows for non-blocking writes, where write operations are
        /// posted (queued) and the CPU can continue execution without waiting for
        /// the write to complete. This can improve performance in scenarios where
        /// write latency is not critical.
        case postedWrite

        /// Real-time caching mode.
        ///
        /// This mode is optimized for real-time operations, where predictable
        /// and consistent timing is crucial. The exact behavior may vary depending
        /// on the system, but it generally aims to provide more deterministic
        /// memory access times.
        case realTime

        /// Posted-write combining with reordering.
        ///
        /// Similar to `postedWrite`, but allows for reordering of write operations
        /// for better performance. This can be beneficial in scenarios where the
        /// order of writes is not critical.
        case postedReordered

        /// Posted-write combining with reordering and additional combining.
        ///
        /// This mode extends `postedReordered` with additional write combining,
        /// potentially offering even better performance for certain write-heavy
        /// workloads where write ordering is not critical.
        case postedCombinedReordered
    }

    /// Creates an IOSurface with the specified dimensions and pixel format.
    ///
    /// This function creates a new IOSurface with the given parameters. It allows for precise control
    /// over the surface's properties, including its dimensions, pixel format, and memory layout.
    ///
    /// - Parameters:
    ///   - width: The width of the IOSurface in pixels.
    ///   - height: The height of the IOSurface in pixels.
    ///   - cvPixelFormat: The pixel format to use for the IOSurface, specified as a `CVPixelFormat`.
    ///   - bytesPerElement: The number of bytes per pixel element.
    ///   - bytesPerRow: The number of bytes per row in the IOSurface.
    ///   - additionalProperties: Additional properties to set on the IOSurface. This parameter is optional.
    ///
    /// - Returns: A newly created `IOSurface`.
    ///
    /// - Throws: `CVError.error` if the IOSurface creation fails.
    ///
    /// - Note: This function provides low-level control over IOSurface creation. Ensure that the
    ///         `bytesPerElement` and `bytesPerRow` values are appropriate for the chosen pixel format
    ///         and surface dimensions to avoid unexpected behavior.
    static func create(
        width: Int,
        height: Int,
        cvPixelFormat: CVPixelFormat,
        bytesPerElement: Int,
        bytesPerRow: Int,
        cacheMode: CacheMode = .default,
        additionalProperties: [IOSurfacePropertyKey: Any]? = nil
    ) throws -> IOSurface {
        var props: [IOSurfacePropertyKey: Any] = [
            .width: width,
            .height: height,
            .pixelFormat: cvPixelFormat.rawValue,
            .bytesPerElement: bytesPerElement,
            .bytesPerRow: bytesPerRow,
            .cacheMode: cacheMode.rawValue
        ]

        if let additionalProperties {
            props.merge(additionalProperties) { (current, _) in current }
        }

        guard let ioSurface = IOSurface(properties: props)
        else { throw CVError.error }

        return ioSurface
    }

}
