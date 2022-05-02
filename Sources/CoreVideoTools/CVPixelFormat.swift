@_exported import CoreVideo
@_exported import Foundation

public enum CVPixelFormat: CustomStringConvertible, CaseIterable, Codable {
    /// 1 bit indexed
    case type_1Monochrome
    /// 2 bit indexed
    case type_2Indexed
    /// 4 bit indexed
    case type_4Indexed
    /// 8 bit indexed
    case type_8Indexed
    /// 1 bit indexed gray, white is zero
    case type_1IndexedGray_WhiteIsZero
    /// 2 bit indexed gray, white is zero
    case type_2IndexedGray_WhiteIsZero
    /// 4 bit indexed gray, white is zero
    case type_4IndexedGray_WhiteIsZero
    /// 8 bit indexed gray, white is zero
    case type_8IndexedGray_WhiteIsZero
    /// 16 bit BE RGB 555
    case type_16BE555
    /// 16 bit LE RGB 555
    case type_16LE555
    /// 16 bit LE RGB 5551
    case type_16LE5551
    /// 16 bit BE RGB 565
    case type_16BE565
    /// 16 bit LE RGB 565
    case type_16LE565
    /// 24 bit RGB
    case type_24RGB
    /// 24 bit BGR
    case type_24BGR
    /// 32 bit ARGB
    case type_32ARGB
    /// 32 bit BGRA
    case type_32BGRA
    /// 32 bit ABGR
    case type_32ABGR
    /// 32 bit RGBA
    case type_32RGBA
    /// 64 bit ARGB, 16-bit big-endian samples
    case type_64ARGB
    /// 64 bit RGBA, 16-bit little-endian full-range (0-65535) samples
    case type_64RGBALE
    /// 48 bit RGB, 16-bit big-endian samples
    case type_48RGB
    /// 32 bit AlphaGray, 16-bit big-endian samples, black is zero
    case type_32AlphaGray
    /// 16 bit Grayscale, 16-bit big-endian samples, black is zero
    case type_16Gray
    /// 30 bit RGB, 10-bit big-endian samples, 2 unused padding bits (at least significant end).
    case type_30RGB
    /// Component Y"CbCr 8-bit 4:2:2, ordered Cb Y"0 Cr Y"1
    case type_422YpCbCr8
    /// Component Y"CbCrA 8-bit 4:4:4:4, ordered Cb Y" Cr A
    case type_4444YpCbCrA8
    /// Component Y"CbCrA 8-bit 4:4:4:4, rendering format, full range alpha, zero biased YUV, ordered A Y" Cb Cr
    case type_4444YpCbCrA8R
    /// Component Y"CbCrA 8-bit 4:4:4:4, ordered A Y" Cb Cr, full range alpha, video range Y"CbCr.
    case type_4444AYpCbCr8
    /// Component Y"CbCrA 16-bit 4:4:4:4, ordered A Y" Cb Cr, full range alpha, video range Y"CbCr, 16-bit little-endian samples.
    case type_4444AYpCbCr16
    /// Component Y"CbCr 8-bit 4:4:4
    case type_444YpCbCr8
    /// Component Y"CbCr 10,12,14,16-bit 4:2:2
    case type_422YpCbCr16
    /// Component Y"CbCr 10-bit 4:2:2
    case type_422YpCbCr10
    /// Component Y"CbCr 10-bit 4:4:4
    case type_444YpCbCr10
    /// Planar Component Y"CbCr 8-bit 4:2:0.
    /// baseAddr points to a big-endian CVPlanarPixelBufferInfo_YCbCrPlanar struct
    case type_420YpCbCr8Planar
    /// Planar Component Y"CbCr 8-bit 4:2:0, full range.
    /// baseAddr points to a big-endian CVPlanarPixelBufferInfo_YCbCrPlanar struct
    case type_420YpCbCr8PlanarFullRange
    /// First plane: Video-range Component Y"CbCr 8-bit 4:2:2, ordered Cb Y"0 Cr Y"1;
    /// second plane: alpha 8-bit 0-255
    case type_422YpCbCr_4A_8BiPlanar
    /// Bi-Planar Component Y"CbCr 8-bit 4:2:0, video-range (luma=[16,235] chroma=[16,240]).
    /// baseAddr points to a big-endian CVPlanarPixelBufferInfo_YCbCrBiPlanar struct
    case type_420YpCbCr8BiPlanarVideoRange
    /// Bi-Planar Component Y"CbCr 8-bit 4:2:0, full-range (luma=[0,255] chroma=[1,255]).
    /// baseAddr points to a big-endian CVPlanarPixelBufferInfo_YCbCrBiPlanar struct
    case type_420YpCbCr8BiPlanarFullRange
    /// Bi-Planar Component Y"CbCr 8-bit 4:2:2, video-range (luma=[16,235] chroma=[16,240]).
    /// baseAddr points to a big-endian CVPlanarPixelBufferInfo_YCbCrBiPlanar struct
    case type_422YpCbCr8BiPlanarVideoRange
    /// Bi-Planar Component Y"CbCr 8-bit 4:2:2, full-range (luma=[0,255] chroma=[1,255]).
    /// baseAddr points to a big-endian CVPlanarPixelBufferInfo_YCbCrBiPlanar struct
    case type_422YpCbCr8BiPlanarFullRange
    /// Bi-Planar Component Y"CbCr 8-bit 4:4:4, video-range (luma=[16,235] chroma=[16,240]).
    /// baseAddr points to a big-endian CVPlanarPixelBufferInfo_YCbCrBiPlanar struct
    case type_444YpCbCr8BiPlanarVideoRange
    /// Bi-Planar Component Y"CbCr 8-bit 4:4:4, full-range (luma=[0,255] chroma=[1,255]).
    /// baseAddr points to a big-endian CVPlanarPixelBufferInfo_YCbCrBiPlanar struct
    case type_444YpCbCr8BiPlanarFullRange
    /// Component Y"CbCr 8-bit 4:2:2, ordered Y"0 Cb Y"1 Cr
    case type_422YpCbCr8_yuvs
    /// Component Y"CbCr 8-bit 4:2:2, full range, ordered Y"0 Cb Y"1 Cr
    case type_422YpCbCr8FullRange
    /// 8 bit one component, black is zero
    case type_OneComponent8
    /// 8 bit two component, black is zero
    case type_TwoComponent8
    /// little-endian RGB101010, 2 MSB are zero, wide-gamut (384-895)
    case type_30RGBLEPackedWideGamut
    /// little-endian ARGB2101010 full-range ARGB
    case type_ARGB2101010LEPacked
    /// little-endian ARGB10101010, each 10 bits in the MSBs of 16bits, wide-gamut (384-895, including alpha)
    case type_40ARGBLEWideGamut
    /// little-endian ARGB10101010, each 10 bits in the MSBs of 16bits, wide-gamut (384-895, including alpha). Alpha premultiplied
    case type_40ARGBLEWideGamutPremultiplied
    /// 10 bit little-endian one component, stored as 10 MSBs of 16 bits, black is zero
    case type_OneComponent10
    /// 12 bit little-endian one component, stored as 12 MSBs of 16 bits, black is zero
    case type_OneComponent12
    /// 16 bit little-endian one component, black is zero
    case type_OneComponent16
    /// 16 bit little-endian two component, black is zero
    case type_TwoComponent16
    /// 16 bit one component IEEE half-precision float, 16-bit little-endian samples
    case type_OneComponent16Half
    /// 32 bit one component IEEE float, 32-bit little-endian samples
    case type_OneComponent32Float
    /// 16 bit two component IEEE half-precision float, 16-bit little-endian samples
    case type_TwoComponent16Half
    /// 32 bit two component IEEE float, 32-bit little-endian samples
    case type_TwoComponent32Float
    /// 64 bit RGBA IEEE half-precision float, 16-bit little-endian samples
    case type_64RGBAHalf
    /// 128 bit RGBA IEEE float, 32-bit little-endian samples
    case type_128RGBAFloat
    /// Bayer 14-bit Little-Endian, packed in 16-bits, ordered G R G R... alternating with B G B G...
    case type_14Bayer_GRBG
    /// Bayer 14-bit Little-Endian, packed in 16-bits, ordered R G R G... alternating with G B G B...
    case type_14Bayer_RGGB
    /// Bayer 14-bit Little-Endian, packed in 16-bits, ordered B G B G... alternating with G R G R...
    case type_14Bayer_BGGR
    /// Bayer 14-bit Little-Endian, packed in 16-bits, ordered G B G B... alternating with R G R G...
    case type_14Bayer_GBRG
    /// IEEE754-2008 binary16 (half float), describing the normalized shift when comparing two images.
    /// Units are 1/meters: ( pixelShift / (pixelFocalLength * baselineInMeters) )
    case type_DisparityFloat16
    /// IEEE754-2008 binary32 float, describing the normalized shift when comparing two images.
    /// Units are 1/meters: ( pixelShift / (pixelFocalLength * baselineInMeters) )
    case type_DisparityFloat32
    /// IEEE754-2008 binary16 (half float), describing the depth (distance to an object) in meters
    case type_DepthFloat16
    /// IEEE754-2008 binary32 float, describing the depth (distance to an object) in meters
    case type_DepthFloat32
    /// 2 plane YCbCr10 4:2:0, each 10 bits in the MSBs of 16bits, video-range (luma=[64,940] chroma=[64,960])
    case type_420YpCbCr10BiPlanarVideoRange
    /// 2 plane YCbCr10 4:2:2, each 10 bits in the MSBs of 16bits, video-range (luma=[64,940] chroma=[64,960])
    case type_422YpCbCr10BiPlanarVideoRange
    /// 2 plane YCbCr10 4:4:4, each 10 bits in the MSBs of 16bits, video-range (luma=[64,940] chroma=[64,960])
    case type_444YpCbCr10BiPlanarVideoRange
    /// 2 plane YCbCr10 4:2:0, each 10 bits in the MSBs of 16bits, full-range (Y range 0-1023)
    case type_420YpCbCr10BiPlanarFullRange
    /// 2 plane YCbCr10 4:2:2, each 10 bits in the MSBs of 16bits, full-range (Y range 0-1023)
    case type_422YpCbCr10BiPlanarFullRange
    /// 2 plane YCbCr10 4:4:4, each 10 bits in the MSBs of 16bits, full-range (Y range 0-1023)
    case type_444YpCbCr10BiPlanarFullRange
    /// first and second planes as per 420YpCbCr8BiPlanarVideoRange (420v), alpha 8 bits in third plane full-range.
    /// No CVPlanarPixelBufferInfo struct.
    case type_420YpCbCr8VideoRange_8A_TriPlanar
    /// Single plane Bayer 16-bit little-endian sensor element ("sensel") samples from full-size decoding of ProRes RAW images;
    /// Bayer pattern (sensel ordering) and other raw conversion, information is described via buffer attachments
    case type_16VersatileBayer
    /// Single plane 64-bit RGBA (16-bit little-endian samples) from downscaled decoding of ProRes RAW images;
    /// components--which may not be co-sited with one another--are sensel values, and require raw conversion,
    /// information for which is described via buffer attachments
    case type_64RGBA_DownscaledProResRAW
    /// 2 plane YCbCr16 4:2:2, video-range (luma=[4096,60160] chroma=[4096,61440])
    case type_422YpCbCr16BiPlanarVideoRange
    /// 2 plane YCbCr16 4:4:4, video-range (luma=[4096,60160] chroma=[4096,61440])
    case type_444YpCbCr16BiPlanarVideoRange
    /// 3 plane video-range YCbCr16 4:4:4 with 16-bit full-range alpha (luma=[4096,60160] chroma=[4096,61440] alpha=[0,65535]).
    /// No CVPlanarPixelBufferInfo struct.
    case type_444YpCbCr16VideoRange_16A_TriPlanar
    /// Lossless-compressed form of type_32BGRA.
    case type_Lossless_32BGRA
    /// Lossless-compressed form of type_420YpCbCr8BiPlanarVideoRange.
    /// No CVPlanarPixelBufferInfo struct.
    case type_Lossless_420YpCbCr8BiPlanarVideoRange
    /// Lossless-compressed form of type_420YpCbCr8BiPlanarFullRange.
    /// No CVPlanarPixelBufferInfo struct.
    case type_Lossless_420YpCbCr8BiPlanarFullRange
    /// Lossless-compressed-packed form of type_420YpCbCr10BiPlanarVideoRange.
    /// No CVPlanarPixelBufferInfo struct.
    /// Format is compressed-packed with no padding bits between pixels.
    case type_Lossless_420YpCbCr10PackedBiPlanarVideoRange
    /// Lossless-compressed form of type_422YpCbCr10BiPlanarVideoRange.
    /// No CVPlanarPixelBufferInfo struct.
    /// Format is compressed-packed with no padding bits between pixels.
    case type_Lossless_422YpCbCr10PackedBiPlanarVideoRange
    /// Lossy-compressed form of type_32BGRA.
    /// No CVPlanarPixelBufferInfo struct.
    case type_Lossy_32BGRA
    /// Lossy-compressed form of type_420YpCbCr8BiPlanarVideoRange.
    /// No CVPlanarPixelBufferInfo struct.
    case type_Lossy_420YpCbCr8BiPlanarVideoRange
    /// Lossy-compressed form of type_420YpCbCr8BiPlanarFullRange.
    /// No CVPlanarPixelBufferInfo struct.
    case type_Lossy_420YpCbCr8BiPlanarFullRange
    /// Lossy-compressed form of type_420YpCbCr10BiPlanarVideoRange.
    /// No CVPlanarPixelBufferInfo struct.
    /// Format is compressed-packed with no padding bits between pixels.
    case type_Lossy_420YpCbCr10PackedBiPlanarVideoRange
    /// Lossy-compressed form of type_422YpCbCr10BiPlanarVideoRange.
    /// No CVPlanarPixelBufferInfo struct.
    /// Format is compressed-packed with no padding bits between pixels.
    case type_Lossy_422YpCbCr10PackedBiPlanarVideoRange
    case unknown
    
