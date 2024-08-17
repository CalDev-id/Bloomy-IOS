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
            VStack(alignment: .leading) {
                Text("Fish Pricing")
                    .fontWeight(.semibold)
                    .font(.system(size: 19))
                    .padding(.bottom, 5)
                Text("Price your fish, \nunveil the value in every catch!")
                    .fontWeight(.bold)
                    .font(.system(size: 23))
            }
            .foregroundColor(.white)
        }
        .padding(.horizontal, 24)
    }
}


struct PricePrediction: View {
    @State var species: String? = nil
    @State private var selectedOption: String? = nil
    let options = ["Ikan Bandeng", "Ikan Teri", "Ikan K-Tongkol"]
    let grade = ["A", "B", "C"]
    let kosong = [" "]
    
    var body: some View {
        VStack{
            List{
                Picker("Fish Species", selection: $selectedOption) {
                    ForEach(options, id: \.self) { flavor in
                        Text(flavor)
                    }
                }
                Picker("Actual Price", selection: $selectedOption) {
                    ForEach(options, id: \.self) { flavor in
                        Text(flavor)
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

            }
            .cornerRadius(20)
            .foregroundColor(.biru3)
            .padding(.vertical, 20)
        }
    }
}
