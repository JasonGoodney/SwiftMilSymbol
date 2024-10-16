import XCTest
import UIKit
@testable import SwiftMilSymbol

final class SwiftMilSymbolTests: XCTestCase {
    func testExample() throws {
        XCTAssertNotNil(MilSymbol.image("SFG-UCI----D"))
    }
    
    func testMilStd2525c() throws {
        let ms2525c = MilStd2525.ms2525c()
        XCTAssertNotNil(ms2525c)
    }
    
    func testFilterMilStd2525cForSIDC() {
        let sidc = "S*G*EWRH--MT"
        let symbols = MilStd2525.ms2525c()?.warfighting.symbols
        let symbol = symbols?.first(where: { sidc.hasPrefix($0.sidc) })
        XCTAssertNotNil(symbol)
    }
}
