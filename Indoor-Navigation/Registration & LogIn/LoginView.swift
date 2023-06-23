//
//  LoginView.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 02.05.2023.
//

import SwiftUI
import CoreData
import CryptoKit

struct LoginView: View {
    @ObservedObject var registrationViewModel = RegistrationViewModel()
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var showingProfileScreen = false
    @State private var showAlert = false
    @State private var showWrongPasswordAlert = false
    @State private var showRegistration = false

    var hashedPassword: String {
        registrationViewModel.getStoredHashedPassword(email: username) ?? ""
    }
    var body: some View {
           NavigationView {
               ScrollView {
                   VStack {
                       Text("Find Your Way")
                           .font(.title)
                           .bold()
                           .padding(.bottom, 30)
                    
                       Map("map")
                           .frame(width: 400, height: 170)
                       loginDetails
                       loginButton
                       registerButton
                   }.padding(.top, 200)
               }
               .background(Color.white)
               .navigationBarHidden(true)
               .edgesIgnoringSafeArea(.all)
           }
           .preferredColorScheme(.light)
           .alert(isPresented: $showWrongPasswordAlert) {
               Alert(
                   title: Text("Incorrect Username or Password"),
                   message: Text("The entered combination is incorrect."),
                   dismissButton: .default(Text("OK"))
               )
           }
       }
    
    func passwordMatchesHashedPassword(password: String) -> Bool {
        let hashedPasswordInput = hashPassword(password)
        return hashedPassword == hashedPasswordInput
    }
    
    func hashPassword(_ password: String) -> String {
        let inputData = Data(password.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashedString = hashedData.compactMap { String(format: "%02x", $0) }.joined()
        
        return hashedString
    }
    
    func userExists() -> Bool{
        registrationViewModel.fetchUsersFromCoreData()
        
        if !registrationViewModel.fetchedUsers.isEmpty{
            for user in registrationViewModel.fetchedUsers{
                if user.email == username {
                    return true
                }
            }
        }
        return false
    }
    
    func authenticateUser(username: String, password: String) {
        if userExists() {
            if passwordMatchesHashedPassword(password: password) {
                showingProfileScreen = true
                print("merge")
            } else {
                showWrongPasswordAlert = true
            }
        } else {
            showWrongPasswordAlert = true
        }
    }
    
//    func authenticateUser(username: String, password: String) {
//            guard userExists() else {
//                showAlert = true
//                return
//            }
//
//            if passwordMatchesHashedPassword(password: password) || !userExists(){
//                showingProfileScreen = true
//                print("merge")
//            } else {
//                showWrongPasswordAlert = true
//            }
//        }
}


    struct Login_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
}

private extension LoginView{
    var loginIcon: some View{
        Section{
            Image("compass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            Text("Login")
                .font(.largeTitle)
                .bold()
                .padding()
                .padding(20)
        }
    }
    
    var loginDetails: some View{
        Section{
            TextField("Username", text: $username)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .border(.red, width: CGFloat(wrongUsername))
                
            
            SecureField("Password", text: $password)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .border(.red, width: CGFloat(wrongPassword))
        }
    }
    
    var loginButton: some View{
        Section{
            Button(action: {
                authenticateUser(username: username, password: password)
            }) {
                Text("Login")
            }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(.mint)
            .cornerRadius(10)
            .padding(10)
            .shadow(radius: 5)
        }.background(
            NavigationLink(destination: HomePageView().navigationBarBackButtonHidden(true), isActive: $showingProfileScreen) {
                EmptyView()
            }
            .hidden()
        )
    }
    
    var registerButton: some View{
        Section{
            Text("Don't have an account?")
                .font(.headline)
                .padding(.top, 10)
            NavigationLink(destination: Registration().navigationBarBackButtonHidden(true), isActive: $showRegistration) {
                Button(action: {
                    // Action to trigger registration screen
                    showRegistration = true
                }) {
                    Text("Register now")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(.mint)
                        .padding(.top, 0.5)
                }
                .background(Color.clear)
            }
            
        }
    }
}
