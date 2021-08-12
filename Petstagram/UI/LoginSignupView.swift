//
//  LoginSignupView.swift
//  Petstagram
//
//  Created by J S on 8/11/21.
//

import SwiftUI
import Combine

struct LoginSignupView: View {
    @State private var validationError = false
    @State private var requestError = false
    @State private var requestErrorText: String = ""
    @State var networkOperation: AnyCancellable?
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    private func toggleState() {
        //    authState = (authState == .signUp ? .signIn : .signUp)
    }
    
    private func doAuth() {
        //    networkOperation?.cancel()
        //    switch authState {
        //    case .signIn:
        //      doSignIn()
        //    case .signUp:
        //      doSignUp()
        //    }
    }
    
    private func doSignIn() {
        //    guard username.count > 0, password.count > 0 else {
        //      validationError = true
        //      return
        //    }
        //
        //    let client = APIClient()
        //    let request = SignInUserRequest(username: username, password: password)
        //    networkOperation = client.publisherForRequest(request)
        //      .sink(receiveCompletion: { result in
        //        handleResult(result)
        //      }, receiveValue: {_ in})
    }
    
    private func doSignUp() {
        //    guard username.count > 0, email.count > 0, password.count > 0 else {
        //      validationError = true
        //      return
        //    }
        //
        //    let client = APIClient()
        //    let request = SignUpUserRequest(username: username, email: email, password: password)
        //    networkOperation = client.publisherForRequest(request)
        //      .sink(receiveCompletion: { result in
        //        handleResult(result)
        //      }, receiveValue: {_ in})
    }
    
    private func handleResult(_ result: Subscribers.Completion<Error>) {
        //    if case .failure(let error) = result {
        //      // TODO: we could check for 401 and show a nicer error
        //      switch error {
        //      case APIError.requestFailed(let statusCode):
        //        requestErrorText = "Status code: \(statusCode)"
        //      case APIError.postProcessingFailed(let innerError):
        //        requestErrorText = "Error: \(String(describing: innerError))"
        //      default:
        //        requestErrorText = "An error occurred: \(String(describing: error))"
        //      }
        //    } else {
        //      requestErrorText = ""
        //      networkOperation = nil
        //    }
        //    requestError = requestErrorText.count > 0
    }
}

struct LoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignupView()
    }
}
