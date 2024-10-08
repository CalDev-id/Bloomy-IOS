//
//  ContentView.swift
//  Bloomy
//
//  Created by Heical Chandra on 10/08/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
//            GradingScreen()
            PredictView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Grading")
                }
            
//            MarketScreen()
            MarketView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Market")
                }
            
//            PricingScreen()
            PricePredictionView()
                .tabItem {
                    Image(systemName: "tag.fill")
                    Text("Pricing")
                }
            
//            ProfileScreen()
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
            
        }
        .accentColor(.biru3)
        .background(.white)
    }
}

#Preview {
    ContentView()
}
