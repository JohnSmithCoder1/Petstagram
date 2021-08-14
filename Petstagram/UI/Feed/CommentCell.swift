//
//  CommentCell.swift
//  Petstagram
//
//  Created by J S on 8/14/21.
//

import SwiftUI

struct CommentCell: View {
    var post: Post

    let formatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.dateTimeStyle = .named
        formatter.unitsStyle = .short
        
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .frame(width: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(post.createdByUser)
                        .font(.headline)
                        .foregroundColor(.accentGreen)
                    
                    Text(formatter.localizedString(for: post.createdAt, relativeTo: Date()))
                        .font(.caption)
                }
                
                Spacer()
            }
            
            Text(post.caption)
        }
    }
}

struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        let activity = Date().advanced(by: TimeInterval(exactly: -5*60)!)
        let comment = "Can you code me up some food?"
        let user = "Jerry"
        let post = Post(caption: comment, createdAt: activity, createdBy: user)
        
        return CommentCell(post: post)
            .previewLayout(.sizeThatFits)
    }
}
