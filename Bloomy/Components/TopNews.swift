//
//  TopNews.swift
//  Bloomy
//
//  Created by Heical Chandra on 13/08/24.
//

import SwiftUI

struct TopNews: View {
    let topNews = [
        [
            "img": "topNews1",
            "title": "Study: Indonesia’s extensive network of marine reserves are poorly managed"
        ],
        [
            "img": "topNews2",
            "title": "Experts, activists unite to blast Indonesia’s U-turn on sea sand exports"
        ],
        [
            "img": "topNews3",
            "title": "Nelayan Pertanyakan Rencana Menteri KKP Batasi Kuota Penangkapan Ikan"
        ],
        [
            "img": "topNews4",
            "title": "Luhut Akui Indeks Kesehatan Laut RI Masih di Bawah Dunia"
        ],
        [
            "img": "topNews5",
            "title": "LIPI: Potensi Benih Lobster Laut RI 20 Miliar Ekor per Tahun"
        ]
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(topNews, id: \.self) { news in
                    ZStack{
                        Image(news["img"]!)
                            .resizable()
                        VStack {
                            Spacer()
                            Text(news["title"]!)
                                .font(.system(size: 16))
                                .padding(.horizontal, 10)
                                .padding(.bottom)
                        }
                        .frame(maxWidth: .infinity)
                        .background(.black.opacity(0.5))
                        .foregroundColor(.white)
                    }
                    .frame(maxWidth: 230, maxHeight: 148)
                    .cornerRadius(20)
                }
            }
        }
    }
}

#Preview {
    TopNews()
}
