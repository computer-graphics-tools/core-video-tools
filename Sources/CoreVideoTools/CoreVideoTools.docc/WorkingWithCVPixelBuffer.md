# Working with CVPixelBuffer

Learn how to create, manipulate, and access pixel buffer data using the CoreVideoTools package.

## Overview

`CVPixelBuffer` is a fundamental type in CoreVideo that represents an image buffer. CoreVideoTools provides extensions to `CVPixelBuffer` that make it easier to work with in Swift. This guide will walk you through common operations and best practices when working with `CVPixelBuffer` in your Swift projects.

## Creating a CVPixelBuffer

You can create a new `CVPixelBuffer` using the `create(width:height:cvPixelFormat:attachments:allocator:)` method:

```swift
do {
    let pixelBuffer = try CVPixelBuffer.create(
        width: 1920,
        height: 1080,
        cvPixelFormat: .type_32BGRA
    )
    print("Created pixel buffer with dimensions: \(pixelBuffer.width) x \(pixelBuffer.height)")
} catch {
    print("Failed to create pixel buffer: \(error)")
}
```

## Accessing Pixel Buffer Properties

CoreVideoTools provides convenient properties to access pixel buffer information:

```swift
let width = pixelBuffer.width
let height = pixelBuffer.height
let format = pixelBuffer.cvPixelFormat
let bytesPerRow = pixelBuffer.bytesPerRow

print("Pixel Buffer: \(width)x\(height), Format: \(format), Bytes per row: \(bytesPerRow)")
```

## Locking and Unlocking

Before accessing the pixel buffer's data, you need to lock it. Always remember to unlock when you're done:

```swift
do {
    try pixelBuffer.lockBaseAddress(lockFlags: .readOnly)
    defer {
        try? pixelBuffer.unlockBaseAddress(unlockFlags: .readOnly)
    }
    
    // Access pixel data here
    if let baseAddress = pixelBuffer.baseAddress {
        // Work with the pixel data
    }
} catch {
    print("Failed to lock pixel buffer: \(error)")
}
```

## Copying Pixel Buffers

CoreVideoTools provides methods to create copies of pixel buffers:

```swift
do {
    // Create an empty copy with the same parameters
    let blankCopy = try pixelBuffer.blankCopy()
    
    // Create a deep copy with the same content
    let deepCopy = try pixelBuffer.deepCopy()
} catch {
    print("Failed to copy pixel buffer: \(error)")
}
```

## Accessing Pixel Data

You can access the raw pixel data as a `Data` object:

```swift
do {
    try pixelBuffer.lockBaseAddress(lockFlags: .readOnly)
    defer {
        try? pixelBuffer.unlockBaseAddress(unlockFlags: .readOnly)
    }
    
    if let pixelData = pixelBuffer.data() {
        // Work with pixelData
        print("Pixel buffer data size: \(pixelData.count) bytes")
    }
} catch {
    print("Failed to access pixel data: \(error)")
}
```

## Working with Planar Pixel Buffers

For planar pixel formats, you can access individual planes:

```swift
let planeCount = pixelBuffer.planeCount

for plane in 0..<planeCount {
    let width = pixelBuffer.width(of: plane)
    let height = pixelBuffer.height(of: plane)
    let bytesPerRow = pixelBuffer.bytesPerRow(of: plane)
    
    print("Plane \(plane): \(width)x\(height), Bytes per row: \(bytesPerRow)")
    
    if let planeData = pixelBuffer.data(of: plane) {
        // Work with planeData
    }
}
```

## Best Practices

1. Always lock the pixel buffer before accessing its data and unlock it when you're done.
2. Use the appropriate lock flags (.readOnly or [] for read-write) based on your needs.
3. Handle errors when creating or manipulating pixel buffers.
4. Be mindful of memory usage, especially when working with large pixel buffers or creating multiple copies.

By following these guidelines and utilizing the convenience methods provided by CoreVideoTools, you can efficiently work with CVPixelBuffer in your Swift projects.
