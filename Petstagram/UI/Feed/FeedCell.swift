//
//  FeedCell.swift
//  Petstagram
//
//  Created by J S on 8/14/21.
//

import SwiftUI
import Combine

struct FeedCell: View {
    @Binding var post: Post
    let placeholderImage = UIImage(systemName: "photo")!
    @State var postImage: UIImage? = nil
    @State private var showComments = false
    @State private var showShareSheet = false
    @State private var subscriptions: Set<AnyCancellable> = []
    
    var body: some View {
        VStack {
            Image(uiImage: postImage ?? placeholderImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
                .overlay({
                    VStack(spacing: 15) {
                        Button(action: toggleLike) {
                            Image(post.isLiked ? "like-filled" : "like-empty")
                        }
                        Button(action: {
                            showComments = true
                        }) {
                            Image("comment")
                        }
                        Button(action: {
                            showShareSheet = true
                        }) {
                            Image("share")
                        }
                        .sheet(isPresented: $showShareSheet) {
                            createShareSheet()
                        }
                    }
                    .padding()
                    .shadow(radius: 3)
                }(), alignment: .bottomTrailing)
                .onAppear {
                    guard let imageId = self.post.id else { return }
                    let client = APIClient()
                    let request = DownloadImageRequest(imageId: imageId)
                    
                    client.publisherForRequest(request)
                        .replaceError(with: placeholderImage)
                        .sink { image in
                            postImage = image
                        }
                        .store(in: &subscriptions)
                }
            NavigationLink(
                destination: CommentListView(forPostId: post.id ?? UUID(), image: postImage ?? placeholderImage),
                isActive: $showComments,
                label: {
                    EmptyView()
                })
            
            CommentCell(comment: post)
        }
        // Prevents the cell from highlighting when selected
        .buttonStyle(PlainButtonStyle())
    }
    
    private func createShareSheet() -> ShareSheet {
        var items: [Any] = []
        
        if let image = postImage {
            items.append(image)
        }
        
        if !post.caption.isEmpty {
            items.append(post.caption)
        }
        
        return ShareSheet(activityItems: items)
    }
    
    private func toggleLike() {
        post.isLiked ? deleteLike() : addLike()
    }
    
    private func addLike() {
        guard let postId = post.id else { fatalError() }
        let client = APIClient()
        let request = AddLikeToPostRequest(postId: postId)
        
        client.publisherForRequest(request)
            .sink(receiveCompletion: { result in
                if case .finished = result {
                    post.isLiked = true
                }
            }, receiveValue: { _ in })
            .store(in: &subscriptions)
    }
    
    private func deleteLike() {
        guard let postId = post.id else { fatalError() }
        let client = APIClient()
        let request = DeleteLikeFromPostRequest(postId: postId)
        
        client.publisherForRequest(request)
            .sink(receiveCompletion: { result in
                if case .finished = result {
                    post.isLiked = false
                }
            }, receiveValue: { _ in })
            .store(in: &subscriptions)
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        let createdDate = Date().advanced(by: TimeInterval(exactly: -5*60)!)
        let post = Post(caption: "can you code me up some food?", createdAt: createdDate, createdBy: "UserName")
        
        var likedPost = post
        likedPost.isLiked = true
        
        return Group {
            NavigationView {
                // .constant() allows us to use the BINDING for post instead of passing post itself
                FeedCell(post: .constant(post))
                    .previewDisplayName("Placeholder Image")
            }
            NavigationView {
                FeedCell(post: .constant(post), postImage: UIImage(named: "friends")!)
                    .previewDisplayName("Unliked Post with Image")
            }
            NavigationView {
                FeedCell(post: .constant(likedPost), postImage: UIImage(named: "friends")!)
                    .previewDisplayName("Liked Post with Image")
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
