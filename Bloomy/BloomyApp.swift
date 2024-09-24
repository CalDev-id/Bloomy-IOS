//
//  BloomyApp.swift
//  Bloomy
//
//  Created by Heical Chandra on 10/08/24.
//

//import SwiftUI
//import FirebaseCore
//import FirebaseFirestore
//import FirebaseAuth
//
//@main
//struct BloomyApp: App {
//
//    init(){
//        FirebaseApp.configure()
//    }
//    
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct BloomyApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if authViewModel.isLoggedIn {
                    SplashScreenView()
                        .environmentObject(authViewModel)
                        .onAppear {
                            authViewModel.checkUser() // Mengecek status session saat aplikasi dimulai
                        }
                } else {
                    LoginView()
                        .environmentObject(authViewModel)
                        .onAppear {
                            authViewModel.checkUser() // Mengecek apakah pengguna masih dalam session saat aplikasi dimulai
                        }
                }
            }
        }
    }
}



