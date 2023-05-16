//
//  PasswordChangeView.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 13.05.2023.
//

import SwiftUI

struct PasswordChangeView: View {
    @State private var password = ""
    @State private var repeatedPassword = ""
    @State private var passwordBool = false
    
    var body: some View {
        NavigationView{
            ScrollViewReader { proxy in
                Form{
                    login
                }
                .navigationTitle("Change your password")
                .toolbar{
                    ToolbarItem(placement:.confirmationAction){
                        Button("Done"){
                            passwordBool = true
                        }.overlay(NavigationLink(destination:
                                                    ProfileView().navigationBarBackButtonHidden(true), isActive: $passwordBool){
                        })
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading){
                        Button("Cancel", role: .cancel){
                            passwordBool = true
                        }.overlay(
                            NavigationLink(destination: ProfileView().navigationBarBackButtonHidden(true), isActive: $passwordBool) {
                        })
                    }
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PasswordChangeView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordChangeView()
    }
}

private extension PasswordChangeView{
    var login: some View{
        Section{
//            TextField("Email", text: $email)
//                .padding()
//                .frame(width: 300, height: 40)
//                .background(Color.black.opacity(0.05))
//                .cornerRadius(10)
            
            SecureField("Current Password", text: $password)
                .padding()
                .frame(width: 300, height: 40)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            
            SecureField("New Password", text: $repeatedPassword)
                .padding()
                .frame(width: 300, height: 40)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            
            SecureField("Repeat Password", text: $repeatedPassword)
                .padding()
                .frame(width: 300, height: 40)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
        }
    }
}
