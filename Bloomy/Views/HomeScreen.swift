import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack {
            VStack {
                Color.white
                    .cornerRadius(20)
                    .padding(.top, 230)
                    .ignoresSafeArea()
            }
            .background(Color.biru3)
            VStack {
                TopView()
                    .padding(.bottom, -5)
                WeatherBox()
                NewsView()
                Spacer()
            }
            
        }
    }
}

#Preview {
    HomeScreen()
}

struct TopView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hello, \(authViewModel.name)")
                    .fontWeight(.medium)
                Text("Welcome Back")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
            }
            .foregroundColor(.white)
            Spacer()
            Image("keqing")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(200)
        }
        .padding(.horizontal, 24)
    }
}

struct NewsView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Text("Top News")
                        .bold()
                        .font(.system(size: 23))
                    Spacer()
                }
                TopNews()
                HStack {
                    Text("Today's News")
                        .bold()
                        .font(.system(size: 23))
                    Spacer()
                }
                .padding(.top, 8)
                TodaysNews()
                    
            }
            .padding(.leading, 20)
        }
    }
}
