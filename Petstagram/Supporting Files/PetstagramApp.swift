//
//  PetstagramApp.swift
//  Petstagram
//
//  Created by J S on 8/11/21.
//

import SwiftUI
import Swifter

@main
struct PetstagramApp: App {
    // TODO: temp server code until API is ready
    // TODO: remove JsonData from target when this is removed
    let server: HttpServer = {
        let server = HttpServer()
        
        // Use a different port so unit tests will still work
        try? server.start(8081)
        
        server.GET["/api/v1/posts"] = { _ in HttpResponse.ok(.text(JsonData.goodFeed)) }
        server.POST["/api/v1/user"] = { _ in HttpResponse.ok(.text(JsonData.goodSignUp)) }
        server.POST["/api/v1/posts"] = { _ in HttpResponse.ok(.text(JsonData.postUploaded)) }
        server.POST["/api/v1/image"] = { _ in HttpResponse.ok(.text("")) }
        
        return server
    }()
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
