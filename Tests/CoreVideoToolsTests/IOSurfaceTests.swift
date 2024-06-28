import XCTest
@testable import CoreVideoTools

final class IOSurfaceTests: XCTestCase {

    func testCreateIOSurfaceSuccess() throws {
        let surface = try IOSurface.create(
            width: 640,
            height: 480,
            cvPixelFormat: .type_32BGRA,
            bytesPerElement: 4,
            bytesPerRow: 640 * 4
        )
        XCTAssertEqual(surface.width, 640)
        XCTAssertEqual(surface.height, 480)
        XCTAssertEqual(surface.bytesPerElement, 4)
        XCTAssertEqual(surface.bytesPerRow, 640 * 4)
        XCTAssertEqual(surface.pixelFormat, kCVPixelFormatType_32BGRA)
    }

    func testCreateIOSurfaceWithCustomCacheMode() throws {
        let surface = try IOSurface.create(
            width: 320,
            height: 240,
            cvPixelFormat: .type_32ARGB,
            bytesPerElement: 4,
            bytesPerRow: 320 * 4,
            cacheMode: .writeCombine
        )
        XCTAssertEqual(surface.width, 320)
        XCTAssertEqual(surface.height, 240)
        XCTAssertEqual(surface.pixelFormat, kCVPixelFormatType_32ARGB)
    }

    func testCreateIOSurfaceWithAdditionalProperties() throws {
        let surface = try IOSurface.create(
            width: 320,
            height: 240,
            cvPixelFormat: .type_32ARGB,
            bytesPerElement: 4,
            bytesPerRow: 320 * 4,
            additionalProperties: [
                .planeInfo: [
                    [
                        kIOSurfacePlaneWidth: 320,
                        kIOSurfacePlaneHeight: 240,
                        kIOSurfacePlaneBytesPerRow: 320 * 4,
                        kIOSurfacePlaneOffset: 0,
                        kIOSurfacePlaneSize: 320 * 240 * 4
                    ]
                ]
            ]
        )
        XCTAssertEqual(surface.width, 320)
        XCTAssertEqual(surface.height, 240)
        XCTAssertEqual(surface.pixelFormat, kCVPixelFormatType_32ARGB)
        XCTAssertEqual(surface.planeCount, 1)
    }

    func testCreateIOSurfaceWithInvalidDimensions() throws {
        XCTAssertThrowsError(try IOSurface.create(
            width: 0,
            height: 480,
            cvPixelFormat: .type_32BGRA,
            bytesPerElement: 4,
            bytesPerRow: 0
        )) { error in
            XCTAssertEqual(error as? CVError, .error)
        }

        XCTAssertThrowsError(try IOSurface.create(
            width: 640,
            height: 0,
            cvPixelFormat: .type_32BGRA,
            bytesPerElement: 4,
            bytesPerRow: 640 * 4
        )) { error in
            XCTAssertEqual(error as? CVError, .error)
        }
    }

    func testCreateIOSurfaceWithInvalidBytesPerElement() throws {
        XCTAssertThrowsError(try IOSurface.create(
            width: 640,
            height: 480,
            cvPixelFormat: .type_32BGRA,
            bytesPerElement: 0,
            bytesPerRow: 640 * 4
        )) { error in
            XCTAssertEqual(error as? CVError, .error)
        }
    }

    func testCreateIOSurfaceWithInvalidBytesPerRow() throws {
        XCTAssertThrowsError(try IOSurface.create(
            width: 640,
            height: 480,
            cvPixelFormat: .type_32BGRA,
            bytesPerElement: 4,
            bytesPerRow: 100  // Too small for the width
        )) { error in
            XCTAssertEqual(error as? CVError, .error)
        }
    }

    func testCreateIOSurfaceWithDifferentPixelFormats() throws {
        let formats: [CVPixelFormat] = [.type_32BGRA, .type_32RGBA, .type_16Gray, .type_8IndexedGray_WhiteIsZero]

        for format in formats {
            let bytesPerElement = format == .type_16Gray ? 2 : (format == .type_8IndexedGray_WhiteIsZero ? 1 : 4)
            let surface = try IOSurface.create(
                width: 100,
                height: 100,
                cvPixelFormat: format,
                bytesPerElement: bytesPerElement,
                bytesPerRow: 100 * bytesPerElement
            )
            XCTAssertEqual(surface.pixelFormat, format.rawValue)
        }
    }

    func testCreateIOSurfaceWithAllCacheModes() throws {
        let cacheModes: [IOSurface.CacheMode] = [
            .default, .inhibit, .writeThrough, .copyback,
            .writeCombine, .copybackInner, .postedWrite,
            .realTime, .postedReordered, .postedCombinedReordered
        ]

        for cacheMode in cacheModes {
            let surface = try IOSurface.create(
                width: 64,
                height: 64,
                cvPixelFormat: .type_32BGRA,
                bytesPerElement: 4,
                bytesPerRow: 64 * 4,
                cacheMode: cacheMode
            )
            XCTAssertNotNil(surface)
            // We can't directly test the cache mode, but we can check that creation succeeded
        }
    }
}
