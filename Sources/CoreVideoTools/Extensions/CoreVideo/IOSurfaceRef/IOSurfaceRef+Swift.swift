import Foundation

public extension IOSurfaceRef {
    
    enum PropertyKey {
        /// `CFNumber` of the total allocation size of the buffer including all planes.
        ///
        /// Defaults to BufferHeight. BytesPerRow if not specified. Must be specified for dimensionless buffers.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case allocSize
        
        /// `CFNumber` for the width of the `IOSurface` buffer in pixels.
        ///
        /// Required for planar `IOSurfaces`.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case width
        
        /// `CFNumber` for the height of the `IOSurface` buffer in pixels.
        ///
        /// Required for planar `IOSurfaces`.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case height
        
        /// `CFNumber` for the bytes per row of the buffer.
        ///
        /// If not specified, `IOSurface` will first calculate the number full elements required on each row (by rounding up),
        /// multiplied by the bytes per element for this buffer.
        /// That value will then be appropriately aligned.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case bytesPerRow
        
        /// `CFNumber` for the total number of bytes in an element.
        ///
        /// Default to 1.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case bytesPerElement
        
        /// `CFNumber` for how many pixels wide each element is.
        ///
        /// Defaults to 1.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case elementWidth
        
        /// `CFNumber` for how many pixels high each element is.
        ///
        /// Defaults to 1.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case elementHeight
        
        /// `CFNumber` for the starting offset into the buffer.
        ///
        /// Defaults to 0.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case offset
        
        /// `CFArray` describing each image plane in the buffer as a `CFDictionary`.
        ///
        /// The `CFArray` must have at least one entry.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case planeInfo
        
        /// `CFNumber` for the width of this plane in pixels.
        ///
        /// Required for image planes.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case planeWidth
        
        /// `CFNumber` for the height of this plane in pixels.
        ///
        /// Required for image planes.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case planeHeight
        
        /// `CFNumber` for the bytes per row of this plane.
        ///
        /// If not specified, `IOSurface` will first calculate the number full elements required on each row (by rounding up),
        /// multiplied by the bytes per element for this plane.
        /// That value will then be appropriately aligned.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case planeBytesPerRow
        
        /// `CFNumber` for the offset into the buffer for this plane.
        ///
        /// If not specified then `IOSurface` will lay out each plane sequentially based on the previous plane's allocation size.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case planeOffset
        
        /// `CFNumber` for the total data size of this plane.
        ///
        /// Defaults to plane height * plane bytes per row if not specified.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case planeSize
        
        /// `CFNumber` for the base offset into the buffer for this plane.
        ///
        /// Optional, defaults to the plane offset.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case planeBase
        
        /// `CFNumber` for the bits per element of this plane.
        ///
        /// Optional, default is 1.
        /// For use in cases where `.planeBytesPerElement` doesn't allow sufficient precision.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case planeBitsPerElement
        
        /// `CFNumber` for the bytes per element of this plane.
        ///
        /// Optional, default is 1.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case planeBytesPerElement
        
        /// `CFNumber` for the element width of this plane.
        ///
        /// Optional, default is 1.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case planeElementWidth
        
        /// `CFNumber` for the element height of this plane.
        ///
        /// Optional, default is 1.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case planeElementHeight
        
        /// `CFNumber` for the CPU cache mode to be used for the allocation.
        ///
        /// Default is kIOMapDefaultCache.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case cacheMode
        
        /// A 32-bit unsigned integer that stores the traditional Mac OS X buffer format.
        @available(iOS 11.0, macOS 10.6, macCatalyst 13.1, *)
        case pixelFormat
        
        /// If false the creator promises that there will be no pixel size casting when used on the GPU.  Default is true.
        @available(iOS 11.0, macOS 10.12, macCatalyst 13.1, *)
        case pixelSizeCastingAllowed
        
        /// `CFArray[CFNumber]` for bit depth of each component in this plane.
        @available(iOS 11.0, macOS 10.13, macCatalyst 13.1, *)
        case planeComponentBitDepths
        
        /// `CFArray[CFNumber]` for bit offset of each component in this plane, (low bit zero, high bit 7). For example 'BGRA' would be {0, 8, 16, 24}
        @available(iOS 11.0, macOS 10.13, macCatalyst 13.1, *)
        case planeComponentBitOffsets
        case unknown
        
