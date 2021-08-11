//
//  APIClient.swift
//  Petstagram
//
//  Created by J S on 8/11/21.
//

import Foundation
import Combine

struct APIClient {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func PublisherForRequest<T: APIRequest>(_ request: T) -> AnyPublisher<T.Response, Error> {
        
    }
}
