//
//  NetworkClient.swift
//  RentCar
//
//  Created by Pavel Koyushev on 16.07.2024.
//

import Foundation

final class NetworkClient {
    
    func loadRequest(endpoint: Endpoint) async throws -> (Data, URLResponse) {
        let request = try await createRequest(endpoint: endpoint)
#if DEBUG
        print(request.cURL(pretty: true))
#endif
        let (data, response) = try await URLSession.shared.data(for: request)
        return (data, response)
    }
    
    func createRequest(endpoint: Endpoint) async throws -> URLRequest {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = endpoint.baseURL.host
        components.path = endpoint.path
        
        guard let url = components.url
        else { throw NetworkError.invalidURL }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue.capitalized
        
        
        return urlRequest
    }
    
    func sendRequest<T: Codable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T {
        
        do {
            let (data, response) = try await loadRequest(endpoint: endpoint)
            
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.noResponse
            }
            
#if DEBUG
            print(data.prettyPrintedJSONString ?? "")
#endif

            switch response.statusCode {
            case 200...299:
                do {
                    let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
                    return decodedResponse
                } catch {
#if DEBUG
                    print(error)
#endif
                    throw NetworkError.decoded
                }
                
            default:
                throw NetworkError.network
            }
            
        } catch {
            throw error
        }
    }
}
