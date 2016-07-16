# Swilio
A Swifty Twilio client library.


![Build Status](https://travis-ci.org/IndustrialRD/Swilio.svg?branch=master)

(https://travis-ci.org/IndustrialRD/Swilio)

## Usage

```swift
// Configure with your Account SID and Auth Token from Twilio
Swilio.configure(accountSid: "YOUR_ACCOUNT_SID", authToken: "YOUR_AUTH_TOKEN")

// Send an SMS

XCTAssertNotNil(Swilio.sendSMS(message: "Hello Swilio!", to: "16465551212", from: "16465551234", callback: { (success) in
    print("SMS Sent: \(success)")
}))

```

That's it! 

## Planned Features

- Fetch Messages
- Fetch Accounts
- Update Accounts
- Fetch Calls 
- Make Calls
