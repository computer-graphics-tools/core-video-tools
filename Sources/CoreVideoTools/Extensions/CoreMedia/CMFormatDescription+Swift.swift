import CoreMedia

public extension CMFormatDescription {
    var mediaSubType: OSType {
        CMFormatDescriptionGetMediaSubType(self)
    }

    var cvPixelFormat: CVPixelFormat {
        mediaSubType.cvPixelFormat
    }

    var videoDimensions: CMVideoDimensions {
        CMVideoFormatDescriptionGetDimensions(self)
    }
}
