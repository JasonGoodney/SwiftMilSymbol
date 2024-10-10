import XCTest
import UIKit
@testable import SwiftMilSymbol

final class SwiftMilSymbolTests: XCTestCase {
    func testExample() throws {
        XCTAssertNotNil(MilSymbol.shared.image("SFG-UCI----D"))
    }
    
    func testMilStd2525c() throws {
        let ms2525c = try MilSymbol.shared.milStd2525c()
        XCTAssertNotNil(ms2525c)
    }
}
