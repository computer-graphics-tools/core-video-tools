import CoreVideo

public extension OSType {
    var cvPixelFormat: CVPixelFormat { CVPixelFormat(rawValue: self)}
}
