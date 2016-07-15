import XCTest
@testable import Swilio

class SwilioTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Swilio().text, "Hello, World!")
    }


    static var allTests : [(String, (SwilioTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
