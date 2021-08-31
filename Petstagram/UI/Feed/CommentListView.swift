//
//  CommentListView.swift
//  Petstagram
//
//  Created by J S on 8/31/21.
//

import SwiftUI
import Combine

struct CommentListView: View {
    var image: UIImage
    private let postId: UUID
    @StateObject var list: CommentList
    @State var newCommentDescription = ""
    
    init(forPostId postId: UUID, image: UIImage) {
        // Since the type of list is changed by the StateObject property wrapper, we can't just set it directly in init
        self._list = StateObject(wrappedValue: CommentList(forPostId: postId))
        self.image = image
        self.postId = postId
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                HStack {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 160)
                        .clipped()
                    Spacer()
                }
                
                ForEach(list.comments) { comment in
                    CommentCell(comment: comment)
                    Divider()
                }
            }
            
            HStack(spacing: 2) {
                TextField("Add a comment...", text: $newCommentDescription)
                    .padding(7)
                    .background(Color.paleGrey)
                Button("Post", action: { })
                    .padding(8)
                    .accentColor(.accentGreen)
                    .background(Color.paleGrey)
            }
        }
        .padding()
        .navigationBarTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct CommentListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentListView()
//    }
//}
