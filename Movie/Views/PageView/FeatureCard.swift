//
//  FeatureCard.swift
//  Movie
//
//  Created by Michelle Swastika on 27/04/23.
//

import SwiftUI

struct FeatureCard: View {
    var movie: Movie

    var body: some View {
        movie.bannerImage
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverlay(movie: movie)
            }
    }
}

struct TextOverlay: View {
    var movie: Movie

    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.title)
                    .bold()
                Text(movie.director)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(movie: ModelData().playing[0])
    }
}