        public var rawValue: CFString {
            switch self {
            case .allocSize: return kIOSurfaceAllocSize
            case .width: return kIOSurfaceWidth
            case .height: return kIOSurfaceHeight
            case .bytesPerRow: return kIOSurfaceBytesPerRow
            case .bytesPerElement: return kIOSurfaceBytesPerElement
            case .elementWidth: return kIOSurfaceElementWidth
            case .elementHeight: return kIOSurfaceElementHeight
            case .offset: return kIOSurfaceOffset
            case .planeInfo: return kIOSurfacePlaneInfo
            case .planeWidth: return kIOSurfacePlaneWidth
            case .planeHeight: return kIOSurfacePlaneHeight
            case .planeBytesPerRow: return kIOSurfacePlaneBytesPerRow
            case .planeOffset: return kIOSurfacePlaneOffset
            case .planeSize: return kIOSurfacePlaneSize
            case .planeBase: return kIOSurfacePlaneBase
            case .planeBitsPerElement: return kIOSurfacePlaneBitsPerElement
            case .planeBytesPerElement: return kIOSurfacePlaneBytesPerElement
            case .planeElementWidth: return kIOSurfacePlaneElementWidth
            case .planeElementHeight: return kIOSurfacePlaneElementHeight
            case .cacheMode: return kIOSurfaceCacheMode
            case .pixelFormat: return kIOSurfacePixelFormat
            case .pixelSizeCastingAllowed: return kIOSurfacePixelSizeCastingAllowed
            case .planeComponentBitDepths: return kIOSurfacePlaneComponentBitDepths
            case .planeComponentBitOffsets: return kIOSurfacePlaneComponentBitOffsets
            case .unknown: return "" as CFString
            }
        }
        
        init(rawValue: CFString) {
            switch rawValue {
            case kIOSurfaceAllocSize: self = .allocSize
            case kIOSurfaceWidth: self = .width
            case kIOSurfaceHeight: self = .height
            case kIOSurfaceBytesPerRow: self = .bytesPerRow
            case kIOSurfaceBytesPerElement: self = .bytesPerElement
            case kIOSurfaceElementWidth: self = .elementWidth
            case kIOSurfaceElementHeight: self = .elementHeight
            case kIOSurfaceOffset: self = .offset
            case kIOSurfacePlaneInfo: self = .planeInfo
            case kIOSurfacePlaneWidth: self = .planeWidth
            case kIOSurfacePlaneHeight: self = .planeHeight
            case kIOSurfacePlaneBytesPerRow: self = .planeBytesPerRow
            case kIOSurfacePlaneOffset: self = .planeOffset
            case kIOSurfacePlaneSize: self = .planeSize
            case kIOSurfacePlaneBase: self = .planeBase
            case kIOSurfacePlaneBitsPerElement: self = .planeBitsPerElement
            case kIOSurfacePlaneBytesPerElement: self = .planeBytesPerElement
            case kIOSurfacePlaneElementWidth: self = .planeElementWidth
            case kIOSurfacePlaneElementHeight: self = .planeElementHeight
            case kIOSurfaceCacheMode: self = .cacheMode
            case kIOSurfacePixelFormat: self = .pixelFormat
            case kIOSurfacePixelSizeCastingAllowed: self = .pixelSizeCastingAllowed
            case kIOSurfacePlaneComponentBitDepths: self = .planeComponentBitDepths
            case kIOSurfacePlaneComponentBitOffsets: self = .planeComponentBitOffsets
            default: self = .unknown
            }
        }
    }
    
    /// Returns the total allocation size of the buffer including all planes.
    var allocationSize: Int { IOSurfaceGetAllocSize(self) }
    
    /// Returns the width of the IOSurface buffer in pixels.
    var width: Int { IOSurfaceGetWidth(self) }
    
    /// Returns the height of the IOSurface buffer in pixels.
    var height: Int { IOSurfaceGetHeight(self) }
    
    /// Returns the length (in bytes) of each row in a particular buffer.
    var bytesPerElement: Int { IOSurfaceGetBytesPerRow(self) }
    
    /// Returns the length (in bytes) of each row in a particular buffer.
    var bytesPerRow: Int { IOSurfaceGetBytesPerRow(self) }
    
    /// Returns the address of the first byte of data in a particular buffer.
    /// - Returns: Returns `nil` if buffer is invalid.
    var baseAddress: UnsafeMutableRawPointer { IOSurfaceGetBaseAddress(self) }
    
