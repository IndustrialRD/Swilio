# Swilio

A Swifty Twilio client library.


![Swift3](https://img.shields.io/badge/Swift-3.0-blue.svg)
![Mac OS X](https://img.shields.io/badge/os-Mac%20OS%20X-green.svg?style=flat)
![iOS](https://img.shields.io/badge/os-iOS-green.svg?style=flat)
![Linux](https://img.shields.io/badge/os-linux-green.svg?style=flat)
![MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)
![Travis](https://travis-ci.org/IndustrialRD/Swilio.svg?branch=master)

(https://travis-ci.org/IndustrialRD/Swilio)

## Usage

```swift
// Configure with your Account SID and Auth Token from Twilio
Swilio.configure(accountSid: "YOUR_ACCOUNT_SID", authToken: "YOUR_AUTH_TOKEN")

// Send an SMS

Swilio.sendSMS(message: "Hello Swilio!", to: "16465551212", from: "16465551234", callback: { (success) in
    print("SMS Sent: \(success)")
})

```

That's it! 

## Planned Features

- Fetch Messages
- Fetch Accounts
- Update Accounts
- Fetch Calls 
- Make Calls
