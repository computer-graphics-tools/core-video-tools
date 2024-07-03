/// Represents CoreVideo specific error codes.
public enum CVError: Error, Equatable {
    /// An otherwise undefined error occurred.
    case error
    /// At least one of the arguments passed in is not valid. Either out of range or the wrong type.
    case invalidArgument
    /// The allocation for a buffer or buffer pool failed. Most likely because of lack of resources.
    case allocationFailed
    /// The operation or feature is not supported.
    case unsupported
    
    // DisplayLink related errors
    
    /// A CVDisplayLink cannot be created for the given DisplayRef.
    case invalidDisplay
    /// The CVDisplayLink is already started and running.
    case displayLinkAlreadyRunning
    /// The CVDisplayLink has not been started.
    case displayLinkNotRunning
    /// The output callback is not set.
    case displayLinkCallbacksNotSet
    
    // Buffer related errors
    
    /// The requested pixel format is not supported for the CVBuffer type.
    case invalidPixelFormat
    /// The requested size (most likely too big) is not supported for the CVBuffer type.
    case invalidSize
    /// A CVBuffer cannot be created with the given attributes.
    case invalidPixelBufferAttributes
    /// The Buffer cannot be used with OpenGL as either its size, pixel format or attributes are not supported by OpenGL.
    case pixelBufferNotOpenGLCompatible
    /// The Buffer cannot be used with Metal as either its size, pixel format or attributes are not supported by Metal.
    case pixelBufferNotMetalCompatible
    
    // Buffer Pool related errors
    
    /// The allocation request failed because it would have exceeded a specified allocation threshold (see kCVPixelBufferPoolAllocationThresholdKey).
    case wouldExceedAllocationThreshold
    /// The allocation for the buffer pool failed. Most likely because of lack of resources. Check if your parameters are in range.
    case poolAllocationFailed
    /// A CVBufferPool cannot be created with the given attributes.
    case invalidPoolAttributes
    /// A scan hasn't completely traversed the CVBufferPool due to a concurrent operation. The client can retry the scan.
    case retry
    
    /// Initializes a `CVError` value from a raw `CVReturn` value.
    /// - Parameter rawValue: The vanilla `CVReturn` value.
    /// - Returns: The corresponding `CVError` instance.
    public init(rawValue: CVReturn) {
        switch rawValue {
        case kCVReturnInvalidArgument: self = .invalidArgument
        case kCVReturnAllocationFailed: self = .allocationFailed
        case kCVReturnUnsupported: self = .unsupported
        case kCVReturnInvalidDisplay: self = .invalidDisplay
        case kCVReturnDisplayLinkAlreadyRunning: self = .displayLinkAlreadyRunning
        case kCVReturnDisplayLinkNotRunning: self = .displayLinkNotRunning
        case kCVReturnDisplayLinkCallbacksNotSet: self = .displayLinkCallbacksNotSet
        case kCVReturnInvalidPixelFormat: self = .invalidPixelFormat
        case kCVReturnInvalidSize: self = .invalidSize
        case kCVReturnInvalidPixelBufferAttributes: self = .invalidPixelBufferAttributes
        case kCVReturnPixelBufferNotOpenGLCompatible: self = .pixelBufferNotOpenGLCompatible
        case kCVReturnPixelBufferNotMetalCompatible: self = .pixelBufferNotMetalCompatible
        case kCVReturnWouldExceedAllocationThreshold: self = .wouldExceedAllocationThreshold
        case kCVReturnPoolAllocationFailed: self = .poolAllocationFailed
        case kCVReturnInvalidPoolAttributes: self = .invalidPoolAttributes
        case kCVReturnRetry: self = .retry
        default: self = .error
        }
    }
    
    /// The raw `CVReturn` value corresponding to this `CVError`.
    public var rawValue: CVReturn {
        switch self {
        case .error: return kCVReturnError
        case .invalidArgument: return kCVReturnInvalidArgument
        case .allocationFailed: return kCVReturnAllocationFailed
        case .unsupported: return kCVReturnUnsupported
        case .invalidDisplay: return kCVReturnInvalidDisplay
        case .displayLinkAlreadyRunning: return kCVReturnDisplayLinkAlreadyRunning
        case .displayLinkNotRunning: return kCVReturnDisplayLinkNotRunning
        case .displayLinkCallbacksNotSet: return kCVReturnDisplayLinkCallbacksNotSet
        case .invalidPixelFormat: return kCVReturnInvalidPixelFormat
        case .invalidSize: return kCVReturnInvalidSize
        case .invalidPixelBufferAttributes: return kCVReturnInvalidPixelBufferAttributes
        case .pixelBufferNotOpenGLCompatible: return kCVReturnPixelBufferNotOpenGLCompatible
        case .pixelBufferNotMetalCompatible: return kCVReturnPixelBufferNotMetalCompatible
        case .wouldExceedAllocationThreshold: return kCVReturnWouldExceedAllocationThreshold
        case .poolAllocationFailed: return kCVReturnPoolAllocationFailed
        case .invalidPoolAttributes: return kCVReturnInvalidPoolAttributes
        case .retry: return kCVReturnRetry
        }
    }
}