    /// Returns the width (in pixels) of each element in a particular buffer.
    var elementWidth: Int { IOSurfaceGetElementWidth(self) }
    
    /// Returns the height (in pixels) of each element in a particular buffer.
    var elementHeight: Int { IOSurfaceGetElementHeight(self) }
    
    /// Returns an unsigned integer that contains the traditional macOS buffer format.
    var cvPixelFormat: CVPixelFormat { IOSurfaceGetPixelFormat(self).cvPixelFormat }
    
    /// This will return the current seed value of the buffer and is a cheap call to make to see if the contents of the buffer have changed since the last lock/unlock.
    var seed: UInt32 { IOSurfaceGetSeed(self) }
    
    /// Return the number of planes in this buffer. May be 0. Returns 0 for an invalid or `nil` buffer pointer.
    var planeCount: Int { IOSurfaceGetPlaneCount(self) }
    
    var subsampling: IOSurfaceSubsampling { IOSurfaceGetSubsampling(self) }
    
    /// Returns the per-process usage count for an IOSurface.
    var useCount: Int32 { IOSurfaceGetUseCount(self) }
    
    /// Returns true of an IOSurface is in use by any process in the system, otherwise false.
    var isInUse: Bool { IOSurfaceIsInUse(self) }
    
    var allowsPixelSizeCasting: Bool { IOSurfaceAllowsPixelSizeCasting(self) }
    
    /// “Lock” an IOSurface for reading or writing.
    ///
    /// The term “lock” is used loosely in this context, and is used along with the “unlock” information to put a bound on CPU access to the raw IOSurface data.
    /// If the seed parameter is non-NULL, IOSurfaceLock(_:_:_:) will store the buffer’s internal modification seed value at the time you made the lock call.
    /// You can compare this value to a value returned previously to determine of the contents of the buffer has been changed since the last lock.
    /// In the case of IOSurfaceUnlock(_:_:_:), the seed value returned will be the internal seed value at the time of the unlock.
    /// If you locked the buffer for writing, this value will be incremented as the unlock is performed and the new value will be returned.
    /// See IOSurface lock flags for more information.
    ///
    /// - Note: Locking and unlocking an IOSurface is not a particularly cheap operation, so care should be taken to avoid the calls whenever possible.
    /// The seed values are particularly useful for keeping a cache of the buffer contents.
    @discardableResult
    func lock(
        options: IOSurfaceLockOptions = [],
        seed: UnsafeMutablePointer<UInt32>? = nil
    ) -> kern_return_t {
        return IOSurfaceLock(self, options, seed)
    }
    
    /// “Unlock” an IOSurface for reading or writing.
    ///
    /// The term “lock” is used loosely in this context, and is used along with the “unlock” information to put a bound on CPU access to the raw IOSurface data.
    /// If the seed parameter is non-NULL, IOSurfaceLock(_:_:_:) will store the buffer’s internal modification seed value at the time you made the lock call. You can compare this value to a value returned previously to determine of the contents of the buffer has been changed since the last lock.
    /// In the case of IOSurfaceUnlock(_:_:_:), the seed value returned will be the internal seed value at the time of the unlock. If you locked the buffer for writing, this value will be incremented as the unlock is performed and the new value will be returned.
    /// See the kIOSurfaceLock enums for more information.
    ///
    /// - Note: Locking and unlocking an IOSurface is not a particularly cheap operation, so care should be taken to avoid the calls whenever possible.
    ///  The seed values are particularly useful for keeping a cache of the buffer contents.
    @discardableResult
    func unlock(
        options: IOSurfaceLockOptions = [],
        seed: UnsafeMutablePointer<UInt32>? = nil
    ) -> kern_return_t {
        return IOSurfaceUnlock(
            self,
            options,
            seed
        )
    }
    
    /// Returns the width of the specified plane (in pixels).
    ///
    /// If the planeIndex is greater than or equal to the plane count of the IOSurface, zero is returned.... with one exception.
    /// If this IOSurface has zero planes and a planeIndex of zero is passed in, the routines function just like the non-planar APIs.
    /// This is to allow higher level code to treat planar and non-planar buffers is a more uniform fashion.
    func widthOfPlane(at planeIndex: Int) -> Int {
        return IOSurfaceGetWidthOfPlane(self, planeIndex)
    }
    
