//
//  ContentView.swift
//  Petstagram
//
//  Created by J S on 8/11/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var showingLogin = true
    
    let signInPublisher = NotificationCenter.default
        .publisher(for: .signInNotification)
        .receive(on: RunLoop.main)
    
    let signOutPublisher = NotificationCenter.default
        .publisher(for: .signOutNotification)
        .receive(on: RunLoop.main)
    
//    var publisher: AnyCancellable = {
//        let client = APIClient()
//        let request = PostRequest()
//
//        return client.publisherForRequest(request)
//            .sink(receiveCompletion: { result in
//                print(result)
//            }, receiveValue: { newPosts in
//                print(newPosts)
//            })
//    }()
     
    var body: some View {
        Text("Hello, world!")
            .padding()
            .fullScreenCover(isPresented: $showingLogin) {
                LoginSignupView()
            }
            .onReceive(signInPublisher) { _ in
                showingLogin = false
            }
            .onReceive(signOutPublisher) { _ in
                showingLogin = true
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
