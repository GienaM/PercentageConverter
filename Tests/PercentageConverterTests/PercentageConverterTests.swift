import XCTest
@testable import PercentageConverter

final class PercentageConverterTests: XCTestCase {
    func testRoundedPercents() throws {
        let converter = PercentageConverter(values: 3.626332, 47.989636, 9.596008, 28.788024)
        let roundedPercents = try converter.roundedPercents()
        XCTAssert(roundedPercents.reduce(0, +) == 100)
    }

    func testInvalidValues() throws {
        let converter = PercentageConverter(values: 0, 0, 0, 0)
        XCTAssertThrowsError(try converter.roundedPercents())
    }
}
