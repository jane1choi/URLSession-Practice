//
//  HeaderType.swift
//  URLSession-Practice
//
//  Created by EUNJU on 2/19/24.
//

import Foundation

enum HeaderType {
    case basic
}

enum HttpHeaderField: String {
    case contentType = "Content-Type"
}

enum ContentType: String {
    case json = "application/json"
}

enum RequestParameters {
    case query(_ query: [String : Any])
    case queryBody(_ query: [String : Any], _ body: [String : Any])
    case requestBody(_ body: [String : Any])
    case requestPlain
}
