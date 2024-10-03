import XCTest
import UIKit
@testable import SwiftMilSymbol

final class SwiftMilSymbolTests: XCTestCase {
    func testExample() async throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest
        
        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        await MilSymbol.shared.symbol("SFG-UCI----D")
    }
}
