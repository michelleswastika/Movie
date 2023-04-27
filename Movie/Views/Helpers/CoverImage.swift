//
//  CoverImage.swift
//  Movies
//
//  Created by Michelle Swastika on 27/04/23.
//

import SwiftUI

struct CoverImage: View {
    //  Add a stored image property to CircleImage.
        var image: Image
        
        var body: some View {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 200)
                .clipShape(Rectangle())
    //  Create another circle with a gray stroke, and then add it as an overlay to give the image a border.
                .overlay {
                    Rectangle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
        }
}

struct CoverImage_Previews: PreviewProvider {
    static var previews: some View {
        CoverImage(image: Image("sewudino"))
    }
}
