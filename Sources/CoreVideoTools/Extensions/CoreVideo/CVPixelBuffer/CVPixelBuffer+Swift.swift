import CoreVideo

public extension CVPixelBuffer {
    
    enum PropertyKey {
        /// A single CFNumber or a CFArray of CFNumbers (OSTypes)
        @available(iOS 4.0, macOS 10.4, macCatalyst 13.1, *)
        case pixelFormatType
        
        /// CFAllocatorRef
        @available(iOS 4.0, macOS 10.4, macCatalyst 13.1, *)
        case memoryAllocator
        
        /// CFNumber
        @available(iOS 4.0, macOS 10.4, macCatalyst 13.1, *)
        case width
        
        /// CFNumber
        @available(iOS 4.0, macOS 10.4, macCatalyst 13.1, *)
        case height
        
        /// CFNumber
        @available(iOS 4.0, macOS 10.4, macCatalyst 13.1, *)
        case extendedPixelsLeft
        
        /// CFNumber
        @available(iOS 4.0, macOS 10.4, macCatalyst 13.1, *)
        case extendedPixelsTop
        
        /// CFNumber
        @available(iOS 4.0, macOS 10.4, macCatalyst 13.1, *)
        case extendedPixelsRight
        
        /// CFNumber
        @available(iOS 4.0, macOS 10.4, macCatalyst 13.1, *)
        case extendedPixelsBottom
        
        /// CFNumber
        @available(iOS 4.0, macOS 10.4, macCatalyst 13.1, *)
        case bytesPerRowAlignment
        
        /// CFBoolean
        @available(iOS 4.0, macOS 10.4, macCatalyst 13.1, *)
        case cGBitmapContextCompatibility
        
        /// CFBoolean
        @available(iOS 4.0, macOS 10.4, macCatalyst 13.1, *)
        case cGImageCompatibility
        
        /// CFBoolean
        @available(iOS 4.0, macOS 10.4, macCatalyst 13.1, *)
        case openGLCompatibility
        
        /// CFNumber
        @available(iOS 4.0, macOS 10.4, macCatalyst 13.1, *)
        case planeAlignment
        
        /// CFDictionary; presence requests buffer allocation via IOSurface
        @available(iOS 4.0, macOS 10.4, macCatalyst 13.1, *)
        case iOSurfaceProperties
        
        /// CFBoolean
        @available(iOS 8.0, macOS 10.11, macCatalyst 13.1, *)
        case metalCompatibility
        
        /// Buffer attachment key for code indicating Bayer pattern (sensel arrangement).
        ///
        /// Associated attachment is a CFNumber of type kCFNumberSInt32Type.
        /// The value follows the semantics of the ProRes RAW bayer_pattern bitstream syntax element, namely 0, 1, 2, or 3,
        /// where 0 means the top-left sensel of the frame is red-filtered ("RGGB");
        /// 1 means the top-left sensel of the frame is green-filtered, with the top row alternating between green- and red-filtered sensels ("GRBG");
        /// 2 means the top-left sensel of the frame is green- filtered, with the top row alternating between green- and blue-filtered sensels ("GBRG");
        /// and 3 means the top-left sensel of the frame is blue-filtered ("BGGR").
        /// This attachment applies only to buffers with VersatileBayer formats.
        @available(iOS 14.0, macOS 11.0, macCatalyst 14.0, *)
        case versatileBayerPattern
        
        /// Buffer attachment key for siting offsets, relative to pixel center, of individual sensels/components constituting each pixel.
        ///
        /// Associated attachment is CFData containing an array of 8 32-bit floats.
        /// The eight CFData array elements specify, in order, the following sensel/component offsets from pixel center:
        /// red horizontal offset, red vertical offset, green horizontal offset, green vertical offset, blue horizontal offset,
        /// blue vertical offset, alpha horizontal offset, and alpha vertical offset.
        /// A positive offset value indicates that the sensel/component lies to the right of or below the center of its pixel,
        /// while a negative value indicates that the sensel/component lies to the left of or above the center of its pixel.
        /// Horizontal and vertical offset magnitudes are respectively in terms of the spacing between horizontally- and vertically-adjacent pixel centers.
        /// This attachment applies only to buffers with the bp64 format, and is optional for those buffers; if not present, all offsets are considered to be 0.
        @available(iOS 14.0, macOS 11.0, macCatalyst 14.0, *)
        case proResRAWSenselSitingOffsets
        
