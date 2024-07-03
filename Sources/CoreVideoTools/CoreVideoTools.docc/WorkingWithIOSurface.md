# Working with IOSurface

Create and manage IOSurface objects with ease using the CoreVideoTools extension.

## Overview

IOSurface provides a high-performance memory buffer that can be shared between processes and between the CPU and GPU. This guide shows you how to create and work with IOSurface objects using the CoreVideoTools extension.

## Creating an IOSurface

You can create an IOSurface using the `IOSurface.create(width:height:cvPixelFormat:bytesPerElement:bytesPerRow:cacheMode:additionalProperties:)` method. This method provides fine-grained control over the IOSurface properties.

```swift
do {
    let surface = try IOSurface.create(
        width: 1920,
        height: 1080,
        cvPixelFormat: .type_32BGRA,
        bytesPerElement: 4,
        bytesPerRow: 1920 * 4
    )
    print("Created IOSurface with dimensions: \(surface.width) x \(surface.height)")
} catch {
    print("Failed to create IOSurface: \(error)")
}
```

## Specifying Cache Mode

You can optimize memory access patterns by specifying a cache mode when creating an IOSurface:

```swift
let surface = try IOSurface.create(
    width: 1920,
    height: 1080,
    cvPixelFormat: .type_32BGRA,
    bytesPerElement: 4,
    bytesPerRow: 1920 * 4,
    cacheMode: .writeCombine
)
```

Available cache modes include:

- `.default`
- `.inhibit`
- `.writeThrough`
- `.copyback`
- `.writeCombine`
- `.copybackInner`
- `.postedWrite`
- `.realTime`
- `.postedReordered`
- `.postedCombinedReordered`

Choose the appropriate cache mode based on your specific use case and performance requirements.

## Adding Custom Properties

You can add custom properties when creating an IOSurface by using the additionalProperties parameter:

```swift
let surface = try IOSurface.create(
    width: 1920,
    height: 1080,
    cvPixelFormat: .type_32BGRA,
    bytesPerElement: 4,
    bytesPerRow: 1920 * 4,
    additionalProps: [
        .planeInfo: [
            [
                kIOSurfacePlaneWidth: 1920,
                kIOSurfacePlaneHeight: 1080,
                kIOSurfacePlaneBytesPerRow: 1920 * 4,
                kIOSurfacePlaneOffset: 0,
                kIOSurfacePlaneSize: 1920 * 1080 * 4
            ]
        ]
    ]
)
```

## Working with Pixel Formats

The `cvPixelFormat` parameter allows you to specify various pixel formats. Common formats include:

- `.type_32BGRA`
- `.type_32RGBA`
- `.type_16Gray`
- `.type_8IndexedGray_WhiteIsZero`

Ensure that the `bytesPerElement` and `bytesPerRow` values are appropriate for the chosen pixel format.

## Error Handling

The create method throws an error if the `IOSurface` creation fails. Always use proper error handling:

```swift
do {
    let surface = try IOSurface.create(
        width: 1920,
        height: 1080,
        cvPixelFormat: .type_32BGRA,
        bytesPerElement: 4,
        bytesPerRow: 1920 * 4
    )
    // Work with the surface
} catch {
    print("IOSurface creation failed: \(error)")
}
```
