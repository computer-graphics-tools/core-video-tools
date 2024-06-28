# ``CoreVideoTools``

![CoreVideoTools](core-video-tools.png)

CoreVideo Tools offers a more idiomatic Swift interface to CoreVideo functionality, making it easier and safer to work with pixel buffers, IOSurfaces, and related CoreVideo concepts in Swift code.

## Topics

### Articles

- <doc:WorkingWithCVPixelBuffer>
- <doc:WorkingWithIOSurface>

### CVPixelBuffer Extensions

- ``CoreVideo/CVBuffer/width``
- ``CoreVideo/CVBuffer/height``
- ``CoreVideo/CVBuffer/cvPixelFormat``
- ``CoreVideo/CVBuffer/baseAddress``
- ``CoreVideo/CVBuffer/bytesPerRow``
- ``CoreVideo/CVBuffer/lockBaseAddress(lockFlags:)``
- ``CoreVideo/CVBuffer/unlockBaseAddress(unlockFlags:)``
- ``CoreVideo/CVBuffer/create(width:height:cvPixelFormat:attachments:allocator:)``
- ``CoreVideo/CVBuffer/blankCopy()``
- ``CoreVideo/CVBuffer/deepCopy()``

### IOSurface Extensions

- ``IOSurface/IOSurface/CacheMode``
- ``IOSurface/IOSurface/create(width:height:cvPixelFormat:bytesPerElement:bytesPerRow:cacheMode:additionalProperties:)``

### Error Handling

- ``CVError``
- ``Swift/Int32/Result``

### Pixel Formats

- ``CVPixelFormat``
