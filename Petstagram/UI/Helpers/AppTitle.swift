//
//  AppTitle.swift
//  Petstagram
//
//  Created by J S on 8/11/21.
//

import SwiftUI

struct AppTitle: View {
    var body: some View {
        Text("petstagram")
            .font(.custom("CoolStoryregular", size: 48))
    }
}

struct AppTitle_Previews: PreviewProvider {
    static var previews: some View {
        AppTitle()
            .previewLayout(.sizeThatFits)
    }
}
