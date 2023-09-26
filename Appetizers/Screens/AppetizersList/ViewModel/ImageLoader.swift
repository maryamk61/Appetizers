//
//  ImageLoader.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/24/1402 AP.
//

import Foundation
import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image?
    

    func loadImage(from: String) {
        NetworkManager.shared.downloadImageWithCaching(from: from) { uiImage in
            guard let uiImage else {
                return
            }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}
