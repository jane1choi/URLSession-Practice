//
//  MovieEndPoint.swift
//  URLSession-Practice
//
//  Created by EUNJU on 2/19/24.
//

import Foundation

enum MovieEndPoint {
    case requestMovieDetailInfo(userKey: String, movieCode: String)
}

extension MovieEndPoint: TargetType {
    
    var method: HttpMethod {
        switch self {
        case .requestMovieDetailInfo(_, _):
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .requestMovieDetailInfo(_, _):
            return "/movie/searchMovieInfo.json"
        }
    }
    
    var parameters: RequestParameters {
        switch self {
        case .requestMovieDetailInfo(let userKey, let movieCode):
            let requestQuery: [String: Any] = [
                "key": userKey,
                "movieCd": movieCode
            ]
            return .query(requestQuery)
        }
    }
    
    var header: HeaderType {
        switch self {
        case .requestMovieDetailInfo(_, _):
            return .basic
        }
    }
}
