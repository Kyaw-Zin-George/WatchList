//
//  NewMovieFormView.swift
//  WatchList
//
//  Created by Kyaw Thant Zin(George) on 3/12/25.
//

import SwiftUI


struct NewMovieFormView: View {
    //MARK: PROPERTIES
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var selectedGenre: Genre = .kids
    
    //MARK: FUNCTIONS
    private func addNewMovie(){
        let newMovie = Movie(title: title, genre: selectedGenre)
        modelContext.insert(newMovie)
        title = ""
        selectedGenre = .kids
    }
    var body: some View {
        List {
            //MARK: HEADER
            Text("What To Watch")
                .font(.largeTitle.weight(.black))
                .foregroundStyle(.blue)
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .center)
                .padding(.vertical)
            //MARK: TITLE
            TextField("Movie Title", text: $title)
                .textFieldStyle(.roundedBorder)
                .font(.largeTitle.weight(.light))
             //MARK: GENRE
            Picker("Genre", selection: $selectedGenre) {
                ForEach(Genre.allCases, id: \.self) { genre in
                    Text(genre.name)
                        .tag(genre)
                }
            }
            //MARK: SAFE BUTTON
            Button{
                addNewMovie()
                dismiss()
            }label: {
                Text("Save")
                    .font(.title2.weight(.medium))
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            //MARK: CANCEL BUTTON
            Button{
                dismiss()
            }label: {
                Text("Cancel")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
            }
            
        }
    }
}

#Preview {
    NewMovieFormView()
}
