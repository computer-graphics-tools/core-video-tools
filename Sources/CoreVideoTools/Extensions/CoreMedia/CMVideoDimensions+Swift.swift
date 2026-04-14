import CoreMedia

public extension CMVideoDimensions {
    var shortSide: Int32 {
        Swift.min(width, height)
    }

    var longSide: Int32 {
        Swift.max(width, height)
    }

    var area: Int {
        Int(width) * Int(height)
    }
}
