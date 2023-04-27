//
//  MovieDetail.swift
//  Movies
//
//  Created by Michelle Swastika on 27/04/23.
//

import SwiftUI

struct MovieDetail: View {
    @EnvironmentObject var modelData: ModelData
    var movie: Movie

    var movieIndex: Int {
        modelData.movies.firstIndex(where: { $0.id == movie.id })!
    }

    var body: some View {
        ScrollView {
            BannerImage(image: movie.bannerImage)
                .ignoresSafeArea(edges: .top)
                .frame(width: 200, height: 300)

            CoverImage(image: movie.coverImage)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(movie.title)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.movies[movieIndex].isFavorite)
                }
                Spacer()
                
                
                Text("Genre : \(movie.genre.rawValue)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Language : \(movie.language)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Director : \(movie.director)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Divider()

                Text("Synopsis \(movie.title)")
                    .font(.title2)
                Text(movie.synopsis)
            }
            .padding()
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        MovieDetail(movie: modelData.movies[0])
            .environmentObject(modelData)
    }
}
