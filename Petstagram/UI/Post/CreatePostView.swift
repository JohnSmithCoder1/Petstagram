//
//  CreatePostView.swift
//  Petstagram
//
//  Created by J S on 8/14/21.
//

import SwiftUI

struct CreatePostView: View {
    @State var postImage = UIImage()
    
    var body: some View {
        NavigationView {
            TakePhotoView(onPhotoCapture: { image in
                postImage = image
            })
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
