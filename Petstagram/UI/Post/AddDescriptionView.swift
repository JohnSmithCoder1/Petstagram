//
//  AddDescriptionView.swift
//  Petstagram
//
//  Created by J S on 8/14/21.
//

import SwiftUI

struct AddDescriptionView: View {
    var image: UIImage
    @State var description = ""
    @StateObject private var controller = PostController()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 160)
                    .clipped()
                Spacer()
            }
            
            Text("Add a description:")
            TextEditor(text: $description)
            Spacer()
            
            HStack {
                Spacer()
                
                ZStack {
                    if controller.isRunning {
                        ProgressView()
                    }
                    
                    Button(action: {
                        controller.uploadPost(withDescription: description, image: image)
                    }) {
                        Text("Post")
                    }
                    .foregroundColor(controller.isRunning ? .gray : .accentGreen)
                    .disabled(controller.isRunning)
                }
            }
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
}

struct AddDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        AddDescriptionView(image: UIImage(named: "puppies")!)
    }
}
