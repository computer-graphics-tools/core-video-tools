/// Extension on CVReturn to provide a more Swift-friendly error handling mechanism.
public extension CVReturn {

    /// Represents the result of a CoreVideo operation.
    enum Result {
        /// Indicates a successful operation.
        case success
        /// Indicates an error occurred during the operation.
        case error(CVError)

        /// Throws an error if the result is not successful.
        ///
        /// - Throws: The associated `CVError` if the result is an error.
        func throwOnError() throws {
            switch self {
            case .success: return
            case let .error(cvError): throw cvError
            }
        }
    }

    /// Converts the CVReturn value to a Result enum.
    ///
    /// This property maps the raw CVReturn values to either a success case or
    /// an error case with the corresponding CVError.
    var result: Result {
        switch self {
        case kCVReturnSuccess: return .success
        case kCVReturnAllocationFailed: return .error(.allocationFailed)
        case kCVReturnUnsupported: return .error(.unsupported)
        case kCVReturnInvalidDisplay: return .error(.invalidDisplay)
        case kCVReturnDisplayLinkAlreadyRunning: return .error(.displayLinkAlreadyRunning)
        case kCVReturnDisplayLinkNotRunning: return .error(.displayLinkNotRunning)
        case kCVReturnDisplayLinkCallbacksNotSet: return .error(.displayLinkCallbacksNotSet)
        case kCVReturnInvalidPixelFormat: return .error(.invalidPixelFormat)
        case kCVReturnInvalidSize: return .error(.invalidSize)
        case kCVReturnInvalidPixelBufferAttributes: return .error(.invalidPixelBufferAttributes)
        case kCVReturnPixelBufferNotOpenGLCompatible: return .error(.pixelBufferNotOpenGLCompatible)
        case kCVReturnPixelBufferNotMetalCompatible: return .error(.pixelBufferNotMetalCompatible)
        case kCVReturnWouldExceedAllocationThreshold: return .error(.wouldExceedAllocationThreshold)
        case kCVReturnPoolAllocationFailed: return .error(.poolAllocationFailed)
        case kCVReturnInvalidPoolAttributes: return .error(.invalidPoolAttributes)
        case kCVReturnRetry: return .error(.retry)
        default: return .error(.error)
        }
    }
}
