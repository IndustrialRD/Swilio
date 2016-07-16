import XCTest
@testable import Swilio

class SwilioTests: XCTestCase {
    
    func testHasOptionForConfiguration() {
        let fakeAcct = "fkeacct"
        let fakeAuth = "#F4keT0K3n"
        Swilio.configure(accountSid: fakeAcct, authToken: fakeAuth)
        XCTAssert(Swilio.accountSid == fakeAcct)
        XCTAssert(Swilio.authToken == fakeAuth)
    }
    
    func testHasReadyProperty() {
        XCTAssert(Swilio.ready == true)
        Swilio.accountSid = nil
        XCTAssert(Swilio.ready == false)
        Swilio.accountSid = "foo"
        Swilio.authToken = nil
        XCTAssert(Swilio.ready == false)
        
    }


    static var allTests : [(String, (SwilioTests) -> () throws -> Void)] {
        return [
            ("testHasOptionForConfiguration", testHasOptionForConfiguration),
        ]
    }
}
