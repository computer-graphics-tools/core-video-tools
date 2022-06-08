# core-video-tools

A set of extensions and utilities to work with [CoreVideo](https://developer.apple.com/documentation/corevideo?language=objc) types.

## CVPixelFormat

While debuging `Core Video` objects, you need to understand what pixel format is used in them.
To do this using vanilla API you are forced to find a mathing `OSType` value, because `OSType` if basically a number.
This project uses [`CVPixelFormat`](Sources/CoreVideoTools/CVPixelFormat.swift) enum istead of vanilla `OSType` public vars which is much more handy, and you can easyly get a `description` of a current pixel format.

```swift
let cvPixelFormat: CVPixelFormat = cvPixelBuffer.cvPixelFormat
let description = cvPixelFormat.description
```

## Swifty API

There are a lot Swift wrappers over vanilla CVPixelBuffer C-style API:

**Vanilla API:**
```swift
let width = CVPixelBufferGetWidth(cvPixelBuffer)
let height = CVPixelBufferGetHeight(cvPixelBuffer)

// ...

let bytesPerElement = IOSurfaceGetBytesPerRow(ioSurface)
let bytesPerRow = IOSurfaceGetBytesPerRow(ioSurface)
```

**Swifty API:**
```swift
let width = cvPixelBuffer.width
let height = cvPixelBuffer.height

// ...

let bytesPerElement = ioSurface.bytesPerElement
let bytesPerRow = ioSurface.bytesPerRow
```

## CVReturn Result & CVError

There are some functions in Core Video that return a code which helps if the operation succeeded. 
This project aims to simplify this error checking. `CVReturn` [`Result`](Sources/CoreVideoTools/Extensions/CoreVideo/CVReturn/CVReturn+Result.swift) and [`CVError`](Sources/CoreVideoTools/CVError.swift) types are used to wrap vanilla API with thowable functions.

**Vanilla API:**
```swift
let returnCode = CVPixelBufferLockBaseAddress(cvPixelBuffer, lockFlags)
guard returnCode == kCVReturnSuccess else { // handle the error ...
```

**Swifty API:**
```swift
try cvPixelBuffer.lockBaseAddress(lockFlags: lockFlags)
```
