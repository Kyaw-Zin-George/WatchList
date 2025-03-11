//
//  PageTabView.swift
//  WatchList
//
//  Created by Kyaw Thant Zin(George) on 3/11/25.
//

import SwiftUI

struct PageTabView: View {
    var icon: String
    var description: String
    var body: some View {
        VStack{
            Image(systemName: icon)
                .imageScale(.large)
                .font(.largeTitle)
                .symbolEffect(.breathe)
            
            Text(description)
                .font(.title.weight(.light))
                .fontWidth(.compressed)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    PageTabView(icon: "1.circle", description: "Add some favorite movies to watch")
}
