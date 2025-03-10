//
//  Movie.swift
//  WatchList
//
//  Created by Kyaw Thant Zin(George) on 3/10/25.
//

import Foundation

import SwiftData

@Model
class Movie {
    var title: String
    var genre: Genre
    
    init(title: String, genre: Genre) {
        self.title = title
        self.genre = genre
    }
}

extension Movie {
    @MainActor
    static var preview: ModelContainer{
        let container = try! ModelContainer(for: Movie.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        container.mainContext.insert(Movie(title: "The John Wick", genre: Genre(rawValue: 1)!))
        container.mainContext.insert(Movie(title: "Inception", genre: Genre(rawValue: 2)!))
        container.mainContext.insert(Movie(title: "The Dark Knight", genre: Genre(rawValue: 3)!))
        container.mainContext.insert(Movie(title: "The Godfather", genre: Genre(rawValue: 4)!))
        container.mainContext.insert(Movie(title: "The Shawshank Redemption", genre: Genre(rawValue: 5)!))
        container.mainContext.insert(Movie(title: "The Godfather: Part II", genre: Genre(rawValue: 6)!))
        container.mainContext.insert(Movie(title: "The Dark Knight Rises", genre: Genre(rawValue: 7)!))
        container.mainContext.insert(Movie(title: "Dirty Dancing", genre: Genre(rawValue: 10)!))
        
        return container
    }
}
