//
//  PrimaryBTN.swift
//  Bloomy
//
//  Created by Heical Chandra on 12/08/24.
//

import SwiftUI

struct PrimaryBTN: View {
    var name: String
    var todo: () -> Void  // Change todo to a closure

    var body: some View {
        Button(action: {
            todo()  // Call the closure when the button is pressed
        }) {
            Text(name)
                .foregroundColor(.white)
                .fontWeight(.semibold)
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: 40)
        .background(Color.color)
        .cornerRadius(10)
    }
}

#Preview {
    PrimaryBTN(name: "Take", todo: {})
}
