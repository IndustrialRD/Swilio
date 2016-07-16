import Foundation
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
    
    func testHasMethodForSendingSMS() {
        XCTAssertNotNil(Swilio.sendSMS(message: "", to: "", from: "", callback: { (success) in
        }))
    }
    
    func testHasMethodThatGeneratesRequestForSendingMessage() {
        let fakeAcct = "fkeacct"
        let fakeAuth = "#F4keT0K3n"
        Swilio.configure(accountSid: fakeAcct, authToken: fakeAuth)
        let req = Swilio.generateSendMessageRequest()
        XCTAssert( req.url?.absoluteString == "https://\(fakeAcct):\(fakeAuth)@api.twilio.com/2010-04-01/Accounts/\(fakeAcct)/Messages.json")
        XCTAssert(req.httpMethod == "POST")
        XCTAssert(req.value(forHTTPHeaderField: "Content-Type") == "application/x-www-form-urlencoded")

    }

    
    func testHasURKSession() {
        XCTAssertNotNil(Swilio.session)
    }

    func testHasMethodThatGeneratesSendMessageTask() {
        let fakeAcct = "fkeacct"
        let fakeAuth = "#F4keT0K3n"
        let fakeTo = "fkeacct"
        let fakeFrom = "#F4keT0K3n"
        let fakeBody = "fkeacct"
        
        Swilio.configure(accountSid: fakeAcct, authToken: fakeAuth)
        let task = Swilio.generateSendMessageTask(to: fakeTo, from: fakeFrom, body: fakeBody) { (d:Data?, r:URLResponse?, e:NSError?) in}
        
        XCTAssert(String(data: (task.currentRequest?.httpBody!)!, encoding: String.Encoding.utf8) == "From=\(fakeFrom)&To=\(fakeTo)&Body=\(fakeBody)")
    }
    
    
    static var allTests : [(String, (SwilioTests) -> () throws -> Void)] {
        return [
            ("testHasOptionForConfiguration", testHasOptionForConfiguration),
            ("testHasReadyProperty", testHasReadyProperty),
            ("testHasMethodForSendingSMS", testHasMethodForSendingSMS),
            ("testHasMethodThatGeneratesRequestForSendingMessage", testHasMethodThatGeneratesRequestForSendingMessage)
        ]
    }
}
