//
//  LoginView.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 02.05.2023.
//

import SwiftUI
import CoreData

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var showingProfileScreen = false
        
        var body: some View {
            NavigationView {
                ZStack {
                    Color.white
//                        .ignoresSafeArea()
//                    Ellipse()
//                        .foregroundColor(.white)
                    VStack {
                        loginIcon
                        loginDetails
                        loginButton
                        
                        NavigationLink(destination: ProfileView().navigationBarBackButtonHidden(true), isActive: $showingProfileScreen) {
                        }
                    }
                }.navigationBarHidden(true)
            }
        }
        
        func authenticateUser(username: String, password: String) {
            if username.lowercased() == "" {
                wrongUsername = 0
                if password.lowercased() == "" {
                    wrongPassword = 0
                    showingProfileScreen = true
                } else {
                    wrongPassword = 2
                }
            } else {
                wrongUsername = 2
            }
        }
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
            Button("Login") {
                authenticateUser(username: username, password: password)
                }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(.mint)
            .cornerRadius(10)
            .padding(10)
            .shadow(radius: 5)
        }
    }
}
