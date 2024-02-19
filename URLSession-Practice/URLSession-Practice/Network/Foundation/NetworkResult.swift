//
//  NetworkResult.swift
//  URLSession-Practice
//
//  Created by EUNJU on 2/19/24.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
