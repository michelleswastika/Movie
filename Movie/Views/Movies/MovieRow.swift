//
//  MovieRow.swift
//  Movie
//
//  Created by Michelle Swastika on 27/04/23.
//

import SwiftUI

struct MovieRow: View {
    var movie: Movie

    var body: some View {
        HStack {
            movie.coverImage
                .resizable()
                .frame(width: 50, height: 80)
                .cornerRadius(3)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .bold()
            }

            Spacer()

            if movie.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var movies = ModelData().movies

    static var previews: some View {
        Group {
            MovieRow(movie: movies[0])
            MovieRow(movie: movies[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
