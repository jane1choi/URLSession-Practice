//
//  TargetType.swift
//  URLSession-Practice
//
//  Created by EUNJU on 2/19/24.
//

import Foundation

protocol TargetType {
    var baseURL: String { get }
    var method: HttpMethod { get }
    var path: String { get }
    var parameters: RequestParameters { get }
    var header: HeaderType { get }
}

extension TargetType {
    
    var baseURL: String {
        return NetworkEnvironment.baseURL
    }
    
    private func asURL(_ url: String) throws -> URL {
        guard let url = URL(string: url) else {
            throw APIServiceError.urlEncodingError
        }

        return url
    }
    
    private func makeHeaderForRequest(to request: URLRequest) -> URLRequest {
        var request = request
        
        switch header {
            
        case .basic:
            request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HttpHeaderField.contentType.rawValue)
        }
        
        return request
    }
    
    private func makeParameterForRequest(to request: URLRequest, with url: URL) throws -> URLRequest {
        var request = request
        
        switch parameters {
            
        case .query(let query):
            let queryParams = query.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            request.url = components?.url
            
        case .queryBody(let query, let body):
            let queryParams = query.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            request.url = components?.url
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            
        case .requestBody(let body):
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            
        case .requestPlain:
            break
        }
        
        return request
    }
    
    func creatURLRequest() throws -> URLRequest {
        let url = try asURL(baseURL)
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest = self.makeHeaderForRequest(to: urlRequest)
        
        return try makeParameterForRequest(to: urlRequest, with: url)
    }
}
