//
//  RowItemList.swift
//  Bloomy
//
//  Created by Heical Chandra on 20/08/24.
//

import SwiftUI

struct RowItemList: View {
    let name:String
    let price:Int
    let grade:String
    let img:String
    let weight:Int
    let location:String
    var body: some View {
        VStack {
            Image(img)
                .resizable()
                .scaledToFit()
                
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
                    Group{
                        Text(grade)
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                    .background(.biru3)
                    .cornerRadius(200)
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
        .frame(maxWidth: 160)
        .background(.white)
        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    RowItemList(name: "Ikan Bandeng", price: 20000, grade: "A", img: "ikan2", weight: 5, location: "Jakarta")
}
