//
//  LoginView.swift
//  Bloomy
//
//  Created by Heical Chandra on 14/09/24.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var textFieldEmail: String = ""
    @State private var textFieldPass: String = ""
    
    @State private var showError = false
    @State private var errorMessage = ""
    
    var body: some View {
        ZStack{
            ZStack{
                Color.biru3
                VStack{
                    Image("logo-bloomy")
                    Spacer()
                }
                .padding(.top, 70)
                .foregroundColor(.white)
            }
            ZStack{
                Color.silver
                    .cornerRadius(20)
                VStack{
                    TopLoginView(textFieldEmail: $textFieldEmail, textFieldPass: $textFieldPass)
                    if showError {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                    PrimaryBTN(name: "Sign in", todo: {
                        authViewModel.login(email: textFieldEmail, password: textFieldPass, completion: { error in
                            if let error = error {
                                showError = true
                                errorMessage = error.localizedDescription
                            }
                        })
                    })
                        .padding(.top, 10)
                    NavigationLink(destination: RegisterView().environmentObject(authViewModel)){
                        HStack{
                            Text("Don’t have an account?")
                            Text("Sign Up")
                                .foregroundColor(.biru3)
                                .fontWeight(.semibold)
                        }
                        .padding(.vertical, 5)
                    }
                    Spacer()
                }
            }
            .padding(.top, 180)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}

struct TopLoginView: View {
    @Binding var textFieldEmail: String
    @Binding var textFieldPass: String
    
    var body: some View {
        VStack {
            VStack{
                Text("Sign in")
                    .fontWeight(.bold)
                    .font(.title2)
                    .foregroundColor(.biru3)
                Text("Sign in to your account")
                VStack(alignment:.leading){
                    Text("Email")
                        .fontWeight(.semibold)
                        .font(.title3)
                        .foregroundColor(.biru3)
                    TextField("email adress here", text: $textFieldEmail)
                                        .padding(.horizontal)
                                        .frame(height: 50)
                                        .foregroundColor(.black)
                                        .background(Color.white)
                                        .cornerRadius(15).shadow(radius: 1)
                                        .autocapitalization(.none)
                    Text("Password")
                        .fontWeight(.semibold)
                        .font(.title3)
                        .foregroundColor(.biru3)
                        .autocapitalization(.none)
                    SecureField("password", text: $textFieldPass)
                                        .padding(.horizontal)
                                        .frame(height: 50)
                                        .foregroundColor(.black)
                                        .background(Color.white)
                                        .cornerRadius(15).shadow(radius: 1)
                                        .autocapitalization(.none)
                    HStack{
                        Spacer()
                        Text("Forgot Password?")
                            .fontWeight(.semibold)
                            .foregroundColor(.biru3)
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 24)
            }
            .padding(.top, 20)
        }
        .padding(.top)
    }
}
