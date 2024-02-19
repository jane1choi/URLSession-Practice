//
//  APIService.swift
//  URLSession-Practice
//
//  Created by EUNJU on 2/19/24.
//

import Foundation

final class NetworkProvider: Requestable {
    
    var requestTimeOut: Float = 30
    
    func request(_ request: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(requestTimeOut)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse,
               (200..<500).contains(httpResponse.statusCode),
               let data = data {
                completion(.success((data, httpResponse)))
            } else {
                completion(.failure(APIServiceError.serverError))
            }
        }
        task.resume()
    }
}
