import CoreVideo

public extension CVReturn {
    
    enum Result {
        case success
        case error(CVError)
        
        func throwOnError() throws {
            switch self {
            case .success: return
            case let .error(cvError): throw cvError
            }
        }
    }
    
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

