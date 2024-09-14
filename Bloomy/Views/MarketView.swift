//
//  MarketView.swift
//  Bloomy
//
//  Created by Heical Chandra on 20/08/24.
//

import SwiftUI

struct MarketView: View {
    var body: some View {
        ZStack{
            ZStack(alignment: .top) {
                Color.biru3
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 2)
                    .ignoresSafeArea()

                VStack {
                    TopMarketView()
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            ScrollView(.vertical, showsIndicators: false){
                VStack {
                    Market()
                        .ignoresSafeArea()
                }
                .padding(.top)
                .background(Color.begron2)
                .cornerRadius(20)
                .padding(.top, 120)
            }
        }
        .background(.white)
    }
}

#Preview {
    MarketView()
}

struct TopMarketView: View {
    var body: some View {
        HStack {
            VStack(alignment:.leading) {
                Text("Market")
                Text("Navigate the waves,\ndiscover your perfect fish!")
                    .font(.system(size: 20))
                    .padding(.vertical, 5)
            }
            .fontWeight(.semibold)
            .foregroundColor(.white)
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.top, 10)
        .padding(.bottom, 30)
    }
}
struct Fish: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
    let grade: String
    let img: String
    let weight: Int
    let location: String
}

struct Market: View {
    @State var textFieldText: String = ""
    let fishMarket = [
        Fish(name: "Ikan Bandeng", price: 20000, grade: "A", img: "ikan4", weight: 5, location: "Jakarta Utara"),
        Fish(name: "Ikan Cakalang", price: 50000, grade: "B", img: "ikan2", weight: 10, location: "Bandung"),
        Fish(name: "Ikan Tenggiri", price: 50000, grade: "B", img: "ikan3", weight: 10, location: "Jakarta Utara")
    ]
    var body: some View {
        VStack {
            TextField("Search Bloomy", text: $textFieldText)
                                .padding(.horizontal)
                                .frame(height: 50)
                                .foregroundColor(.black)
                                .background(Color.silver)
                                .cornerRadius(20)
                                .padding(.bottom, 10)
                                .padding(.horizontal, 24)
            
            HStack {
                Text("Fresh Catch of the Day")
                    .bold()
                    .font(.system(size: 23))
                    .foregroundColor(.hitam)
                Spacer()
            }
            .padding(.horizontal, 24)
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(fishMarket) { fish in
                        RowItemList(name: fish.name, price: fish.price, grade: fish.grade, img: fish.img, weight: fish.weight, location: fish.location)
                    }
                }
            }
            .padding(.leading, 24)
            .frame(maxHeight: 172)
            .padding(.bottom)
            VStack{
                HStack{
                    Text("Grade \"A\"")
                        .foregroundColor(.biru3)
                        .bold()
                        .font(.system(size: 17))
                        .padding(.bottom)
                        .overlay(
                            Rectangle()
                                .frame(height: 4) // Tebal border bawah
                                .foregroundColor(.biru3)
                                .cornerRadius(20)// Warna border
                                .padding(.top, 20), // Posisi border
                            alignment: .bottom
                        )
                    Text("Grade \"B\"")
                        .foregroundColor(.biru3)
                        .bold()
                        .font(.system(size: 17))
                        .padding(.bottom)
                        .padding(.horizontal, 30)
                    Text("Grade \"C\"")
                        .foregroundColor(.biru3)
                        .bold()
                        .font(.system(size: 17))
                        .padding(.bottom)

                }
                .padding(.bottom,1)
                .frame(maxWidth: .infinity)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.3))
                        .cornerRadius(20)
                        .padding(.top, 20),
                    alignment: .bottom
                )
                ScrollView(.vertical, showsIndicators: false){
                    VStack {
                        ForEach(fishMarket) { fish in
                            ColumnItemList(name: fish.name, price: fish.price, grade: fish.grade, img: fish.img, weight: fish.weight, location: fish.location)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical)
            }
            .padding(.top)
            
            .background(.white)

        }
        .padding(.top, 10)
        .frame(minHeight: UIScreen.main.bounds.height)
    }
}

