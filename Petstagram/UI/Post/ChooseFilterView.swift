//
//  ChooseFilterView.swift
//  Petstagram
//
//  Created by J S on 8/31/21.
//

import SwiftUI

struct ChooseFilterView: View {
    private let filters = [
        CIFilter(name: "CISepiaTone")!,
        CIFilter(name: "CIVignette", parameters: [kCIInputIntensityKey: 5])!
    ]
    let image: UIImage
    @State private var allImages: [UIImage]
    @State private var selectedImage: UIImage
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ChooseFilterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChooseFilterView(image: UIImage(named: "wanna_play")!)
        }
    }
}
