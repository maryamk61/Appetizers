//
//  AppetizerListRowView.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/22/1402 AP.
//

import SwiftUI


struct AppetizerListRowView: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack(spacing: 20) {
            // using regular network request with caching
//            AppetizerRemoteImageView(urlString: appetizer.imageURL)
//                .frame( width: 120, height: 80)
            
            AsyncImage(url: URL(string: appetizer.imageURL )) { phase in

                if let image = phase.image {
                    image
                        .resizable()
                        .modifier(AppetizerRowImageStyle())
                    // Displays the loaded image.
                    } else if phase.error != nil {
                        Image("placeholder")
                            .resizable()
                            .modifier(AppetizerRowImageStyle())
                            // Indicates an error.
                    } else {
                        ProgressView() // Acts as a placeholder.
                    }

            }
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title3)
                Text("$\(appetizer.price ,specifier: "%.2f")")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal, 0)
        .padding(.vertical, -2)
    }
}

struct AppetizerListRowView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListRowView(appetizer: MockData.mockAppetizer)
            
    }
}
