//
//  PricePredictionView.swift
//  Bloomy
//
//  Created by Heical Chandra on 14/08/24.
//

import SwiftUI

struct PricePredictionView: View {
    var body: some View {
        ZStack{
            VStack {
                Color.silver
                    .cornerRadius(20)
                    .padding(.top, 180)
                    .ignoresSafeArea()
            }
            .background(Color.biru3)
            
            VStack {
                TopPriceView()
                Spacer()
                PricePrediction()
                PrimaryBTN(name: "Predict", todo: {})
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    PricePredictionView()
}

struct TopPriceView: View {
    var body: some View {
        HStack {
            VStack(alignment:.leading) {
                Text("Fish Pricing")
                Text("Price your fish, \nunveil the value in every catch!")
                    .font(.system(size: 20))
                    .padding(.vertical, 5)
            }
            .fontWeight(.semibold)
            .foregroundColor(.white)
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.top, 10)
    }
}


struct PricePrediction: View {
    @State var species: String? = nil
    @State private var selectedOption: String? = nil
    let options = ["Ikan Bandeng", "Ikan Teri", "Ikan K-Tongkol"]
    let actualPrice = [20000, 35000, 15000]
    let grade = ["A", "B", "C"]
    let sustainability = ["Sustainable", "Unsustainable"]
    let kosong = [" "]
    let weight = [1,2,3,4,5,6,7,8,9,10]
    
    var body: some View {
        VStack{
            List{
                Picker("Fish Species", selection: $selectedOption) {
                    ForEach(options, id: \.self) { flavor in
                        Text(flavor)
                    }
                }
                Picker("Actual Price", selection: $selectedOption) {
                    ForEach(actualPrice, id: \.self) { flavor in
                        Text(String(flavor))
                    }
                }
                HStack{
                    Picker("Catching Method", selection: $selectedOption) {
                        ForEach(kosong, id: \.self) { flavor in
                            Text(flavor)
                        }
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width / 2)
                    Picker("Grade", selection: $selectedOption) {
                        ForEach(grade, id: \.self) { flavor in
                            Text(flavor)
                        }
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width / 4)
                }
                Picker("Sustainability", selection: $selectedOption) {
                    ForEach(sustainability, id: \.self) { flavor in
                        Text(flavor)
                    }
                }
                Picker("Weight", selection: $selectedOption) {
                    ForEach(weight, id: \.self) { flavor in
                        HStack {
                            Text(String(flavor))
                            Text("Kg")
                        }
                    }
                }

            }
            .cornerRadius(20)
            .foregroundColor(.biru3)
            .padding(.vertical, 20)
            
        }
    }
}
