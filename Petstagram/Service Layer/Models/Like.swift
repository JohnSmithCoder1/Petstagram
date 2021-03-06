//
//  Like.swift
//  Petstagram
//
//  Created by J S on 8/21/21.
//

import Foundation
import KituraContracts

struct Like: Codable {
    var id: UUID?
    var postId: UUID
    var createdByUser: String
    var createdAt: Date
    
    init(id: UUID? = nil, postId: UUID, createdBy: String = currentUser?.id ?? "", createdAt: Date = Date()) {
        self.id = id
        self.postId = postId
        self.createdByUser = createdBy
        self.createdAt = createdAt
    }
}

struct LikeParams: QueryParams {
    var postId: String
    var createdByUser: String
}
