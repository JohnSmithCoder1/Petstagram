//
//  Post.swift
//  Petstagram
//
//  Created by J S on 8/11/21.
//

import Foundation

struct Post: Codable, Identifiable {
    var id: UUID?
    var caption: String
    var createdAt: Date
    var createdByUser: String
    
    init(id: UUID? = nil, caption: String, createdAt: Date = Date(), createdBy: String = currentUser?.id ?? "") {
        self.id = id
        self.createdByUser = createdBy
        self.createdAt = createdAt
        self.caption = caption
    }
}