    public init(rawValue: OSType) {
        switch rawValue {
        case kCVPixelFormatType_1Monochrome: self = .type_1Monochrome
        case kCVPixelFormatType_2Indexed: self = .type_2Indexed
        case kCVPixelFormatType_4Indexed: self = .type_4Indexed
        case kCVPixelFormatType_8Indexed: self = .type_8Indexed
        case kCVPixelFormatType_1IndexedGray_WhiteIsZero: self = .type_1IndexedGray_WhiteIsZero
        case kCVPixelFormatType_2IndexedGray_WhiteIsZero: self = .type_2IndexedGray_WhiteIsZero
        case kCVPixelFormatType_4IndexedGray_WhiteIsZero: self = .type_4IndexedGray_WhiteIsZero
        case kCVPixelFormatType_8IndexedGray_WhiteIsZero: self = .type_8IndexedGray_WhiteIsZero
        case kCVPixelFormatType_16BE555: self = .type_16BE555
        case kCVPixelFormatType_16LE555: self = .type_16LE555
        case kCVPixelFormatType_16LE5551: self = .type_16LE5551
        case kCVPixelFormatType_16BE565: self = .type_16BE565
        case kCVPixelFormatType_16LE565: self = .type_16LE565
        case kCVPixelFormatType_24RGB: self = .type_24RGB
        case kCVPixelFormatType_24BGR: self = .type_24BGR
        case kCVPixelFormatType_32ARGB: self = .type_32ARGB
        case kCVPixelFormatType_32BGRA: self = .type_32BGRA
        case kCVPixelFormatType_32ABGR: self = .type_32ABGR
        case kCVPixelFormatType_32RGBA: self = .type_32RGBA
        case kCVPixelFormatType_64ARGB: self = .type_64ARGB
        case kCVPixelFormatType_64RGBALE: self = .type_64RGBALE
        case kCVPixelFormatType_48RGB: self = .type_48RGB
        case kCVPixelFormatType_32AlphaGray: self = .type_32AlphaGray
        case kCVPixelFormatType_16Gray: self = .type_16Gray
        case kCVPixelFormatType_30RGB: self = .type_30RGB
        case kCVPixelFormatType_422YpCbCr8: self = .type_422YpCbCr8
        case kCVPixelFormatType_4444YpCbCrA8: self = .type_4444YpCbCrA8
        case kCVPixelFormatType_4444YpCbCrA8R: self = .type_4444YpCbCrA8R
        case kCVPixelFormatType_4444AYpCbCr8: self = .type_4444AYpCbCr8
        case kCVPixelFormatType_4444AYpCbCr16: self = .type_4444AYpCbCr16
        case kCVPixelFormatType_444YpCbCr8: self = .type_444YpCbCr8
        case kCVPixelFormatType_422YpCbCr16: self = .type_422YpCbCr16
        case kCVPixelFormatType_422YpCbCr10: self = .type_422YpCbCr10
        case kCVPixelFormatType_444YpCbCr10: self = .type_444YpCbCr10
        case kCVPixelFormatType_420YpCbCr8Planar: self = .type_420YpCbCr8Planar
        case kCVPixelFormatType_420YpCbCr8PlanarFullRange: self = .type_420YpCbCr8PlanarFullRange
        case kCVPixelFormatType_422YpCbCr_4A_8BiPlanar: self = .type_422YpCbCr_4A_8BiPlanar
        case kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange: self = .type_420YpCbCr8BiPlanarVideoRange
        case kCVPixelFormatType_420YpCbCr8BiPlanarFullRange: self = .type_420YpCbCr8BiPlanarFullRange
        case kCVPixelFormatType_422YpCbCr8BiPlanarVideoRange: self = .type_422YpCbCr8BiPlanarVideoRange
        case kCVPixelFormatType_422YpCbCr8BiPlanarFullRange: self = .type_422YpCbCr8BiPlanarFullRange
        case kCVPixelFormatType_444YpCbCr8BiPlanarVideoRange: self = .type_444YpCbCr8BiPlanarVideoRange
        case kCVPixelFormatType_444YpCbCr8BiPlanarFullRange: self = .type_444YpCbCr8BiPlanarFullRange
        case kCVPixelFormatType_422YpCbCr8_yuvs: self = .type_422YpCbCr8_yuvs
        case kCVPixelFormatType_422YpCbCr8FullRange: self = .type_422YpCbCr8FullRange
        case kCVPixelFormatType_OneComponent8: self = .type_OneComponent8
        case kCVPixelFormatType_TwoComponent8: self = .type_TwoComponent8
        case kCVPixelFormatType_30RGBLEPackedWideGamut: self = .type_30RGBLEPackedWideGamut
        case kCVPixelFormatType_ARGB2101010LEPacked: self = .type_ARGB2101010LEPacked
        case kCVPixelFormatType_40ARGBLEWideGamut: self = .type_40ARGBLEWideGamut
        case kCVPixelFormatType_40ARGBLEWideGamutPremultiplied: self = .type_40ARGBLEWideGamutPremultiplied
        case kCVPixelFormatType_OneComponent10: self = .type_OneComponent10
        case kCVPixelFormatType_OneComponent12: self = .type_OneComponent12
        case kCVPixelFormatType_OneComponent16: self = .type_OneComponent16
        case kCVPixelFormatType_TwoComponent16: self = .type_TwoComponent16
        case kCVPixelFormatType_OneComponent16Half: self = .type_OneComponent16Half
        case kCVPixelFormatType_OneComponent32Float: self = .type_OneComponent32Float
        case kCVPixelFormatType_TwoComponent16Half: self = .type_TwoComponent16Half
        case kCVPixelFormatType_TwoComponent32Float: self = .type_TwoComponent32Float
        case kCVPixelFormatType_64RGBAHalf: self = .type_64RGBAHalf
        case kCVPixelFormatType_128RGBAFloat: self = .type_128RGBAFloat
        case kCVPixelFormatType_14Bayer_GRBG: self = .type_14Bayer_GRBG
        case kCVPixelFormatType_14Bayer_RGGB: self = .type_14Bayer_RGGB
        case kCVPixelFormatType_14Bayer_BGGR: self = .type_14Bayer_BGGR
        case kCVPixelFormatType_14Bayer_GBRG: self = .type_14Bayer_GBRG
        case kCVPixelFormatType_DisparityFloat16: self = .type_DisparityFloat16
        case kCVPixelFormatType_DisparityFloat32: self = .type_DisparityFloat32
        case kCVPixelFormatType_DepthFloat16: self = .type_DepthFloat16
        case kCVPixelFormatType_DepthFloat32: self = .type_DepthFloat32
        case kCVPixelFormatType_420YpCbCr10BiPlanarVideoRange: self = .type_420YpCbCr10BiPlanarVideoRange
        case kCVPixelFormatType_422YpCbCr10BiPlanarVideoRange: self = .type_422YpCbCr10BiPlanarVideoRange
        case kCVPixelFormatType_444YpCbCr10BiPlanarVideoRange: self = .type_444YpCbCr10BiPlanarVideoRange
        case kCVPixelFormatType_420YpCbCr10BiPlanarFullRange: self = .type_420YpCbCr10BiPlanarFullRange
        case kCVPixelFormatType_422YpCbCr10BiPlanarFullRange: self = .type_422YpCbCr10BiPlanarFullRange
        case kCVPixelFormatType_444YpCbCr10BiPlanarFullRange: self = .type_444YpCbCr10BiPlanarFullRange
        case kCVPixelFormatType_420YpCbCr8VideoRange_8A_TriPlanar: self = .type_420YpCbCr8VideoRange_8A_TriPlanar
        case kCVPixelFormatType_16VersatileBayer: self = .type_16VersatileBayer
        case kCVPixelFormatType_64RGBA_DownscaledProResRAW: self = .type_64RGBA_DownscaledProResRAW
        case kCVPixelFormatType_422YpCbCr16BiPlanarVideoRange: self = .type_422YpCbCr16BiPlanarVideoRange
        case kCVPixelFormatType_444YpCbCr16BiPlanarVideoRange: self = .type_444YpCbCr16BiPlanarVideoRange
        case kCVPixelFormatType_444YpCbCr16VideoRange_16A_TriPlanar: self = .type_444YpCbCr16VideoRange_16A_TriPlanar
        case kCVPixelFormatType_Lossless_32BGRA: self = .type_Lossless_32BGRA
        case kCVPixelFormatType_Lossless_420YpCbCr8BiPlanarVideoRange: self = .type_Lossless_420YpCbCr8BiPlanarVideoRange
        case kCVPixelFormatType_Lossless_420YpCbCr8BiPlanarFullRange: self = .type_Lossless_420YpCbCr8BiPlanarFullRange
        case kCVPixelFormatType_Lossless_420YpCbCr10PackedBiPlanarVideoRange: self = .type_Lossless_420YpCbCr10PackedBiPlanarVideoRange
        case kCVPixelFormatType_Lossless_422YpCbCr10PackedBiPlanarVideoRange: self = .type_Lossless_422YpCbCr10PackedBiPlanarVideoRange
        case kCVPixelFormatType_Lossy_32BGRA: self = .type_Lossy_32BGRA
        case kCVPixelFormatType_Lossy_420YpCbCr8BiPlanarVideoRange: self = .type_Lossy_420YpCbCr8BiPlanarVideoRange
        case kCVPixelFormatType_Lossy_420YpCbCr8BiPlanarFullRange: self = .type_Lossy_420YpCbCr8BiPlanarFullRange
        case kCVPixelFormatType_Lossy_420YpCbCr10PackedBiPlanarVideoRange: self = .type_Lossy_420YpCbCr10PackedBiPlanarVideoRange
        case kCVPixelFormatType_Lossy_422YpCbCr10PackedBiPlanarVideoRange: self = .type_Lossy_422YpCbCr10PackedBiPlanarVideoRange
        default: self = .unknown
        }
    }
    
