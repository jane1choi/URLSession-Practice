//
//  MovieAPI.swift
//  URLSession-Practice
//
//  Created by EUNJU on 2/19/24.
//

import Foundation

final class MovieAPI: BaseAPI {
    
    static let shared = MovieAPI(provider: NetworkProvider())
    
    private override init(provider: NetworkProvider) {
        super.init(provider: provider)
    }
    
    func requestMovieDetailAPI(userKey: String, movieCode: String, 
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
            case .success(let result):
                let networkResult = self.judgeStatus(by: result.response.statusCode,
                                                     result.data,
                                                     MovieInformation.self)
                completion(networkResult)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