        /// Buffer attachment key for sensel black level.
        ///
        /// Associated attachment is a CFNumber of type kCFNumberSInt32Type.
        /// The value is the sensel level corresponding to no light exposure.
        /// This attachment is required for buffers with either the bp16 or bp64 format.
        @available(iOS 14.0, macOS 11.0, macCatalyst 14.0, *)
        case proResRAWBlackLevel

        /// Buffer attachment key for sensel white level.
        ///
        /// Associated attachment is a CFNumber of type kCFNumberSInt32Type.
        /// The value is the sensel level corresponding to sensor (or camera A-to-D converter) saturation.
        /// This attachment is required for buffers with either the bp16 or bp64 format.
        @available(iOS 14.0, macOS 11.0, macCatalyst 14.0, *)
        case proResRAWWhiteLevel

        /// Buffer attachment key for illuminant correlated color temperature.
        ///
        /// Associated attachment is a CFNumber of type kCFNumberSInt32Type.
        /// The value is the illuminant correlated color temperature (CCT), in kelvins, selected at the time of capture.
        /// May be 0, indicating that the CCT is unknown or unspecified.
        /// This attachment is optional for buffers with either the bp16 or bp64 format; if not present, the CCT is considered unknown or unspecified.
        @available(iOS 14.0, macOS 11.0, macCatalyst 14.0, *)
        case proResRAWWhiteBalanceCCT

        /// Buffer attachment key for white balance red factor.
        ///
        /// Associated attachment is a CFNumber of type kCFNumberFloat32Type.
        /// The value is the white balance multiplication factor for red-filtered sensels.
        /// This attachment is required for buffers with either the bp16 or bp64 format.
        @available(iOS 14.0, macOS 11.0, macCatalyst 14.0, *)
        case proResRAWWhiteBalanceRedFactor

        /// Buffer attachment key for white balance blue factor.
        ///
        /// Associated attachment is a CFNumber of type kCFNumberFloat32Type.
        /// The value is the white balance multiplication factor for blue-filtered sensels.
        /// This attachment is required for buffers with either the bp16 or bp64 format.
        @available(iOS 14.0, macOS 11.0, macCatalyst 14.0, *)
        case proResRAWWhiteBalanceBlueFactor

        /// Buffer attachment key for color translation matrix.
        ///
        /// Associated attachment is CFData containing an array of 9 32-bit floats.
        /// The value is a 3x3 matrix which transforms linear RGB pixel values in the camera native color space to CIE 1931 XYZ values relative to the D65 illuminant,
        /// where the matrix entries are stored in the CFData in row-major order.
        /// This attachment is required for buffers with either the bp16 or bp64 format.
        @available(iOS 14.0, macOS 11.0, macCatalyst 14.0, *)
        case proResRAWColorMatrix

        /// Buffer attachment key for gain factor.
        ///
        /// Associated attachment is a CFNumber of type kCFNumberFloat32Type.
        /// The value is the overall gain factor for raw conversion.
        /// This attachment is required for buffers with either the bp16 or bp64 format.
        @available(iOS 14.0, macOS 11.0, macCatalyst 14.0, *)
        case proResRAWGainFactor

        /// Buffer attachment key for recommended number of pixels/rows to discard from the sides of the image after raw conversion.
        ///
        /// Associated attachment is CFData containing an array of 4 32-bit floats.
        /// The four CFData array elements specify, in order, the recommended number of: pixels to discard from the start (left) of each row of the image;
        /// pixels to discard from the end (right) of each row of the image; rows of pixels to discard from the top of the image;
        /// and rows of pixels to discard from the bottom of the image.  (Pixels/rows are discarded after raw conversion.)
        /// This attachment is optional for buffers with either the bp16 or bp64 format; if not present, the recommended crop values are considered to be 0.
        /// For buffers with the bp64 format, the values may be nonintegral due to downscaling, in which case the handling of fractional parts is implementation-dependent.
        @available(iOS 14.0, macOS 11.0, macCatalyst 14.0, *)
        case proResRAWRecommendedCrop
        
