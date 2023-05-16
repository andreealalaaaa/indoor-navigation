//
//  Registration.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 06.05.2023.
//

import SwiftUI

struct Registration: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var selectedFaculty = 1
    @State private var selectedSpecialization = 1
    @State private var selectedYear = ""
    @State private var group = ""
    @State private var email = ""
    @State private var password = ""
    @State private var repeatedPassword = ""

    
    var body: some View {
        NavigationView{
            ScrollViewReader { proxy in
                Form{
                    name
                    faculty
                    login
                }
                .navigationTitle("Registration")
                .toolbar{
                    ToolbarItem(placement:.confirmationAction){
                        Button("Done"){
                            
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading){
                        Button("Cancel", role: .cancel){
                            
                        }
                    }
                }
            }
        }
    }
}

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration()
    }
}

private extension Registration{
    var name: some View {
        Section{
            TextField("First Name", text: $firstName)
                .padding()
                .frame(width: 300, height: 40)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            
            TextField("Last Name", text: $lastName)
                .padding()
                .frame(width: 300, height: 40)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
        }
    }
    
    var faculty: some View{
        Section{
            Picker("Faculty", selection: $selectedFaculty) {
                    Text("AC").tag(1)
                    Text("ETcTI").tag(2)
                }
            .padding()
            .frame(width: 300.0, height: 40)
            

            Picker("Specialization", selection: $selectedSpecialization) {
                    Text("CTI RO").tag(1)
                    Text("CTI EN").tag(2)
                    Text("IS").tag(3)
                    Text("Informatica").tag(4)
                }
            .padding()
            .frame(width: 300.0, height: 40)
            
            Picker("Year", selection: $selectedYear) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                }
            .padding()
            .frame(width: 300.0, height: 40)
            
            
            TextField("Group", text: $group)
                .padding()
                .frame(width: 300, height: 40)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
        }
    }
    
    var login: some View{
        Section{
            TextField("Email", text: $email)
                .padding()
                .frame(width: 300, height: 40)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            
            SecureField("Password", text: $password)
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
