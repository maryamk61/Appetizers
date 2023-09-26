//
//  StatisticSectionView.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/28/1402 AP.
//

import SwiftUI

struct NutritionInfoSectionView: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack(spacing: 40) {
            InfoColumn(title: "Calories", value: "\(appetizer.calories)")
            InfoColumn(title: "Carbs", value: "\(appetizer.carbs) g")
            InfoColumn(title: "Protein", value: "\(appetizer.protein) g")
        }
        .padding(.top, 20)
    }
}

struct InfoColumn : View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.black)
            Text(value)
                .italic()
                .foregroundColor(.gray)
        }
    }
}

struct StatisticSectionView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionInfoSectionView(appetizer: MockData.mockAppetizer)
    }
}
