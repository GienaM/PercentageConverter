import XCTest
@testable import PercentageConverter

final class PercentageConverterTests: XCTestCase {
    func testRoundedPercents() {
        let converter = PercentageConverter(values: 3.626332, 47.989636, 9.596008, 28.788024)
        let roundedPercents = converter.roundedPercents()
        XCTAssert(roundedPercents.reduce(0, +) == 100)
    }
}
