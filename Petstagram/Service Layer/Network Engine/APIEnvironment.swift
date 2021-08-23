//
//  APIEnvironment.swift
//  Petstagram
//
//  Created by J S on 8/11/21.
//

import Foundation

struct APIEnvironment {
    var baseUrl: URL
}

extension APIEnvironment {
    static let prod = APIEnvironment(baseUrl: URL(string: "http://192.168.1.208:8080/api/v1")!)
    #warning("Comment above line and uncomment below line to add SSL")
//    static let prod = APIEnvironment(baseUrl: URL(string: "https://192.168.1.208:8080/api/v1")!)
    static let local = APIEnvironment(baseUrl: URL(string: "http://localhost:8080/api/v1")!)
    static let local81 = APIEnvironment(baseUrl: URL(string: "http://localhost:8081/api/v1")!)
}
