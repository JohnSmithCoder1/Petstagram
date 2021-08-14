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
}
