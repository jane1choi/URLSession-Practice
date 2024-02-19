//
//  BaseAPI.swift
//  URLSession-Practice
//
//  Created by EUNJU on 2/19/24.
//

import Foundation

class BaseAPI {
    
    let provider = NetworkProvider()
    
    func judgeStatus<T: Decodable>(by statusCode: Int, _ data: Data, _ type: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        let decodedData = try? decoder.decode(T.self, from: data)
        
        switch statusCode {
        case 200..<300:
            return .success(decodedData ?? "None-Data")
        case 400..<500:
            return .requestErr(decodedData ?? "None-Data")
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