    public var rawValue: OSType {
        switch self {
        case .type_1Monochrome: return kCVPixelFormatType_1Monochrome
        case .type_2Indexed: return kCVPixelFormatType_2Indexed
        case .type_4Indexed: return kCVPixelFormatType_4Indexed
        case .type_8Indexed: return kCVPixelFormatType_8Indexed
        case .type_1IndexedGray_WhiteIsZero: return kCVPixelFormatType_1IndexedGray_WhiteIsZero
        case .type_2IndexedGray_WhiteIsZero: return kCVPixelFormatType_2IndexedGray_WhiteIsZero
        case .type_4IndexedGray_WhiteIsZero: return kCVPixelFormatType_4IndexedGray_WhiteIsZero
        case .type_8IndexedGray_WhiteIsZero: return kCVPixelFormatType_8IndexedGray_WhiteIsZero
        case .type_16BE555: return kCVPixelFormatType_16BE555
        case .type_16LE555: return kCVPixelFormatType_16LE555
        case .type_16LE5551: return kCVPixelFormatType_16LE5551
        case .type_16BE565: return kCVPixelFormatType_16BE565
        case .type_16LE565: return kCVPixelFormatType_16LE565
        case .type_24RGB: return kCVPixelFormatType_24RGB
        case .type_24BGR: return kCVPixelFormatType_24BGR
        case .type_32ARGB: return kCVPixelFormatType_32ARGB
        case .type_32BGRA: return kCVPixelFormatType_32BGRA
        case .type_32ABGR: return kCVPixelFormatType_32ABGR
        case .type_32RGBA: return kCVPixelFormatType_32RGBA
        case .type_64ARGB: return kCVPixelFormatType_64ARGB
        case .type_64RGBALE: return kCVPixelFormatType_64RGBALE
        case .type_48RGB: return kCVPixelFormatType_48RGB
        case .type_32AlphaGray: return kCVPixelFormatType_32AlphaGray
        case .type_16Gray: return kCVPixelFormatType_16Gray
        case .type_30RGB: return kCVPixelFormatType_30RGB
        case .type_422YpCbCr8: return kCVPixelFormatType_422YpCbCr8
        case .type_4444YpCbCrA8: return kCVPixelFormatType_4444YpCbCrA8
        case .type_4444YpCbCrA8R: return kCVPixelFormatType_4444YpCbCrA8R
        case .type_4444AYpCbCr8: return kCVPixelFormatType_4444AYpCbCr8
        case .type_4444AYpCbCr16: return kCVPixelFormatType_4444AYpCbCr16
        case .type_444YpCbCr8: return kCVPixelFormatType_444YpCbCr8
        case .type_422YpCbCr16: return kCVPixelFormatType_422YpCbCr16
        case .type_422YpCbCr10: return kCVPixelFormatType_422YpCbCr10
        case .type_444YpCbCr10: return kCVPixelFormatType_444YpCbCr10
        case .type_420YpCbCr8Planar: return kCVPixelFormatType_420YpCbCr8Planar
        case .type_420YpCbCr8PlanarFullRange: return kCVPixelFormatType_420YpCbCr8PlanarFullRange
        case .type_422YpCbCr_4A_8BiPlanar: return kCVPixelFormatType_422YpCbCr_4A_8BiPlanar
        case .type_420YpCbCr8BiPlanarVideoRange: return kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange
        case .type_420YpCbCr8BiPlanarFullRange: return kCVPixelFormatType_420YpCbCr8BiPlanarFullRange
        case .type_422YpCbCr8BiPlanarVideoRange: return kCVPixelFormatType_422YpCbCr8BiPlanarVideoRange
        case .type_422YpCbCr8BiPlanarFullRange: return kCVPixelFormatType_422YpCbCr8BiPlanarFullRange
        case .type_444YpCbCr8BiPlanarVideoRange: return kCVPixelFormatType_444YpCbCr8BiPlanarVideoRange
        case .type_444YpCbCr8BiPlanarFullRange: return kCVPixelFormatType_444YpCbCr8BiPlanarFullRange
        case .type_422YpCbCr8_yuvs: return kCVPixelFormatType_422YpCbCr8_yuvs
        case .type_422YpCbCr8FullRange: return kCVPixelFormatType_422YpCbCr8FullRange
        case .type_OneComponent8: return kCVPixelFormatType_OneComponent8
        case .type_TwoComponent8: return kCVPixelFormatType_TwoComponent8
        case .type_30RGBLEPackedWideGamut: return kCVPixelFormatType_30RGBLEPackedWideGamut
        case .type_ARGB2101010LEPacked: return kCVPixelFormatType_ARGB2101010LEPacked
        case .type_40ARGBLEWideGamut: return kCVPixelFormatType_40ARGBLEWideGamut
        case .type_40ARGBLEWideGamutPremultiplied: return kCVPixelFormatType_40ARGBLEWideGamutPremultiplied
        case .type_OneComponent10: return kCVPixelFormatType_OneComponent10
        case .type_OneComponent12: return kCVPixelFormatType_OneComponent12
        case .type_OneComponent16: return kCVPixelFormatType_OneComponent16
        case .type_TwoComponent16: return kCVPixelFormatType_TwoComponent16
        case .type_OneComponent16Half: return kCVPixelFormatType_OneComponent16Half
        case .type_OneComponent32Float: return kCVPixelFormatType_OneComponent32Float
        case .type_TwoComponent16Half: return kCVPixelFormatType_TwoComponent16Half
        case .type_TwoComponent32Float: return kCVPixelFormatType_TwoComponent32Float
        case .type_64RGBAHalf: return kCVPixelFormatType_64RGBAHalf
        case .type_128RGBAFloat: return kCVPixelFormatType_128RGBAFloat
        case .type_14Bayer_GRBG: return kCVPixelFormatType_14Bayer_GRBG
        case .type_14Bayer_RGGB: return kCVPixelFormatType_14Bayer_RGGB
        case .type_14Bayer_BGGR: return kCVPixelFormatType_14Bayer_BGGR
        case .type_14Bayer_GBRG: return kCVPixelFormatType_14Bayer_GBRG
        case .type_DisparityFloat16: return kCVPixelFormatType_DisparityFloat16
        case .type_DisparityFloat32: return kCVPixelFormatType_DisparityFloat32
        case .type_DepthFloat16: return kCVPixelFormatType_DepthFloat16
        case .type_DepthFloat32: return kCVPixelFormatType_DepthFloat32
        case .type_420YpCbCr10BiPlanarVideoRange: return kCVPixelFormatType_420YpCbCr10BiPlanarVideoRange
        case .type_422YpCbCr10BiPlanarVideoRange: return kCVPixelFormatType_422YpCbCr10BiPlanarVideoRange
        case .type_444YpCbCr10BiPlanarVideoRange: return kCVPixelFormatType_444YpCbCr10BiPlanarVideoRange
        case .type_420YpCbCr10BiPlanarFullRange: return kCVPixelFormatType_420YpCbCr10BiPlanarFullRange
        case .type_422YpCbCr10BiPlanarFullRange: return kCVPixelFormatType_422YpCbCr10BiPlanarFullRange
        case .type_444YpCbCr10BiPlanarFullRange: return kCVPixelFormatType_444YpCbCr10BiPlanarFullRange
        case .type_420YpCbCr8VideoRange_8A_TriPlanar: return kCVPixelFormatType_420YpCbCr8VideoRange_8A_TriPlanar
        case .type_16VersatileBayer: return kCVPixelFormatType_16VersatileBayer
        case .type_64RGBA_DownscaledProResRAW: return kCVPixelFormatType_64RGBA_DownscaledProResRAW
        case .type_422YpCbCr16BiPlanarVideoRange: return kCVPixelFormatType_422YpCbCr16BiPlanarVideoRange
        case .type_444YpCbCr16BiPlanarVideoRange: return kCVPixelFormatType_444YpCbCr16BiPlanarVideoRange
        case .type_444YpCbCr16VideoRange_16A_TriPlanar: return kCVPixelFormatType_444YpCbCr16VideoRange_16A_TriPlanar
        case .type_Lossless_32BGRA: return kCVPixelFormatType_Lossless_32BGRA
        case .type_Lossless_420YpCbCr8BiPlanarVideoRange: return kCVPixelFormatType_Lossless_420YpCbCr8BiPlanarVideoRange
        case .type_Lossless_420YpCbCr8BiPlanarFullRange: return kCVPixelFormatType_Lossless_420YpCbCr8BiPlanarFullRange
        case .type_Lossless_420YpCbCr10PackedBiPlanarVideoRange: return kCVPixelFormatType_Lossless_420YpCbCr10PackedBiPlanarVideoRange
        case .type_Lossless_422YpCbCr10PackedBiPlanarVideoRange: return kCVPixelFormatType_Lossless_422YpCbCr10PackedBiPlanarVideoRange
        case .type_Lossy_32BGRA: return kCVPixelFormatType_Lossy_32BGRA
        case .type_Lossy_420YpCbCr8BiPlanarVideoRange: return kCVPixelFormatType_Lossy_420YpCbCr8BiPlanarVideoRange
        case .type_Lossy_420YpCbCr8BiPlanarFullRange: return kCVPixelFormatType_Lossy_420YpCbCr8BiPlanarFullRange
        case .type_Lossy_420YpCbCr10PackedBiPlanarVideoRange: return kCVPixelFormatType_Lossy_420YpCbCr10PackedBiPlanarVideoRange
        case .type_Lossy_422YpCbCr10PackedBiPlanarVideoRange: return kCVPixelFormatType_Lossy_422YpCbCr10PackedBiPlanarVideoRange
        case .unknown: return 0x00000000
        }
    }
    
