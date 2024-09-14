//
//  ColumnItemList.swift
//  Bloomy
//
//  Created by Heical Chandra on 20/08/24.
//

import SwiftUI

struct ColumnItemList: View {
    let name:String
    let price:Int
    let grade:String
    let img:String
    let weight:Int
    let location:String
    
    var body: some View {
        HStack {
            Image(img)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 114, maxHeight: 93)
                .cornerRadius(10)
                
            VStack(alignment:.leading) {
                HStack {
                    VStack(alignment:.leading){
                        Text(name)
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                        Text("Rp. \(String(price))/kg")
                            .foregroundColor(.hitam)
                            .fontWeight(.semibold)
                            .font(.system(size: 15))
                    }
                    Spacer()
                }
                Text("\(String(weight)) kg left")
                    .font(.system(size: 13))
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                HStack {
                    Image("locationLogo2")
                    Text(location)
                        .font(.system(size: 13))
                        .fontWeight(.light)
                    .foregroundColor(.gray)
                }
            }
            .padding(.horizontal,5)
        }
        .frame(maxWidth: .infinity)
        .background(.white)
    }
}

#Preview {
    ColumnItemList(name: "Ikan Bandeng", price: 20000, grade: "A", img: "ikan2", weight: 5, location: "Jakarta")
}
