//
//  ProfileView.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 10.05.2023.
//

import SwiftUI

struct ProfileView: View {
    @State private var changeDetails =  false
    @State private var changePassword =  false
    @State private var  savedLocations =  false
    @State private var logout = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    profile_img
                        .padding(.top)
                    profile_list
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

private extension ProfileView{
    var profile_img: some View{
        Section{
            Image(systemName: "graduationcap.fill")
                .foregroundColor(.mint)
                .font(.system(size:50))
                .cornerRadius(20)
                .shadow(radius: 3)
            
            Text("Hello, student_name!")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(.bottom)
                .shadow(radius: 5)

        }
    }
    
    var profile_list: some View{
        Section{
            Button("Change your details") {
                changeDetails = true
            }
            .frame(width: 300, height: 50)
            .background(.mint)
            .cornerRadius(10)
            .foregroundColor(.white)
            .shadow(radius: 5)
            .padding(.bottom)
            .overlay(
                NavigationLink(destination: ProfileDetailsView().navigationBarBackButtonHidden(true), isActive: $changeDetails) {
            })
            
            Button("Change password") {
                changePassword = true
            }
            .frame(width: 300, height: 50)
            .background(.mint)
            .cornerRadius(10)
            .foregroundColor(.white)
            .shadow(radius: 5)
            .padding(.bottom)
            .overlay(
                NavigationLink(destination:
                                PasswordChangeView().navigationBarBackButtonHidden(true), isActive: $changePassword) {
            })
            
            Button("Saved locations") {
                savedLocations = true
            }
            .frame(width: 300, height: 50)
            .background(.mint)
            .cornerRadius(10)
            .foregroundColor(.white)
            .shadow(radius: 5)
            .padding(.bottom)
            .overlay(
                NavigationLink(destination:
                                SavedLocationsView(), isActive: $savedLocations) {
            })
            
            Button("Log out") {
                logout = true
            }
            .frame(width: 300, height: 50)
            .background(.mint)
            .cornerRadius(10)
            .foregroundColor(.white)
            .shadow(radius: 5)
            .padding(.bottom)
            .overlay(
                NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true), isActive: $logout) {
            })
        }
    }
    
    var profile: some View{
        Section{
            Form{
                Text("Change your details")
                Text("Saved locations")
            }
        }
    }
}
