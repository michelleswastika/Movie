//
//  MovieApp.swift
//  Movie
//
//  Created by Michelle Swastika on 27/04/23.
//

import SwiftUI

@main
struct MovieApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
