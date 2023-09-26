//
//  AppetizerButton.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/28/1402 AP.
//

import SwiftUI

struct AppetizerButton: View {
    let title: String
    let buttonAction: () -> ()
    
    var body: some View {
        Button {
          buttonAction()
        } label: {
            Text(title)
                .font(.system(size: 16))
                .bold()
                .padding(.horizontal)
        }
        .standardButtonStyle()
        .padding(20)
    }
}

struct AppetizerButton_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerButton(title: "Add To Order", buttonAction: {
            print("button prressed!")
        })
    }
}
