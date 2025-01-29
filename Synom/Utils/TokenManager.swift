import Foundation
import Security

struct TokenManager {
    private static let tokenKey = "authToken"
    
    static func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    static func getToken() -> String? {
        return UserDefaults.standard.string(forKey: tokenKey)
    }
    
    static func deleteToken() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
}
