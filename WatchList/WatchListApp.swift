//
//  WatchListApp.swift
//  WatchList
//
//  Created by Kyaw Thant Zin(George) on 3/10/25.
//

import SwiftUI
import SwiftData

@main
struct WatchListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Movie.self)
        }
    }
}
