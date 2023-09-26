//
//  AppetizerRemoteImage.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/24/1402 AP.
//

import SwiftUI

struct AppetizerRemoteImageView: View {
    
    @StateObject private var imageLoader = ImageLoader()
    var urlString: String

    var body: some View {
        ZStack {
            if let image = imageLoader.image {
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                     .shadow(radius: 5, y: 5)
            } else {
                ProgressView()
                    .tint(Color("brandPrimary"))
            }
        }
        
        .onAppear {
            imageLoader.loadImage(from: urlString)
        }
    }
}

struct AppetizerRemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerRemoteImageView( urlString: "")
    }
}
