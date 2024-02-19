//
//  MovieAPI.swift
//  URLSession-Practice
//
//  Created by EUNJU on 2/19/24.
//

import Foundation

final class MovieAPI: BaseAPI {
    
    static let shared = MovieAPI()
    
    private override init() {}
    
    func requestLoginAPI(userKey: String, movieCode: String, 
                         completion: @escaping ((NetworkResult<Any>) -> Void)) {
        guard let request = try? MovieEndPoint
            .requestMovieDetailInfo(userKey: userKey, movieCode: movieCode)
            .creatURLRequest()
        else {
            completion(.networkFail)
            return
        }
        
        provider.request(request) { result in
            switch result {
            case .success((let data, let response)):
                let networkResult = self.judgeStatus(by: response.statusCode, data, MovieInformation.self)
                completion(networkResult)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
