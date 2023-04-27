//
//  Movie.swift
//  Movie
//
//  Created by Michelle Swastika on 27/04/23.
//

import Foundation
import SwiftUI

struct Movie: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var language: String
    var director: String
    var synopsis: String
    var nowPlaying: Bool
    var isFavorite: Bool
    
    //  In Landmark.swift, add a Category enumeration and a category property to the Landmark structure.
    var genre: Genre
    enum Genre: String, CaseIterable, Codable {
        case animation = "Animation"
        case adventure = "Adventure"
        case action = "Action"
        case drama = "Drama"
        case horror = "Horror"
        case sf = "Science Fiction"
    }
    
    //  Add an imageName property to read the name of the image from the data, and a computed image property that loads an image from the asset catalog.
    private var coverName: String
    var coverImage: Image {
        Image(coverName)
    }
    
    //  Add a computed property to the Landmark structure that returns the feature image, if it exists.
    var bannerImage: Image {
        Image(coverName + "_banner")
    }
}

