//
//  AuthViewModel.swift
//  Bloomy
//
//  Created by Heical Chandra on 14/09/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var name = ""
    @Published var email = ""
    
    private var db = Firestore.firestore()
    
    func checkUser() {
        if let user = Auth.auth().currentUser {
            self.isLoggedIn = true
            self.email = user.email ?? ""
            print("Current user UID: \(user.uid)") // Tambahkan log UID

            // Ambil nama dari Firestore
            let docRef = db.collection("users").document(user.uid)
            docRef.getDocument { (document, error) in
                if let error = error {
                    print("Error fetching document: \(error.localizedDescription)")
                    return
                }
                
                guard let document = document, document.exists else {
                    print("Document does not exist for user UID: \(user.uid)")
                    return
                }
                
                if let data = document.data(), let userName = data["name"] as? String {
                    DispatchQueue.main.async {
                        self.name = userName
                        print("Fetched name: \(self.name)") // Log the fetched name
                    }
                } else {
                    print("Name field not found or is empty for user UID: \(user.uid)")
                }
            }

        } else {
            self.isLoggedIn = false
            print("No user is currently logged in.")
        }
    }

    
    func login(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(error)
                return
            }
            self.checkUser()
            completion(nil)
        }
    }
    
    func signUp(name: String, email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(error)
                return
            }
            
            // Simpan nama pengguna ke Firestore
            if let user = authResult?.user {
                self.db.collection("users").document(user.uid).setData([
                    "name": name,
                    "email": email
                ]) { error in
                    if let error = error {
                        completion(error)
                        return
                    }
                    self.checkUser()
                    completion(nil)
                }
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.isLoggedIn = false
            self.name = ""
            self.email = ""
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
