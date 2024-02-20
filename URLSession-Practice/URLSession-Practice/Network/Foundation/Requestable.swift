//
//  Requestable.swift
//  URLSession-Practice
//
//  Created by EUNJU on 2/19/24.
//

import Foundation

protocol Requestable {
    var requestTimeOut: Float { get }
    
    func request(_ request: URLRequest, 
                 completion: @escaping (Result<NetworkResponse, Error>) -> Void)
}
