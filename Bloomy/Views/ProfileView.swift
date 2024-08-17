//
//  ProfileView.swift
//  Bloomy
//
//  Created by Heical Chandra on 14/08/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            VStack {
                Color.white
                    .cornerRadius(20)
                    .padding(.top, 300)
                    .ignoresSafeArea()
            }
            .background(Color.biru3)
            
            VStack {
                TopProfileView()
                Spacer()
                ProfileSettings()
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    ProfileView()
}

struct TopProfileView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("My Profile")
                        .fontWeight(.semibold)
                        .font(.system(size: 22))
                        .padding(.bottom, 5)
                    Spacer()
                    Image(systemName: "heart")
                        .fontWeight(.medium)
                        .font(.system(size: 22))
                    Image(systemName: "cart")
                        .fontWeight(.medium)
                        .font(.system(size: 22))
                }
                HStack{
                    Image("keqing")
                        .resizable()
                        .frame(width: 97, height: 97)
                        .cornerRadius(200)
                        .padding(.trailing, 10)
                    VStack(alignment: .leading) {
                        Text("Ical Mancing")
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                        Text("+62 878 1932 6417")
                            .font(.system(size: 18))
                        Text("haical31@gmail,com")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding(.bottom, 15)
                HStack{
                    Image(systemName: "storefront")
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                        .foregroundColor(.hitam)
                    Text("My Shop")
                        .fontWeight(.medium)
                        .foregroundColor(.hitam)
                    Spacer()
                    Image(systemName: "chevron.forward")
                        .foregroundColor(.hitam)
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .padding(.horizontal)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(10)
            }
            .foregroundColor(.white)
        }
        .padding(.horizontal, 24)
    }
}

struct ProfileSettings: View {
    var body: some View {
        VStack {
            HStack {
                Text("Profile Settings")
                    .foregroundColor(.hitam)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.top, 50)
            
            HStack{
                Image(systemName: "person.crop.square")
                    .foregroundColor(.hitam)
                    .font(.system(size: 28))
                    .fontWeight(.medium)
                VStack(alignment:.leading){
                    Text("Edit Profile")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .foregroundColor(.hitam)
                    Text("Update your profile information")
                        .fontWeight(.light)
                        .foregroundColor(.hitam)
                        .font(.system(size: 15))
                }
                Spacer()
                Image(systemName: "chevron.forward")
                    .foregroundColor(.hitam)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
            }
            .padding(.vertical)
            HStack{
                Image(systemName: "lock")
                    .foregroundColor(.hitam)
                    .font(.system(size: 28))
                    .fontWeight(.medium)
                VStack(alignment:.leading){
                    Text("Reset Password")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .foregroundColor(.hitam)
                    Text("Secure your account with a new password")
                        .fontWeight(.light)
                        .foregroundColor(.hitam)
                        .font(.system(size: 15))
                }
                Spacer()
                Image(systemName: "chevron.forward")
                    .foregroundColor(.hitam)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
            }
            Spacer()
            HStack{
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .fontWeight(.medium)
                    .foregroundColor(.hitam)
                    .font(.system(size: 24))
                Text("Sign out")
                    .foregroundColor(.hitam)
                    .font(.system(size: 17))
                    .fontWeight(.medium)
                Spacer()
                Text("App version 1.0.0")
                    .foregroundColor(.hitam)
                    .font(.system(size: 15))
                    .fontWeight(.light)
            }
            .padding(.bottom, 10)
        }
        .padding(.horizontal, 24)
    }
}