    /// Returns the height of the specified plane (in pixels).
    ///
    /// If the planeIndex is greater than or equal to the plane count of the IOSurface, zero is returned.... with one exception.
    /// If this IOSurface has zero planes and a planeIndex of zero is passed in, the routines function just like the non-planar APIs.
    /// This is to allow higher level code to treat planar and non-planar buffers is a more uniform fashion.
    func heightOfPlane(at planeIndex: Int) -> Int {
        return IOSurfaceGetHeightOfPlane(self, planeIndex)
    }
    
    /// Returns the size of each element (in bytes) in the specified plane.
    ///
    /// If the planeIndex is greater than or equal to the plane count of the IOSurface, zero is returned.... with one exception.
    /// If this IOSurface has zero planes and a planeIndex of zero is passed in, the routines function just like the non-planar APIs.
    /// This is to allow higher level code to treat planar and non-planar buffers is a more uniform fashion.
    func bytesPerElementOfPlane(at planeIndex: Int) -> Int {
        return IOSurfaceGetBytesPerElementOfPlane(self, planeIndex)
    }
    
    /// Returns the size of each row (in bytes) in the specified plane.
    ///
    /// If the planeIndex is greater than or equal to the plane count of the IOSurface, zero is returned.... with one exception.
    /// If this IOSurface has zero planes and a planeIndex of zero is passed in, the routines function just like the non-planar APIs.
    /// This is to allow higher level code to treat planar and non-planar buffers is a more uniform fashion.
    func bytesPerRowOfPlane(at planeIndex: Int) -> Int {
        return IOSurfaceGetBytesPerRowOfPlane(self, planeIndex)
    }
    
    /// Returns the address of the first byte of data in the specified plane.
    ///
    /// If the planeIndex is greater than or equal to the plane count of the IOSurface, zero is returned.... with one exception.
    /// If this IOSurface has zero planes and a planeIndex of zero is passed in, the routines function just like the non-planar APIs.
    /// This is to allow higher level code to treat planar and non-planar buffers is a more uniform fashion.
    func baseAddressOfPlane(at planeIndex: Int) -> UnsafeMutableRawPointer {
        return IOSurfaceGetBaseAddressOfPlane(self, planeIndex)
    }
    
    /// Returns the width (in pixels) of each element in the specified plane.
    ///
    /// If the planeIndex is greater than or equal to the plane count of the IOSurface, zero is returned.... with one exception.
    /// If this IOSurface has zero planes and a planeIndex of zero is passed in, the routines function just like the non-planar APIs.
    /// This is to allow higher level code to treat planar and non-planar buffers is a more uniform fashion.
    func elementWidthOfPlane(at planeIndex: Int) -> Int {
        return IOSurfaceGetElementWidthOfPlane(self, planeIndex)
    }
    
    /// Returns the height of the specified plane (in pixels).
    ///
    /// If the planeIndex is greater than or equal to the plane count of the IOSurface, zero is returned.... with one exception.
    /// If this IOSurface has zero planes and a planeIndex of zero is passed in, the routines function just like the non-planar APIs.
    /// This is to allow higher level code to treat planar and non-planar buffers is a more uniform fashion.
    func elementHeightOfPlane(at planeIndex: Int) -> Int {
        return IOSurfaceGetHeightOfPlane(self, planeIndex)
    }
    
    func numberOfComponentsOfPlane(at planeIndex: Int) -> Int {
        return IOSurfaceGetNumberOfComponentsOfPlane(self, planeIndex)
    }
    func nameOfComponentsOfPlane(planeIndex: Int, componentIndex: Int) -> IOSurfaceComponentName {
        return IOSurfaceGetNameOfComponentOfPlane(self, planeIndex, componentIndex)
    }
    func typeOfComponentsOfPlane(planeIndex: Int, componentIndex: Int) -> IOSurfaceComponentType {
        return IOSurfaceGetTypeOfComponentOfPlane(self, planeIndex, componentIndex)
    }
    func rangeOfComponentsOfPlane(planeIndex: Int, componentIndex: Int) -> IOSurfaceComponentRange {
        return IOSurfaceGetRangeOfComponentOfPlane(self, planeIndex, componentIndex)
    }
    func bitDepthOfComponentsOfPlane(planeIndex: Int, componentIndex: Int) -> Int {
        return IOSurfaceGetBitDepthOfComponentOfPlane(self, planeIndex, componentIndex)
    }
    func bitOffsetOfComponentsOfPlane(planeIndex: Int, componentIndex: Int) -> Int {
        return IOSurfaceGetBitOffsetOfComponentOfPlane(self, planeIndex, componentIndex)
    }
    
