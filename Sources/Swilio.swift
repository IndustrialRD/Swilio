public struct Swilio {
    
    public static var accountSid:String?
    public static var authToken:String?
    
    public static var ready:Bool {
        return accountSid != nil && authToken != nil
    }
    
    public static func configure(accountSid sid:String, authToken token:String) {
        accountSid = sid
        authToken = token
    }
    
}
