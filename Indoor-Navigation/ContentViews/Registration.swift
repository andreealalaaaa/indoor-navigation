//
//  Registration.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 06.05.2023.
//

import SwiftUI

struct Registration: View {
    @State private var email = ""
    @State private var selectedYear = ""
    var body: some View {
        NavigationView{
            ZStack{
                Color.white
                    .ignoresSafeArea()
                VStack{
                    Text("Registration")
                        .bold()
                        .font(.largeTitle)
//                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 600, trailing: 0))
                    TextField("First Name", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    TextField("Last Name", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    Picker("Year", selection: $selectedYear) {
                            Text("1").tag(1)
                            Text("2").tag(2)
                            Text("3").tag(3)
                        }
                    .padding()
                    .frame(width: 300.0, height: 50)
                    
                    TextField("Group", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
//                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 400, trailing: 0))
                    
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    SecureField("Repeat Password", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
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
