import Foundation
import IOSurface

public extension IOSurfaceRef {
    
    func lock(
        options: IOSurfaceLockOptions = [],
        seed: UnsafeMutablePointer<UInt32>? = nil
    ) -> kern_return_t {
        return IOSurfaceLock(
            self,
            options,
            seed
        )
    }

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

    var allocationSize: Int { IOSurfaceGetAllocSize(self) }
    var width: Int { IOSurfaceGetWidth(self) }
    var height: Int { IOSurfaceGetHeight(self) }
    var bytesPerElement: Int { IOSurfaceGetBytesPerRow(self) }
    var bytesPerRow: Int { IOSurfaceGetBytesPerRow(self) }
    var baseAddress: UnsafeMutableRawPointer { IOSurfaceGetBaseAddress(self) }
    var elementWidth: Int { IOSurfaceGetElementWidth(self) }
    var elementHeight: Int { IOSurfaceGetElementHeight(self) }
    var pixelFormat: OSType { IOSurfaceGetPixelFormat(self) }
    var seed: UInt32 { IOSurfaceGetSeed(self) }
    var planeCount: Int { IOSurfaceGetPlaneCount(self) }
    var subsampling: IOSurfaceSubsampling { IOSurfaceGetSubsampling(self) }
    var useCount: Int32 { IOSurfaceGetUseCount(self) }
    var isInUse: Bool { IOSurfaceIsInUse(self) }
    var allowsPixelSizeCasting: Bool { IOSurfaceAllowsPixelSizeCasting(self) }
    
    func widthOfPlane(at planeIndex: Int) -> Int {
        return IOSurfaceGetWidthOfPlane(self, planeIndex)
    }
    func heightOfPlane(at planeIndex: Int) -> Int {
        return IOSurfaceGetHeightOfPlane(self, planeIndex)
    }
    func bytesPerElementOfPlane(at planeIndex: Int) -> Int {
        return IOSurfaceGetBytesPerElementOfPlane(self, planeIndex)
    }
    func bytesPerRowOfPlane(at planeIndex: Int) -> Int {
        return IOSurfaceGetBytesPerRowOfPlane(self, planeIndex)
    }
    func baseAddressOfPlane(at planeIndex: Int) -> UnsafeMutableRawPointer {
        return IOSurfaceGetBaseAddressOfPlane(self, planeIndex)
    }
    func elementWidthOfPlane(at planeIndex: Int) -> Int {
        return IOSurfaceGetElementWidthOfPlane(self, planeIndex)
    }
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
    
    func set(value: AnyObject, for key: String) {
        IOSurfaceSetValue(self, key as CFString, value)
    }
    func copyValue(for key: String) -> AnyObject? {
        return IOSurfaceCopyValue(self, key as CFString)
    }
    func removeValue(for key: String) {
        IOSurfaceRemoveValue(self, key as CFString)
    }
    func set(values: CFDictionary) {
        IOSurfaceSetValues(self, values)
    }
    func copyAllValues() -> CFDictionary? {
        return IOSurfaceCopyAllValues(self)
    }
    func removeAllValues() {
        IOSurfaceRemoveAllValues(self)
    }
    
    func createMachPort() -> mach_port_t {
        return IOSurfaceCreateMachPort(self)
    }
    func lookupFromMachPort(_ port: mach_port_t) -> IOSurfaceRef? {
        return IOSurfaceLookupFromMachPort(port)
    }
    func maximum(of property: String) -> Int {
        return IOSurfaceGetPropertyMaximum(property as CFString)
    }
    func alignment(of property: String) -> Int {
        return IOSurfaceGetPropertyAlignment(property as CFString)
    }
    func align(property: String, value: Int) -> Int {
        return IOSurfaceAlignProperty(property as CFString, value)
    }
    
    func incrementUseCount() {
        IOSurfaceIncrementUseCount(self)
    }
    func decrementUseCount() {
        IOSurfaceDecrementUseCount(self)
    }

    @available(iOS 11.0, *)
    func setPurgeable(_ newState: UInt32, oldState: UnsafeMutablePointer<UInt32>?) -> kern_return_t {
        return IOSurfaceSetPurgeable(self, newState, oldState)
    }
}
