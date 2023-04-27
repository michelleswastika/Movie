//
//  ContentView.swift
//  Movie
//
//  Created by Michelle Swastika on 27/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
            GenreHome()
                .tabItem {
                    Label("Now Playing", systemImage: "play")
                }
                .tag(Tab.featured)

            MovieList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
