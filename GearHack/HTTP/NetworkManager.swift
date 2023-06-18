import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()

    func sendRequest(withJson json: Data, password: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = URL(string: "http://172.20.10.11:3000/post") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonAsString = String(data: json, encoding: .utf8)
        let jsonBody: [String: Any] = ["jsonData": jsonAsString, "password": password]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: jsonBody)
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let httpResponse = response as? HTTPURLResponse {
                print("HTTP response code: \(httpResponse.statusCode)")
                if httpResponse.statusCode == 200 {
                    completion(.success(data))
                } else {
                    print("Received non-200 HTTP response: \(httpResponse.statusCode)")
                    completion(.failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: nil)))
                }
            }
        }
        task.resume()
    }
    
    func getAddress(completion: @escaping (Result<String, Error>) -> Void) {
        
        guard let url = URL(string: "http://172.20.10.11:3000/getAddress") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let httpResponse = response as? HTTPURLResponse {
                print("HTTP response code: \(httpResponse.statusCode)")
                if httpResponse.statusCode == 200 {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                           let address = json["address"] as? String {
                            completion(.success(address))
                        }
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    print("Received non-200 HTTP response: \(httpResponse.statusCode)")
                    completion(.failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: nil)))
                }
            }
        }
        task.resume()
    }


}
