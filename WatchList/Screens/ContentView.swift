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
    @State private var isSheetPresented: Bool = false
    var body: some View {
        List{
            ForEach(movies){ movie in
                HStack{
                    Text(movie.title)
                    Spacer()
                    Text(movie.genre.name)
                }
                .swipeActions {
                    Button(role: .destructive){
                        withAnimation {
                            modelContext.delete(movie)
                        }
                    }label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        }
        .overlay{
            if movies.isEmpty{
                EmptyView()
            }
        }
        //MARK: SAFE AREA
        .safeAreaInset(edge: .bottom,alignment: .center) {
            //New Movie Button
            Button{
                isSheetPresented.toggle()
            }label: {
                ButtonImageView(symbolName: "plus.circle.fill")
            }
        }//:Safe area
        .sheet(isPresented: $isSheetPresented) {
            NewMovieFormView()
        }

    }
}
#Preview("ListView"){
    ContentView()
        .modelContainer(Movie.preview)
}
#Preview("Empty View") {
    ContentView()
}
