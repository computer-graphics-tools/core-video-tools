# CoreVideoTools

[![Platform Compatibility](https://img.shields.io/badge/Platforms-iOS%20|%20macOS-brightgreen)](https://swift.org/platforms/)
[![Swift Version](https://img.shields.io/badge/Swift-5.9-orange)](https://swift.org)

<p align="left">
    <img src="Sources/CoreVideoTools/CoreVideoTools.docc/Resources/table-of-contents-art/core-video-tools@2x.png", width="120">
</p>

## Overview

CoreVideoTools offers a more idiomatic Swift interface to `CoreVideo` functionality, making it easier and safer to work with `CVPixelBuffers`, `IOSurfaces`, and related `CoreVideo` concepts in Swift code.

Please see [the package's documentation](https://swiftpackageindex.com/computer-graphics-tools/core-video-tools/documentation/corevideotools)
for more detailed usage instructions.

## CVPixelBuffer

There are a lot Swift wrappers over vanilla CVPixelBuffer C-style API:

**Swifty API:**

```swift
let width = pixelBuffer.width
let height = pixelBuffer.height
let format = pixelBuffer.cvPixelFormat
let bytesPerRow = pixelBuffer.bytesPerRow
```

**Convenience Init:**

```swift
let pixelBuffer = try CVPixelBuffer.create(
    width: 1920,
    height: 1080,
    cvPixelFormat: .type_32BGRA
)
```

Check out more examples in the [Working With CVPixelBuffer](Sources/CoreVideoTools/CoreVideoTools.docc/WorkingWithCVPixelBuffer.md).

## IOSurface

**Convenience Init:**

```swift
let surface = try IOSurface.create(
    width: 1920,
    height: 1080,
    cvPixelFormat: .type_32BGRA,
    bytesPerElement: 4,
    bytesPerRow: 1920 * 4
)
```

For more detail, please checkout [Working With IOSurface](Sources/CoreVideoTools/CoreVideoTools.docc/WorkingWithIOSurface.md).

## CVPixelFormat

While debuging `Core Video` objects, you need to understand what pixel format is used in them.
To do this using vanilla API you are forced to find a matching `OSType` value, because `OSType` if basically a number.
This project uses [`CVPixelFormat`](Sources/CoreVideoTools/CVPixelFormat.swift) enum istead of vanilla `OSType` public vars which is much more handy, and you can easily get a `description` of a current pixel format.

```swift
let cvPixelFormat: CVPixelFormat = cvPixelBuffer.cvPixelFormat
let description = cvPixelFormat.description
```

## CVReturn Result & CVError

There are some functions in Core Video that return a code which helps if the operation succeeded.
This project aims to simplify this error checking. `CVReturn` [`Result`](Sources/CoreVideoTools/Extensions/CoreVideo/CVReturn/CVReturn+Result.swift) and [`CVError`](Sources/CoreVideoTools/CVError.swift) types are used to wrap vanilla API with thowable functions.

**Vanilla API:**

```swift
let returnCode = CVPixelBufferLockBaseAddress(cvPixelBuffer, lockFlags)
guard returnCode == kCVReturnSuccess else { /* handle the error ... */ }
```

**Swifty API:**

```swift
try cvPixelBuffer.lockBaseAddress(lockFlags: lockFlags)
```

## License

MetalTools is licensed under [MIT license](LICENSE).
