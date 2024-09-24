//
//  SplashScreen.swift
//  Bloomy
//
//  Created by Heical Chandra on 23/09/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            ContentView() // Navigasi ke konten utama setelah splash screen
        } else {
            VStack {
                Spacer()
                Image("logo-bloomy") // Ganti dengan logo yang sesuai
                    .resizable()
                    .scaledToFit()
                    .padding(50)
                Spacer()
            }
            .background(Color.biru3)
            .onAppear {
                // Delay 2 detik sebelum navigasi ke konten utama
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

//#Preview {
//    SplashScreenView()
//}
