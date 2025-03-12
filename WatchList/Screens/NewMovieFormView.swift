//
//  NewMovieFormView.swift
//  WatchList
//
//  Created by Kyaw Thant Zin(George) on 3/12/25.
//

import SwiftUI

struct NewMovieFormView: View {
    //MARK: PROPERTIES
    @State private var title: String = ""
    @State private var selectedGenre: Genre = .kids
    
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
                
            }label: {
                Text("Save")
                    .font(.title2.weight(.medium))
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            //MARK: CANCEL BUTTON
            Button{
                
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
