import Foundation

struct SigninRequest: Codable {
    let username: String
    let password: String
}

struct SigninResponse: Codable {
    let accessToken: String
}

struct SignupRequest: Codable {
    let username: String
    let password: String
}


