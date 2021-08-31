//
//  CreatePostView.swift
//  Petstagram
//
//  Created by J S on 8/14/21.
//

import SwiftUI

struct CreatePostView: View {
    @State var showNext = false
    @State var postImage = UIImage()
    
    var body: some View {
        NavigationView {
            VStack {
                TakePhotoView(onPhotoCapture: { image in
                    postImage = image
                    showNext = true
                })
                
                NavigationLink(
                    destination: ChooseFilterView(image: postImage),
                    isActive: $showNext) {
                    EmptyView()
                }
            }
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
