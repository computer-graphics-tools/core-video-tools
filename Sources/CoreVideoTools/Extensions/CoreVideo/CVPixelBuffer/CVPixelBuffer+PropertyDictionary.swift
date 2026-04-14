import CoreVideo

public extension Dictionary where Key == CVPixelBuffer.PropertyKey {
    var rawPixelBufferAttributes: [String: Value] {
        reduce(into: [:]) { partialResult, entry in
            partialResult[entry.key.rawValue as String] = entry.value
        }
    }
}
