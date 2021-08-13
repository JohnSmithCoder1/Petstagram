//
//  ContentView.swift
//  Petstagram
//
//  Created by J S on 8/11/21.
//

import SwiftUI
import Combine

struct MainView: View {
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
        TabView {
            FeedView()
                .tabItem {
                    Image("home")
                    Text("Home")
                }.tag(0)
            Text("Tab Content 2")
                .tabItem {
                    Image("photo")
                    Text("Post")
                }.tag(1)
            Text("Tab Content 3")
                .tabItem {
                    Image("profile")
                    Text("Profile")
                }.tag(2)
        }
        .accentColor(.accentGreen)
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
        MainView()
    }
}
