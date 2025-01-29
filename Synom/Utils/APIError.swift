import Foundation

enum APIError: Error {
    case invalidResponse
    case noData
    case decodingError
    case unknown
}
