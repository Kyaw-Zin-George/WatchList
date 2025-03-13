//
//  ContentView.swift
//  WatchList
//
//  Created by Kyaw Thant Zin(George) on 3/10/25.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var movies: [Movie]
    var body: some View {
        List{
            ForEach(movies){ movie in
                HStack{
                    Text(movie.title)
                    Spacer()
                    Text(movie.genre.name)
                }
            }
        }
        .overlay{
            if movies.isEmpty{
                EmptyView()
            }
        }
    }
}

#Preview {
    ContentView()
}
