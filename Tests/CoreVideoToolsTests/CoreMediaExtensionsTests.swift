import AVFoundation
import XCTest
@testable import CoreVideoTools

final class CoreMediaExtensionsTests: XCTestCase {
    func testFormatDescriptionExposesPixelFormatAndDimensions() throws {
        let pixelBuffer = try CVPixelBuffer.create(
            width: 640,
            height: 480,
            cvPixelFormat: .type_32BGRA
        )

        var optionalFormatDescription: CMVideoFormatDescription?
        let status = CMVideoFormatDescriptionCreateForImageBuffer(
            allocator: kCFAllocatorDefault,
            imageBuffer: pixelBuffer,
            formatDescriptionOut: &optionalFormatDescription
        )

        XCTAssertEqual(status, noErr)
        guard let formatDescription = optionalFormatDescription else {
            XCTFail("Failed to create format description")
            return
        }

        XCTAssertEqual(formatDescription.cvPixelFormat, .type_32BGRA)
        XCTAssertEqual(formatDescription.videoDimensions.width, 640)
        XCTAssertEqual(formatDescription.videoDimensions.height, 480)
        XCTAssertEqual(formatDescription.videoDimensions.shortSide, 480)
        XCTAssertEqual(formatDescription.videoDimensions.longSide, 640)
        XCTAssertEqual(formatDescription.videoDimensions.area, 640 * 480)
    }

    func testPixelBufferPropertyDictionaryUsesTypedKeys() {
        let attributes: [CVPixelBuffer.PropertyKey: Any] = [
            .pixelFormatType: CVPixelFormat.type_32BGRA.rawValue,
            .width: 640,
            .height: 480,
        ]

        let rawAttributes = attributes.rawPixelBufferAttributes

        XCTAssertEqual(rawAttributes[CVPixelBuffer.PropertyKey.width.rawValue as String] as? Int, 640)
        XCTAssertEqual(rawAttributes[CVPixelBuffer.PropertyKey.height.rawValue as String] as? Int, 480)
        XCTAssertEqual(
            rawAttributes[CVPixelBuffer.PropertyKey.pixelFormatType.rawValue as String] as? OSType,
            CVPixelFormat.type_32BGRA.rawValue
        )
    }
}