    /// Sets a value in the dictionary associated with the buffer.
    func set(value: AnyObject, for key: PropertyKey) {
        IOSurfaceSetValue(self, key.rawValue, value)
    }
    
    /// Retrieves a value from the dictionary associated with the buffer.
    func copyValue(for key: PropertyKey) -> AnyObject? {
        return IOSurfaceCopyValue(self, key.rawValue)
    }
    
    /// Deletes a value in the dictionary associated with the buffer.
    func removeValue(for key: PropertyKey) {
        IOSurfaceRemoveValue(self, key.rawValue)
    }
    
    func set(values: [PropertyKey: Any]) {
        let cfValues = values.reduce(into: [:]) { $0[$1.key.rawValue] = $1.value } as CFDictionary
        IOSurfaceSetValues(self, cfValues)
    }
    func copyAllValues() -> [PropertyKey: Any]? {
        guard let cfValues = IOSurfaceCopyAllValues(self) as? [CFString: Any]
        else { return nil }
        return cfValues.reduce(into: [:]) { $0[PropertyKey(rawValue: $1.key)] = $1.value }
    }
    func removeAllValues() {
        IOSurfaceRemoveAllValues(self)
    }
    
    /// Returns a `mach_port_t` that holds a reference to the `IOSurface`.
    ///
    /// This is useful if you need to atomically or securely pass an `IOSurface` to another task without making the surface global to the entire system.
    /// The returned port must be deallocated with `mach_port_deallocate` or the equivalent.
    ///
    /// - Note: Any live mach ports created from an IOSurfaceRef implicitly increase the IOSurface's global use count by one until the port is deleted.
    func createMachPort() -> mach_port_t {
        return IOSurfaceCreateMachPort(self)
    }
    
    /// Increments the per-process usage count for an IOSurface.
    func incrementUseCount() {
        IOSurfaceIncrementUseCount(self)
    }
    
    /// Decrements the per-process usage count for an IOSurface.
    func decrementUseCount() {
        IOSurfaceDecrementUseCount(self)
    }

    func setPurgeable(_ newState: UInt32, oldState: UnsafeMutablePointer<UInt32>?) -> kern_return_t {
        return IOSurfaceSetPurgeable(self, newState, oldState)
    }

    /// Recreates an IOSurfaceRef from a mach port.
    ///
    /// This call takes a `mach_port_t` created via `createMachPort()` and recreates an `IOSurfaceRef` from it.
    ///
    /// - Note: Any live mach ports created from an `IOSurfaceRef` implicitly increase the IOSurface's global use count by one until the port is deleted.
    static func lookupFromMachPort(_ port: mach_port_t) -> IOSurfaceRef? {
        return IOSurfaceLookupFromMachPort(port)
    }
    
    /// Returns the maximum value for a given property that is guaranteed to be compatible with all of the current devices (GPUs, etc.) in the system.
    ///
    /// The most important values to obtain are:
    /// - `.bytesPerRow`
    /// - `.width`
    /// - `.height`
    /// - `.planeBytesPerRow`
    /// - `.planeWidth`
    /// - `.planeHeight`
    ///
    /// For the width and height properties, the maximum values are the largest that are guaranteed to work for both reading and writing.
    /// In OpenGL terms this translates into the largest size that will work for both textures and render targets.
    /// This function returns 0 for properties that have no predefined limit or where the concept of a limit would be considered invalid (such as kIOSurfacePixelFormat).
    static func maximum(of property: PropertyKey) -> Int {
        return IOSurfaceGetPropertyMaximum(property.rawValue)
    }
    
    /// Returns the alignment requirements for a property (if any).
    ///
    /// If the property has no alignment requirement then this function returns 1.
    /// The following properties should always be aligned if you choose to calculate them yourself:
    /// - `.bytesPerRow`
    /// - `.width`
    /// - `.height`
    /// - `.planeBytesPerRow`
    /// - `.planeWidth`
    /// - `.planeHeight`
    static func alignment(of property: PropertyKey) -> Int {
        return IOSurfaceGetPropertyAlignment(property.rawValue)
    }
    
    /// Returns the smallest aligned value greater than or equal to the specified value.
    ///
    /// For properties with no alignment requirements, the original value is returned.
    static func align(property: PropertyKey, value: Int) -> Int {
        return IOSurfaceAlignProperty(property.rawValue, value)
    }
}
