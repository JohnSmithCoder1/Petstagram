//
//  ContentView.swift
//  Petstagram
//
//  Created by J S on 8/11/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    var publisher: AnyCancellable = {
        let client = APIClient()
        let request = PostRequest()
        
        return client.publisherForRequest(request)
            .sink(receiveCompletion: { result in
                print(result)
            }, receiveValue: { newPosts in
                print(newPosts)
            })
    }()
     
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
