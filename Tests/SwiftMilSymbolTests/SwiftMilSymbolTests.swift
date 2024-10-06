import XCTest
import UIKit
@testable import SwiftMilSymbol

final class SwiftMilSymbolTests: XCTestCase {
    func testExample() throws {
        XCTAssertNotNil(MilSymbol.shared.image("SFG-UCI----D"))
    }
}