    public var description: String {
        switch self {
        case .type_1Monochrome: return "1Monochrome"
        case .type_2Indexed: return "2Indexed"
        case .type_4Indexed: return "4Indexed"
        case .type_8Indexed: return "8Indexed"
        case .type_1IndexedGray_WhiteIsZero: return "1IndexedGray_WhiteIsZero"
        case .type_2IndexedGray_WhiteIsZero: return "2IndexedGray_WhiteIsZero"
        case .type_4IndexedGray_WhiteIsZero: return "4IndexedGray_WhiteIsZero"
        case .type_8IndexedGray_WhiteIsZero: return "8IndexedGray_WhiteIsZero"
        case .type_16BE555: return "16BE555"
        case .type_16LE555: return "16LE555"
        case .type_16LE5551: return "16LE5551"
        case .type_16BE565: return "16BE565"
        case .type_16LE565: return "16LE565"
        case .type_24RGB: return "24RGB"
        case .type_24BGR: return "24BGR"
        case .type_32ARGB: return "32ARGB"
        case .type_32BGRA: return "32BGRA"
        case .type_32ABGR: return "32ABGR"
        case .type_32RGBA: return "32RGBA"
        case .type_64ARGB: return "64ARGB"
        case .type_64RGBALE: return "64RGBALE"
        case .type_48RGB: return "48RGB"
        case .type_32AlphaGray: return "32AlphaGray"
        case .type_16Gray: return "16Gray"
        case .type_30RGB: return "30RGB"
        case .type_422YpCbCr8: return "422YpCbCr8"
        case .type_4444YpCbCrA8: return "4444YpCbCrA8"
        case .type_4444YpCbCrA8R: return "4444YpCbCrA8R"
        case .type_4444AYpCbCr8: return "4444AYpCbCr8"
        case .type_4444AYpCbCr16: return "4444AYpCbCr16"
        case .type_444YpCbCr8: return "444YpCbCr8"
        case .type_422YpCbCr16: return "422YpCbCr16"
        case .type_422YpCbCr10: return "422YpCbCr10"
        case .type_444YpCbCr10: return "444YpCbCr10"
        case .type_420YpCbCr8Planar: return "420YpCbCr8Planar"
        case .type_420YpCbCr8PlanarFullRange: return "420YpCbCr8PlanarFullRange"
        case .type_422YpCbCr_4A_8BiPlanar: return "422YpCbCr_4A_8BiPlanar"
        case .type_420YpCbCr8BiPlanarVideoRange: return "420YpCbCr8BiPlanarVideoRange"
        case .type_420YpCbCr8BiPlanarFullRange: return "420YpCbCr8BiPlanarFullRange"
        case .type_422YpCbCr8BiPlanarVideoRange: return "422YpCbCr8BiPlanarVideoRange"
        case .type_422YpCbCr8BiPlanarFullRange: return "422YpCbCr8BiPlanarFullRange"
        case .type_444YpCbCr8BiPlanarVideoRange: return "444YpCbCr8BiPlanarVideoRange"
        case .type_444YpCbCr8BiPlanarFullRange: return "444YpCbCr8BiPlanarFullRange"
        case .type_422YpCbCr8_yuvs: return "422YpCbCr8_yuvs"
        case .type_422YpCbCr8FullRange: return "422YpCbCr8FullRange"
        case .type_OneComponent8: return "OneComponent8"
        case .type_TwoComponent8: return "TwoComponent8"
        case .type_30RGBLEPackedWideGamut: return "30RGBLEPackedWideGamut"
        case .type_ARGB2101010LEPacked: return "ARGB2101010LEPacked"
        case .type_40ARGBLEWideGamut: return "40ARGBLEWideGamut"
        case .type_40ARGBLEWideGamutPremultiplied: return "40ARGBLEWideGamutPremultiplied"
        case .type_OneComponent10: return "OneComponent10"
        case .type_OneComponent12: return "OneComponent12"
        case .type_OneComponent16: return "OneComponent16"
        case .type_TwoComponent16: return "TwoComponent16"
        case .type_OneComponent16Half: return "OneComponent16Half"
        case .type_OneComponent32Float: return "OneComponent32Float"
        case .type_TwoComponent16Half: return "TwoComponent16Half"
        case .type_TwoComponent32Float: return "TwoComponent32Float"
        case .type_64RGBAHalf: return "64RGBAHalf"
        case .type_128RGBAFloat: return "128RGBAFloat"
        case .type_14Bayer_GRBG: return "14Bayer_GRBG"
        case .type_14Bayer_RGGB: return "14Bayer_RGGB"
        case .type_14Bayer_BGGR: return "14Bayer_BGGR"
        case .type_14Bayer_GBRG: return "14Bayer_GBRG"
        case .type_DisparityFloat16: return "DisparityFloat16"
        case .type_DisparityFloat32: return "DisparityFloat32"
        case .type_DepthFloat16: return "DepthFloat16"
        case .type_DepthFloat32: return "DepthFloat32"
        case .type_420YpCbCr10BiPlanarVideoRange: return "420YpCbCr10BiPlanarVideoRange"
        case .type_422YpCbCr10BiPlanarVideoRange: return "422YpCbCr10BiPlanarVideoRange"
        case .type_444YpCbCr10BiPlanarVideoRange: return "444YpCbCr10BiPlanarVideoRange"
        case .type_420YpCbCr10BiPlanarFullRange: return "420YpCbCr10BiPlanarFullRange"
        case .type_422YpCbCr10BiPlanarFullRange: return "422YpCbCr10BiPlanarFullRange"
        case .type_444YpCbCr10BiPlanarFullRange: return "444YpCbCr10BiPlanarFullRange"
        case .type_420YpCbCr8VideoRange_8A_TriPlanar: return "420YpCbCr8VideoRange_8A_TriPlanar"
        case .type_16VersatileBayer: return "16VersatileBayer"
        case .type_64RGBA_DownscaledProResRAW: return "64RGBA_DownscaledProResRAW"
        case .type_422YpCbCr16BiPlanarVideoRange: return "422YpCbCr16BiPlanarVideoRange"
        case .type_444YpCbCr16BiPlanarVideoRange: return "444YpCbCr16BiPlanarVideoRange"
        case .type_444YpCbCr16VideoRange_16A_TriPlanar: return "444YpCbCr16VideoRange_16A_TriPlanar"
        case .type_Lossless_32BGRA: return "Lossless_32BGRA"
        case .type_Lossless_420YpCbCr8BiPlanarVideoRange: return "Lossless_420YpCbCr8BiPlanarVideoRange"
        case .type_Lossless_420YpCbCr8BiPlanarFullRange: return "Lossless_420YpCbCr8BiPlanarFullRange"
        case .type_Lossless_420YpCbCr10PackedBiPlanarVideoRange: return "Lossless_420YpCbCr10PackedBiPlanarVideoRange"
        case .type_Lossless_422YpCbCr10PackedBiPlanarVideoRange: return "Lossless_422YpCbCr10PackedBiPlanarVideoRange"
        case .type_Lossy_32BGRA: return "Lossy_32BGRA"
        case .type_Lossy_420YpCbCr8BiPlanarVideoRange: return "Lossy_420YpCbCr8BiPlanarVideoRange"
        case .type_Lossy_420YpCbCr8BiPlanarFullRange: return "Lossy_420YpCbCr8BiPlanarFullRange"
        case .type_Lossy_420YpCbCr10PackedBiPlanarVideoRange: return "Lossy_420YpCbCr10PackedBiPlanarVideoRange"
        case .type_Lossy_422YpCbCr10PackedBiPlanarVideoRange: return "Lossy_422YpCbCr10PackedBiPlanarVideoRange"
        case .unknown: return "Unknown"
        }
    }
}
