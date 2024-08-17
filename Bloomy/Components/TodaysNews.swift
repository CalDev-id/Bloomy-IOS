//
//  TodaysNews.swift
//  Bloomy
//
//  Created by Heical Chandra on 13/08/24.
//

import SwiftUI

struct TodaysNews: View {
    let todaysNews = [
        [
            "img": "todaysNews1",
            "title": "Illegal fishing still rife despite Indonesia- -Vietnam EEZ"
        ],
        [
            "img": "todaysNews2",
            "title": "Indonesia Peringkat Kedua Negara Penghasil Ikan Laut Terbesar Dunia"
        ],
        [
            "img": "todaysNews3",
            "title": "Daftar Wilayah Berpotensi Gelombang Tinggi di Indonesia Hari Ini"
        ],
        [
            "img": "topNews1",
            "title": "Kronologi Kapal Maling Ikan Berbendera Filipina Ditangkap..."
        ],
        [
            "img": "topNews5",
            "title": "Potensi Sumber Daya Ikan Indonesia Lebih dari 12 Juta Ton per Tahun"
        ]
    ]
    
    var body: some View {
        VStack {
            ForEach(todaysNews, id: \.self) { news in
                HStack{
                    Image(news["img"]!)
                        .resizable()
                        .frame(maxWidth: 123, maxHeight: 85)
                        .cornerRadius(10)
                    VStack(alignment: .leading) {
                        Text(news["title"]!)
                            .padding(.bottom, 5)
                            .font(.system(size: 16))
                        HStack{
                            Text("21 Jul 2023, 12:21 WIB")
                                .font(.system(size: 12))
                            Spacer()
                            HStack{
                                Text("Read more")
                                    .font(.system(size: 12))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.biru3)
                                    .padding(.trailing, -5)
                                Image(systemName: "chevron.forward")
                                    .font(.system(size: 8))
                                    .fontWeight(.bold)
                                    .foregroundColor(.biru3)
                            }
                        }
                    }

                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.trailing, 20)
    }
}

#Preview {
    TodaysNews()
}
