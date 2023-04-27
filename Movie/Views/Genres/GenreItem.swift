//
//  GenreItem.swift
//  Movie
//
//  Created by Michelle Swastika on 27/04/23.
//

import SwiftUI

struct GenreItem: View {
    var movie: Movie

    var body: some View {
        VStack(alignment: .leading) {
            movie.coverImage
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height:200)
                .cornerRadius(5)
            Text(movie.title)
                .foregroundColor(.primary)
                .font(.caption)
                .frame(maxWidth: 155)
        }
        .padding(.leading, 15)
    }
}

struct GenreItem_Previews: PreviewProvider {
    static var previews: some View {
        GenreItem(movie: ModelData().movies[10])
    }
}
