//
//  CloseButton.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/25/1402 AP.
//

import SwiftUI

struct CloseButton: View {
    
    var body: some View {
        Image(systemName: "xmark.circle.fill")
            .foregroundColor(.gray)
            .font(.system(size: 28))
            .padding(3)
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}
