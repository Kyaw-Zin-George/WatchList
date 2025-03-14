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
    @State private var randedMovie: String = ""
    @State private var isShowingAlert: Bool = false
    //MARK: FUNCTION
    func randomMovieGenerator(){
        randedMovie = movies.randomElement()!.title
    }
    var body: some View {
        List{
            if !movies.isEmpty {
                Section(
                    header:
                        VStack{
                            Text("WatchList")
                                .font(.largeTitle.weight(.black))
                                .foregroundStyle(.blue.gradient)
                                .padding()
                            HStack{
                                Label("Title", systemImage: "movieclapper")
                                Spacer()
                                Label("Genre",systemImage: "tag")
                            }
                        }
                ) {
                    ForEach(movies){ movie in
                        HStack{
                            Text(movie.title)
                                .font(.title.weight(.light))
                                .padding(.vertical,2)
                            Spacer()
                            Text(movie.genre.name)
                                .font(.footnote.weight(.medium))
                                .padding(.horizontal,6)
                                .padding(.vertical,3)
                                .background(
                                    Capsule()
                                        .stroke(lineWidth: 1)
                                )
                                .foregroundStyle(.tertiary)
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
            HStack {
                Button{
                    randomMovieGenerator()
                    isShowingAlert = true
                }label: {
                    ButtonImageView(symbolName: arrowTriHeadCircle)
                }
                .alert(randedMovie, isPresented: $isShowingAlert){
                    Button("Ok", role: .cancel){
                        
                    }
                    .accessibilityLabel("Random Movie")
                    .sensoryFeedback(.success, trigger: isShowingAlert)
                }
                
                Spacer()
                Button{
                    isSheetPresented.toggle()
                }label: {
                    ButtonImageView(symbolName: "plus.circle.fill")
                }
                .accessibilityLabel("New Movie")
                .sensoryFeedback(.success, trigger: isSheetPresented)
            }.padding(.horizontal)
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
