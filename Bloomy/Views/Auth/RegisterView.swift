//
//  RegisterView.swift
//  Bloomy
//
//  Created by Heical Chandra on 14/09/24.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var name = ""
    @State private var textFieldEmail: String = ""
    @State private var textFieldPass: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var showError = false
    @State private var errorMessage = ""
    
    var body: some View {
        ZStack{
            ZStack{
                Color.biru3
                VStack{
                    Text("Sign Up")
                        .fontWeight(.bold)
                        .font(.title2)
                    Text("Create your new account")
                    Spacer()
                }
                .padding(.top, 70)
                .foregroundColor(.white)
            }
            ZStack{
                Color.silver
                    .cornerRadius(20)
                VStack{
                    TopRegisterView(textFieldEmail: $textFieldEmail, textFieldPass: $textFieldPass, textFieldName: $name, confirmPassword: $confirmPassword)
                    if showError {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                    PrimaryBTN(name: "Sign in", todo: {
                        if textFieldPass != confirmPassword {
                            // Jika password tidak cocok, tampilkan pesan error
                            errorMessage = "Password does not match."
                        } else {
                            // Password cocok, lanjutkan proses pendaftaran
                            errorMessage = ""
                            // Lakukan aksi pendaftaran di sini
                            print("Passwords match, proceed with signup.")
                            authViewModel.signUp(name: name, email: textFieldEmail, password: textFieldPass) { error in
                                if let error = error {
                                    showError = true
                                    errorMessage = error.localizedDescription
                                }
                            }
                        }
                    })
                        .padding(.top, 10)
                    NavigationLink(destination: LoginView().environmentObject(authViewModel)){
                        HStack{
                            Text("Already have an account?")
                            Text("Sign in")
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
    RegisterView()
}

struct TopRegisterView: View {
    @Binding var textFieldEmail: String
    @Binding var textFieldPass: String
    @Binding var textFieldName: String
    @Binding var confirmPassword: String
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Name")
                .fontWeight(.semibold)
                .font(.title3)
                .foregroundColor(.biru3)
            TextField("Your Name here", text: $textFieldName)
                                .padding(.horizontal)
                                .frame(height: 50)
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(15).shadow(radius: 1)
                                .autocapitalization(.none)
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
            Text("Confirm Password")
                .fontWeight(.semibold)
                .font(.title3)
                .foregroundColor(.biru3)
                .autocapitalization(.none)
            SecureField("password", text: $confirmPassword)
                                .padding(.horizontal)
                                .frame(height: 50)
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(15).shadow(radius: 1)
            HStack{
                Spacer()
                Text("Forgot Password?")
                    .fontWeight(.semibold)
                    .foregroundColor(.biru3)
            }
        }
        .padding(.top, 40)
        .padding(.horizontal, 24)
    }
}
