//
//  MovieList.swift
//  Movie
//
//  Created by Michelle Swastika on 27/04/23.
//

import SwiftUI

struct MovieList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterGenre.all
    @State private var selectedMovie: Movie?

    enum FilterGenre: String, CaseIterable, Identifiable {
        case all = "All"
        case animation = "Animation"
        case adventure = "Adventure"
        case action = "Action"
        case drama = "Drama"
        case horror = "Horror"
        case sf = "Science Fiction"

        var id: FilterGenre { self }
    }

    var filteredMovies: [Movie] {
        modelData.movies.filter { movie in
            (!showFavoritesOnly || movie.isFavorite)
                && (filter == .all || filter.rawValue == movie.genre.rawValue)
        }
    }

    var title: String {
        let title = filter == .all ? "Movies" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }

    var index: Int? {
        modelData.movies.firstIndex(where: { $0.id == selectedMovie?.id })
    }

    var body: some View {
        NavigationView {
            List(selection: $selectedMovie) {
                ForEach(filteredMovies) { movie in
                    NavigationLink {
                        MovieDetail(movie: movie)
                    } label: {
                        MovieRow(movie: movie)
                    }
                    .tag(movie)
                }
            }
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Genre", selection: $filter) {
                            ForEach(FilterGenre.allCases) { genre in
                                Text(genre.rawValue).tag(genre)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            Text("Select a Movie")
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
            .environmentObject(ModelData())
    }
}
