import Foundation

struct APIConstants {
    static let baseURL = "http://localhost:3000"
    
    struct Endpoints {
        static let login = "/auth/signin"
        static let signup = "/auth/signup"
    }
}
