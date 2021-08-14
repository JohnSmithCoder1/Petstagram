//
//  PostRequests.swift
//  Petstagram
//
//  Created by J S on 8/11/21.
//

import Foundation

struct PostRequests: APIRequest {
    typealias Response = [Post]
        
    var method: HTTPMethod { return .GET }
    var path: String { return "/posts" }
    var body: Data? { return nil }
    
    func handle(response: Data) throws -> [Post] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return try decoder.decode(Response.self, from: response)
    }
}

struct CreateNewPostRequest: APIRequest, Codable {
    let post: Post
    
    init(caption: String) {
        self.post = Post(caption: caption)
    }
    
    typealias Response = Post
    
    var method: HTTPMethod { return .POST }
    var path: String { return "/posts" }
    var body: Data? {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        
        return try? encoder.encode(post)
    }
    
    func handle(response: Data) throws -> Post {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return try decoder.decode(Response.self, from: response)
    }
}