        /// Buffer attachment key for metadata extension.
        ///
        /// Associated attachment is CFData containing ProRes RAW metadata extension.
        /// This attachment is optional for buffers with either bp16 or bp64.
        /// The CFData contains a big-endian uint32 representing the size of the item in bytes followed by a 4-character code ('psim') followed by a variable-length pascal string identifying the metadata (like a key string) followed by the metadata payload.
        @available(iOS 15.0, macOS 12.0, macCatalyst 15.0, *)
        case proResRAWMetadataExtension
        
        #if os(iOS) && !targetEnvironment(macCatalyst)
        /// CFBoolean
        @available(iOS 6.0, *)
        @available(macOS, unavailable)
        @available(macCatalyst, unavailable)
        case openGLESCompatibility
        
        /// CFBoolean
        @available(iOS 9.0, *)
        @available(macOS, unavailable)
        @available(macCatalyst, unavailable)
        case openGLESTextureCacheCompatibility
        #endif
        
        #if os(macOS)
        /// CFBoolean
        @available(macOS 10.11, *)
        @available(iOS, unavailable)
        @available(macCatalyst, unavailable)
        case openGLTextureCacheCompatibility
        #endif
        
        case unknown
        
        init(rawValue: CFString) {
            var propertyKey = PropertyKey.unknown
            
            if #available(iOS 4.0, macOS 10.4, macCatalyst 13.1, *) {
                switch rawValue {
                case kCVPixelBufferPixelFormatTypeKey: propertyKey = .pixelFormatType
                case kCVPixelBufferMemoryAllocatorKey: propertyKey = .memoryAllocator
                case kCVPixelBufferWidthKey: propertyKey = .width
                case kCVPixelBufferHeightKey: propertyKey = .height
                case kCVPixelBufferExtendedPixelsLeftKey: propertyKey = .extendedPixelsLeft
                case kCVPixelBufferExtendedPixelsTopKey: propertyKey = .extendedPixelsTop
                case kCVPixelBufferExtendedPixelsRightKey: propertyKey = .extendedPixelsRight
                case kCVPixelBufferExtendedPixelsBottomKey: propertyKey = .extendedPixelsBottom
                case kCVPixelBufferBytesPerRowAlignmentKey: propertyKey = .bytesPerRowAlignment
                case kCVPixelBufferCGBitmapContextCompatibilityKey: propertyKey = .cGBitmapContextCompatibility
                case kCVPixelBufferCGImageCompatibilityKey: propertyKey = .cGImageCompatibility
                case kCVPixelBufferOpenGLCompatibilityKey: propertyKey = .openGLCompatibility
                case kCVPixelBufferPlaneAlignmentKey: propertyKey = .planeAlignment
                case kCVPixelBufferIOSurfacePropertiesKey: propertyKey = .iOSurfaceProperties
                default: break
                }
            }
            
            if #available(iOS 8.0, macOS 10.11, macCatalyst 13.1, *) {
                switch rawValue {
                case kCVPixelBufferMetalCompatibilityKey: propertyKey = .metalCompatibility
                default: break
                }
            }
            
