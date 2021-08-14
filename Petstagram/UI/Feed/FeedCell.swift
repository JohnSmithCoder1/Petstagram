//
//  FeedCell.swift
//  Petstagram
//
//  Created by J S on 8/14/21.
//

import SwiftUI

struct FeedCell: View {
    var post: Post
    let placeholderImage = UIImage(systemName: "photo")!
    @State var postImage: UIImage? = nil
    
    var body: some View {
        VStack {
            Image(uiImage: postImage ?? placeholderImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        let post = Post(caption: "can you code me up some food?", createdAt: Date())
        FeedCell(post: post)
            .previewLayout(.sizeThatFits)
    }
}
