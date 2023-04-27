//
//  GenreHome.swift
//  Movie
//
//  Created by Michelle Swastika on 27/04/23.
//

import SwiftUI

struct GenreHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                PageView(pages: modelData.playing.map { FeatureCard(movie: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.genres.keys.sorted(), id: \.self) { key in
                    GenreRow(genre: key, items: modelData.genres[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Now Playing")
        }
    }
}

struct GenreHome_Previews: PreviewProvider {
    static var previews: some View {
        GenreHome()
            .environmentObject(ModelData())
    }
}