            if #available(iOS 14.0, macOS 11.0, macCatalyst 14.0, *) {
                switch rawValue {
                case kCVPixelBufferVersatileBayerKey_BayerPattern: propertyKey = .versatileBayerPattern
                case kCVPixelBufferProResRAWKey_SenselSitingOffsets: propertyKey = .proResRAWSenselSitingOffsets
                case kCVPixelBufferProResRAWKey_BlackLevel: propertyKey = .proResRAWBlackLevel
                case kCVPixelBufferProResRAWKey_WhiteLevel: propertyKey = .proResRAWWhiteLevel
                case kCVPixelBufferProResRAWKey_WhiteBalanceCCT: propertyKey = .proResRAWWhiteBalanceCCT
                case kCVPixelBufferProResRAWKey_WhiteBalanceRedFactor: propertyKey = .proResRAWWhiteBalanceRedFactor
                case kCVPixelBufferProResRAWKey_WhiteBalanceBlueFactor: propertyKey = .proResRAWWhiteBalanceBlueFactor
                case kCVPixelBufferProResRAWKey_ColorMatrix: propertyKey = .proResRAWColorMatrix
                case kCVPixelBufferProResRAWKey_GainFactor: propertyKey = .proResRAWGainFactor
                case kCVPixelBufferProResRAWKey_RecommendedCrop: propertyKey = .proResRAWRecommendedCrop
                default: break
                }
            }
            
            if #available(iOS 15.0, macOS 12.0, macCatalyst 15.0, *) {
                switch rawValue {
                case kCVPixelBufferProResRAWKey_MetadataExtension: propertyKey = .proResRAWMetadataExtension
                default: break
                }
            }
            
            #if os(iOS) && !targetEnvironment(macCatalyst)
            if #available(iOS 6.0, *) {
                switch rawValue {
                case kCVPixelBufferOpenGLESCompatibilityKey: propertyKey = .openGLESCompatibility
                default: break
                }
            }
            if #available(iOS 9.0, *) {
                switch rawValue {
                case kCVPixelBufferOpenGLESTextureCacheCompatibilityKey: propertyKey = .openGLESTextureCacheCompatibility
                default: break
                }
            }
            #endif
            
            #if os(macOS)
            if #available(macOS 10.11, *) {
                switch rawValue {
                case kCVPixelBufferOpenGLTextureCacheCompatibilityKey: propertyKey = .openGLTextureCacheCompatibility
                default: break
                }
            }
            #endif
            
            self = propertyKey
        }
        
        public var rawValue: CFString {
            var rawValue = "" as CFString
            
            if #available(iOS 4.0, macOS 10.4, macCatalyst 13.1, *) {
                switch self {
                case .pixelFormatType: rawValue = kCVPixelBufferPixelFormatTypeKey
                case .memoryAllocator: rawValue = kCVPixelBufferMemoryAllocatorKey
                case .width: rawValue = kCVPixelBufferWidthKey
                case .height: rawValue = kCVPixelBufferHeightKey
                case .extendedPixelsLeft: rawValue = kCVPixelBufferExtendedPixelsLeftKey
                case .extendedPixelsTop: rawValue = kCVPixelBufferExtendedPixelsTopKey
                case .extendedPixelsRight: rawValue = kCVPixelBufferExtendedPixelsRightKey
                case .extendedPixelsBottom: rawValue = kCVPixelBufferExtendedPixelsBottomKey
                case .bytesPerRowAlignment: rawValue = kCVPixelBufferBytesPerRowAlignmentKey
                case .cGBitmapContextCompatibility: rawValue = kCVPixelBufferCGBitmapContextCompatibilityKey
                case .cGImageCompatibility: rawValue = kCVPixelBufferCGImageCompatibilityKey
                case .openGLCompatibility: rawValue = kCVPixelBufferOpenGLCompatibilityKey
                case .planeAlignment: rawValue = kCVPixelBufferPlaneAlignmentKey
                case .iOSurfaceProperties: rawValue = kCVPixelBufferIOSurfacePropertiesKey
                default: break
                }
            }
            
            if #available(iOS 8.0, macOS 10.11, macCatalyst 13.1, *) {
                switch self {
                case .metalCompatibility: rawValue = kCVPixelBufferMetalCompatibilityKey
                default: break
                }
            }
            
            if #available(iOS 14.0, macOS 11.0, macCatalyst 14.0, *) {
                switch self {
                case .versatileBayerPattern: rawValue = kCVPixelBufferVersatileBayerKey_BayerPattern
                case .proResRAWSenselSitingOffsets: rawValue = kCVPixelBufferProResRAWKey_SenselSitingOffsets
                case .proResRAWBlackLevel: rawValue = kCVPixelBufferProResRAWKey_BlackLevel
                case .proResRAWWhiteLevel: rawValue = kCVPixelBufferProResRAWKey_WhiteLevel
                case .proResRAWWhiteBalanceCCT: rawValue = kCVPixelBufferProResRAWKey_WhiteBalanceCCT
                case .proResRAWWhiteBalanceRedFactor: rawValue = kCVPixelBufferProResRAWKey_WhiteBalanceRedFactor
                case .proResRAWWhiteBalanceBlueFactor: rawValue = kCVPixelBufferProResRAWKey_WhiteBalanceBlueFactor
                case .proResRAWColorMatrix: rawValue = kCVPixelBufferProResRAWKey_ColorMatrix
                case .proResRAWGainFactor: rawValue = kCVPixelBufferProResRAWKey_GainFactor
                case .proResRAWRecommendedCrop: rawValue = kCVPixelBufferProResRAWKey_RecommendedCrop
                default: break
                }
            }
            
            if #available(iOS 15.0, macOS 12.0, macCatalyst 15.0, *) {
                switch self {
                case .proResRAWMetadataExtension: rawValue = kCVPixelBufferProResRAWKey_MetadataExtension
                default: break
                }
            }
            
            #if os(iOS) && !targetEnvironment(macCatalyst)
            if #available(iOS 6.0, *) {
                switch self {
                case .openGLESCompatibility: rawValue = kCVPixelBufferOpenGLESCompatibilityKey
                default: break
                }
            }
            
            if #available(iOS 9.0, *) {
                switch self {
                case .openGLESTextureCacheCompatibility: rawValue = kCVPixelBufferOpenGLESTextureCacheCompatibilityKey
                default: break
                }
            }
            #endif
            
            #if os(macOS)
            if #available(macOS 10.11, *) {
                switch self {
                case .openGLTextureCacheCompatibility: rawValue = kCVPixelBufferOpenGLTextureCacheCompatibilityKey
                default: break
                }
            }
            #endif
            
            return rawValue
        }
    }

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
    func attachments(mode: CVAttachmentMode) -> [PropertyKey: Any]? {
        guard let cfAttributes = CVBufferGetAttachments(self, mode) as? [CFString: Any]
        else { return nil }
        return cfAttributes.reduce(into: [:]) { $0[PropertyKey(rawValue: $1.key)] = $1.value }
    }
    
    /// Returns a copy of pixelBufferAttributes dictionary used to create the PixelBuffer.
    ///
    /// Can be used to create similar pixelbuffers.
    ///
    /// - Returns: A copy of pixelBufferAttributes dictionary.
    @available(iOS 15.0, macOS 12.0, *)
    @discardableResult
    func copyCreationAttributes() -> [PropertyKey: Any] {
        let cfAttributes = CVPixelBufferCopyCreationAttributes(self) as? [CFString: Any] ?? [:]
        return cfAttributes.reduce(into: [:]) { $0[PropertyKey(rawValue: $1.key)] = $1.value }
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
        attachments: [PropertyKey: Any]? = nil,
        allocator: CFAllocator? = nil
    ) throws -> CVPixelBuffer {
        let cfAttachments = attachments?.reduce(into: [:]) {
            $0[$1.key.rawValue] = $1.value
        } as CFDictionary?
        
        var optionalPixelBuffer: CVPixelBuffer?
        
        let result = CVPixelBufferCreate(
            allocator,
            width,
            height,
            cvPixelFormat.rawValue,
            cfAttachments,
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
        pixelBufferAttributes: [PropertyKey: Any]? = nil,
        allocator: CFAllocator? = nil
    ) throws -> CVPixelBuffer {
        let cfPixelBufferAttributes = pixelBufferAttributes?.reduce(into: [:]) {
            $0[$1.key.rawValue] = $1.value
        } as CFDictionary?
        
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
            cfPixelBufferAttributes,
            &optionalPixelBuffer
        ).result
        
        try result.throwOnError()
        
        guard let pixelBuffer = optionalPixelBuffer
        else { throw CVError.allocationFailed }
        return pixelBuffer
    }
}
