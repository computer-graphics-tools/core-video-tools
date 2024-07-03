import XCTest
@testable import CoreVideoTools

final class CVPixelBufferTests: XCTestCase {

    override func tearDown() {
        super.tearDown()
        // Force a garbage collection to clean up any lingering CVPixelBuffers
        autoreleasepool { }
    }

    func testCreatePixelBuffer() throws {
        let pixelBuffer = try CVPixelBuffer.create(width: 640, height: 480, cvPixelFormat: .type_32BGRA)
        XCTAssertEqual(pixelBuffer.width, 640)
        XCTAssertEqual(pixelBuffer.height, 480)
        XCTAssertEqual(pixelBuffer.cvPixelFormat, .type_32BGRA)
    }

    func testPixelBufferProperties() throws {
        let pixelBuffer = try CVPixelBuffer.create(width: 1920, height: 1080, cvPixelFormat: .type_32BGRA)
        XCTAssertEqual(pixelBuffer.width, 1920)
        XCTAssertEqual(pixelBuffer.height, 1080)
        XCTAssertEqual(pixelBuffer.cvPixelFormat, .type_32BGRA)
        XCTAssertGreaterThan(pixelBuffer.bytesPerRow, 0)
        XCTAssertFalse(pixelBuffer.isPlanar)
        XCTAssertEqual(pixelBuffer.planeCount, 0)
    }

    func testLockUnlock() throws {
        let pixelBuffer = try CVPixelBuffer.create(width: 100, height: 100, cvPixelFormat: .type_32BGRA)
        try pixelBuffer.lockBaseAddress(lockFlags: .readOnly)
        XCTAssertNotNil(pixelBuffer.baseAddress)
        try pixelBuffer.unlockBaseAddress(unlockFlags: .readOnly)
    }

    func testBlankCopy() throws {
        let original = try CVPixelBuffer.create(width: 200, height: 150, cvPixelFormat: .type_32BGRA)
        let copy = try original.blankCopy()
        XCTAssertEqual(original.width, copy.width)
        XCTAssertEqual(original.height, copy.height)
        XCTAssertEqual(original.cvPixelFormat, copy.cvPixelFormat)
    }

    func testDeepCopy() throws {
        let original = try CVPixelBuffer.create(width: 300, height: 200, cvPixelFormat: .type_32BGRA)
        try original.lockBaseAddress(lockFlags: [])
        defer { try? original.unlockBaseAddress(unlockFlags: []) }

        // Fill original with some data
        if let baseAddress = original.baseAddress {
            memset(baseAddress, 255, original.dataSize)
        }

        let copy = try original.deepCopy()
        XCTAssertEqual(original.width, copy.width)
        XCTAssertEqual(original.height, copy.height)
        XCTAssertEqual(original.cvPixelFormat, copy.cvPixelFormat)

        // Check if data was copied
        try copy.lockBaseAddress(lockFlags: .readOnly)
        defer { try? copy.unlockBaseAddress(unlockFlags: .readOnly) }

        if let copyData = copy.data() {
            XCTAssertEqual(copyData.count, original.dataSize)
            XCTAssertEqual(copyData.first, 255)
            XCTAssertEqual(copyData.last, 255)
        } else {
            XCTFail("Failed to get data from copy")
        }
    }

    func testPixelBufferData() throws {
        let pixelBuffer = try CVPixelBuffer.create(width: 100, height: 100, cvPixelFormat: .type_32BGRA)
        try pixelBuffer.lockBaseAddress(lockFlags: [])
        defer { try? pixelBuffer.unlockBaseAddress(unlockFlags: []) }

        if let data = pixelBuffer.data() {
            XCTAssertEqual(data.count, pixelBuffer.dataSize)
        } else {
            XCTFail("Failed to get pixel buffer data")
        }
    }

    func testPlanarPixelBuffer() throws {
        let pixelBuffer = try CVPixelBuffer.create(
            width: 100,
            height: 100,
            cvPixelFormat: .type_420YpCbCr8BiPlanarVideoRange
        )
        XCTAssertTrue(pixelBuffer.isPlanar)
        XCTAssertEqual(pixelBuffer.planeCount, 2)

        XCTAssertEqual(pixelBuffer.width(of: 0), 100)
        XCTAssertEqual(pixelBuffer.height(of: 0), 100)
        XCTAssertEqual(pixelBuffer.width(of: 1), 50)
        XCTAssertEqual(pixelBuffer.height(of: 1), 50)

        try pixelBuffer.lockBaseAddress(lockFlags: .readOnly)
        defer { try? pixelBuffer.unlockBaseAddress(unlockFlags: .readOnly) }

        XCTAssertNotNil(pixelBuffer.baseAddress(of: 0))
        XCTAssertNotNil(pixelBuffer.baseAddress(of: 1))

        XCTAssertGreaterThan(pixelBuffer.bytesPerRow(of: 0), 0)
        XCTAssertGreaterThan(pixelBuffer.bytesPerRow(of: 1), 0)
    }
}
