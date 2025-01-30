import Foundation

struct AuthService {
    static func signin(username: String, password: String, completion: @escaping(Result<SigninResponse, Error>) -> Void) {
        // guard url
        guard let url = URL(string: "\(APIConstants.baseURL)\(APIConstants.Endpoints.login)") else {
            print("Invalid URL")
            return
        }
        print("URL: \(url.absoluteString)")
        
        // guard encoding signin data to json
        let SigninData = SigninRequest(username: username, password: password)
        guard let jsonData = try? JSONEncoder().encode(SigninData) else {
            print("Failed to encode signin data")
            return
        }
        print("sigin data encoded")
        
        // make request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        // send request
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            defer { print("task completed") }
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as?HTTPURLResponse, httpResponse.statusCode == 201 else {
                completion(.failure(APIError.invalidResponse))
                return
            }
            print("server response code : \(httpResponse.statusCode)")
            
            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(SigninResponse.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("response decode failed : \(responseString)")
                }
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
    static func signup(username: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        // guard url
        guard let url = URL(string: "\(APIConstants.baseURL)\(APIConstants.Endpoints.signup)") else {
            print("Invalid URL")
            return
        }
        
        // guard encoding signup data to json
        let signupData = SignupRequest(username: username, password: password)
        guard let jsonData = try? JSONEncoder().encode(signupData) else {
            print("Failed to encode signup data")
            return
        }
        
        // make request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        // send request
        let task = URLSession.shared.dataTask(with: request) { _, response, error in
            defer { print("task completed") }
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                completion(.failure(APIError.invalidResponse))
                return
            }
            
            completion(.success(()))
        }
        task.resume()
    }
}
