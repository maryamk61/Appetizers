//
//  EmptyState.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/31/1402 AP.
//

import SwiftUI

struct EmptyStateView: View {
    let image: Image
    let text: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                image
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.gray)
                Text(text)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 15)
            }
            .offset(y: -30)
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(image: Image(systemName: "doc"), text: "No items in your order")
    }
}
