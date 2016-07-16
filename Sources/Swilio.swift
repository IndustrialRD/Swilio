import Foundation

public struct Swilio {
    
    public static var accountSid:String?
    public static var authToken:String?
    
    
    static var session:URLSession {
        let sessionConfig = URLSessionConfiguration.default
        return URLSession(configuration: sessionConfig)
    }

    public static var ready:Bool {
        return accountSid != nil && authToken != nil
    }
    
    public static func configure(accountSid sid:String, authToken token:String) {
        accountSid = sid
        authToken = token
    }
    
    public static func sendSMS(message body:String, to toPhone:String, from fromPhone:String, callback:(success:Bool)->Void) {
        generateSendMessageTask(to: toPhone, from: fromPhone, body: body) { (data:Data?, response:URLResponse?, err:NSError?) in
            if let d = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: d, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    print(json)
                    callback(success: true)
                }catch{
                    print(error)
                    callback(success: false)
                }
            }
        }.resume()
    }
    
    static func generateSendMessageRequest() -> URLRequest {
        var req = URLRequest(url:URL.messagesURL)
        req.httpMethod = "POST"
        req.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        return req
    }
    
    static func generateSendMessageTask(to:String, from:String, body:String, callback:(Data?, URLResponse?, NSError?) -> Void )->URLSessionTask {
        var req = generateSendMessageRequest()
        let paramString = "From=\(from)&To=\(to)&Body=\(body)"
        req.httpBody = paramString.data(using: String.Encoding.utf8)!
        return session.dataTask(with: req, completionHandler: callback)
    }
}


public extension URL {
    static var messagesURL:URL {
        let sid = Swilio.accountSid ?? "NO_SID"
        let token = Swilio.authToken ?? "NO_TOKEN"
        return URL(string: "https://\(sid):\(token)@api.twilio.com/2010-04-01/Accounts/\(sid)/Messages.json")!
    }
}
