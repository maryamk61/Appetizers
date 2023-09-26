//
//  AppetizeDetailsView.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/25/1402 AP.
//

import SwiftUI

struct AppetizeDetailsView: View {
    @Binding var showDetailsView: Bool
    let appetizer: Appetizer
    @EnvironmentObject var ordersObject: Order
    
    var body: some View {
        VStack {
            AppetizerRemoteImageView(urlString: appetizer.imageURL)
                .frame(width: 300, height: 225)
            Text(appetizer.name)
                .font(.title2)
                .bold()
                .padding(.vertical)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.7)
                .foregroundColor(.black)
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            
            NutritionInfoSectionView(appetizer: appetizer)
            
            Spacer()
            AppetizerButton(title: "$\(String(format: "%.2f", appetizer.price)) - Add To Order", buttonAction: {
                self.ordersObject.addToOrders(item: appetizer)
                withAnimation(.easeInOut(duration: 0.2)) {
                    showDetailsView = false
                }
            })
            .tint(Color("DetailsButton"))
            
        }
        .overlay(alignment: .topTrailing) {
            CloseButton()
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        showDetailsView = false
                    }
                }
        }
        .padding(.horizontal,10)
        .frame(width: 300, height: 525)
        .background(.white)
        .cornerRadius(12)
        .shadow(radius:40)
    }
}

struct AppetizeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizeDetailsView(showDetailsView: .constant(false), appetizer: MockData.mockAppetizer)
            
    }
}
