//
//  BannerImage.swift
//  Movie
//
//  Created by Michelle Swastika on 27/04/23.
//

import SwiftUI

struct BannerImage: View {
    //  Add a stored image property to CircleImage.
        var image: Image
        
        var body: some View {
            image
                .aspectRatio(contentMode: .fit)
        }
}

struct BannerImage_Previews: PreviewProvider {
    static var previews: some View {
        BannerImage(image: Image("sewudino_banner"))
    }
}
