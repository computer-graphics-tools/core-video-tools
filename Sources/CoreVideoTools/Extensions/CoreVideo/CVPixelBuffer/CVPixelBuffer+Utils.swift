public extension CVPixelBuffer {
    
    /// Creates a pixel buffer with the same parameters.
    /// - Returns: A blank copy of original CVPixelBuffer.
    func blankCopy() throws -> CVPixelBuffer {
        precondition(
            CFGetTypeID(self) == Self.typeID,
            "copy() cannot be called on a non-CVPixelBuffer"
        )
        
        return try .create(
            width: self.width,
            height: self.height,
            cvPixelFormat: self.cvPixelFormat,
            attachments: self.attachments(mode: .shouldPropagate)
        )
    }
    
    /// Creates a pixel buffer with the same parameters and values.
    /// - Returns: A deep copy of original CVPixelBuffer.
    func deepCopy() throws -> CVPixelBuffer {
        precondition(
            CFGetTypeID(self) == Self.typeID,
            "copy() cannot be called on a non-CVPixelBuffer"
        )

        let copy = try CVPixelBuffer.create(
            width: self.width,
            height: self.height,
            cvPixelFormat: self.cvPixelFormat,
            attachments: self.attachments(mode: .shouldPropagate)
        )
        
        try self.lockBaseAddress(lockFlags: .readOnly)
        try copy.lockBaseAddress(lockFlags: [])

        defer {
            try? self.unlockBaseAddress(unlockFlags: .readOnly)
            try? copy.unlockBaseAddress(unlockFlags: [])
        }

        let pixelBufferPlaneCount = self.planeCount

        if pixelBufferPlaneCount == 0 {
            let destination = copy.baseAddress
            let source = self.baseAddress
            let height = self.height
            let bytesPerRowSource = self.bytesPerRow
            let bytesPerRowDestination = copy.bytesPerRow
            if bytesPerRowSource == bytesPerRowDestination {
                memcpy(
                    destination,
                    source,
                    height * bytesPerRowSource
                )
            } else {
                var startOfRowSource = source
                var startOfRowDestination = destination
                for _ in 0 ..< height {
                    memcpy(
                        startOfRowDestination,
                        startOfRowSource,
                        min(bytesPerRowSource, bytesPerRowDestination)
                    )
                    startOfRowSource = startOfRowSource?.advanced(by: bytesPerRowSource)
                    startOfRowDestination = startOfRowDestination?.advanced(by: bytesPerRowDestination)
                }
            }
        } else {
            for plane in 0 ..< pixelBufferPlaneCount {
                let destination = copy.baseAddress(of: plane)
                let source = self.baseAddress(of: plane)
                let height = self.height(of: plane)
                let bytesPerRowSource = self.bytesPerRow(of: plane)
                let bytesPerRowDestination = copy.bytesPerRow(of: plane)

                if bytesPerRowSource == bytesPerRowDestination {
                    memcpy(
                        destination,
                        source,
                        height * bytesPerRowSource
                    )
                } else {
                    var startOfRowSource = source
                    var startOfRowDestination = destination
                    for _ in 0 ..< height {
                        memcpy(
                            startOfRowDestination,
                            startOfRowSource,
                            min(bytesPerRowSource, bytesPerRowDestination)
                        )
                        startOfRowSource = startOfRowSource?.advanced(by: bytesPerRowSource)
                        startOfRowDestination = startOfRowDestination?.advanced(by: bytesPerRowDestination)
                    }
                }
            }
        }
        return copy
    }
    
    /// Data of the pixel buffer's plane.
    ///
    /// Retrieving dara for a PixelBuffer requires that the buffer base address be locked via a successful call to `lockBaseAddress(lockFlags:)`.
    ///
    /// - Parameter planeIndex: Identifying the plane.
    /// - Returns: Data of the pixel buffer's plane.
    func data(of planeIndex: Int) -> Data? {
        guard let source = self.baseAddress(of: planeIndex)
        else { return nil }
        return .init(
            bytes: source,
            count: self.height(of: planeIndex) * self.bytesPerRow(of: planeIndex)
        )
    }
    
    /// Data of the pixel buffer.
    ///
    /// Retrieving dara for a PixelBuffer requires that the buffer base address be locked via a successful call to `lockBaseAddress(lockFlags:)`.
    ///
    /// - Returns: Data of the pixel buffer's plane.
    func data() -> Data? {
        guard let source = self.baseAddress else { return nil }
        return .init(
            bytes: source,
            count: self.height * self.bytesPerRow
        )
    }
}
