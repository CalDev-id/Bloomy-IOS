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
        NavigationView{
            if authViewModel.isLoggedIn {
                ContentView()
                    .environmentObject(authViewModel)
                    .onAppear {
                        authViewModel.checkUser()
                    }
            } else {
                LoginView()
                    .environmentObject(authViewModel)
            }
        }
    }
  }
}
