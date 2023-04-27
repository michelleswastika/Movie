//
//  GenreRow.swift
//  Movie
//
//  Created by Michelle Swastika on 27/04/23.
//

import SwiftUI

struct GenreRow: View {
    var genre: String
    var items: [Movie]

    var body: some View {
        VStack(alignment: .leading) {
            Text(genre)
                .font(.headline)
                .padding(.leading, 15)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { movie in
                        NavigationLink {
                            MovieDetail(movie: movie)
                        } label: {
                            GenreItem(movie: movie)
                        }
                    }
                }
            }
            .frame(height: 200)
            .padding(.bottom, 5)
        }
        .padding(.top, 5)
        .frame(height:280)
    }
}

struct GenreRow_Previews: PreviewProvider {
    static var movies = ModelData().movies

    static var previews: some View {
        GenreRow(
            genre: movies[0].genre.rawValue,
            items: Array(movies.prefix(4))
        )
    }
}
