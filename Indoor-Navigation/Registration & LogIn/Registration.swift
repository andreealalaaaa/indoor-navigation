//
//  Registration.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 06.05.2023.
//

import SwiftUI
import CoreData
import CloudKit
import CryptoKit

struct Registration: View {
    @ObservedObject var registrationViewModel = RegistrationViewModel()
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var selectedFaculty = ""
    @State private var selectedSpecialization = ""
    @State private var selectedYear = ""
    @State private var group = ""
    @State private var email = ""
    @State private var password = ""
    @State private var repeatedPassword = ""
    @State private var isFirstNameInvalid = false
    @State private var isLastNameInvalid = false
    @State private var showAlert = false
    @State private var isFirstNameEditing = false
    @State private var hasFirstNameBeenEdited = false
    @State private var redirectToHomePage = false
    @State private var getMeToLogin = false

    
    private var faculties = ["", "AC"]
    private var specializations = ["", "CTI RO", "CTI EN", "IS", "Informatica"]
    private var years = ["", "1", "2", "3", "4"]
    
    var isFirstNameValid: Bool {
        firstName.count > 1 && firstName.count <= 100
    }
    
    var isLastNameValid: Bool {
        lastName.count > 1 && lastName.count <= 100
    }
    
    var isFacultySelected: Bool {
        !selectedFaculty.isEmpty
    }
    
    var isSpecializationSelected: Bool {
        !selectedSpecialization.isEmpty
    }
    
    var isYearSelected: Bool {
        !selectedYear.isEmpty
    }
    
    var isGroupValid: Bool {
        !group.isEmpty
    }

    var isEmailValid: Bool {
       isValidEmail(email)
    }

    var isPasswordValid: Bool {
        password.count > 1 && password.count <= 100
    }

    var isRepeatedPasswordValid: Bool {
        password == repeatedPassword
    }
    
    var isFormValid: Bool {
        isFirstNameValid &&
        isLastNameValid &&
        isFacultySelected &&
        isSpecializationSelected &&
        isYearSelected &&
        isGroupValid &&
        !userExists() &&
        isEmailValid &&
        isPasswordValid
//        isRepeatedPasswordValid &&
    }
    
    var body: some View {
        NavigationView{
            ScrollViewReader { proxy in
                VStack {
                    Form {
                        Section(header: Text("Name")) {
                            name
                        }
                        Section(header: Text("Faculty")) {
                            faculty
                        }
                        Section(header: Text("Login")) {
                            login
                        }
                    }.background(Color.white)
              }
                .navigationTitle("Registration")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button(action: {
                            if !userExists() && isFormValid { // Check if user already exists
                                save()// Show alert if user exists
                                redirectToHomePage = true
                            } else {
                                showAlert = true
                            }
                        }) {
                            Text("Done")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel", role: .cancel) {
                            getMeToLogin = true
                        }
                    }
                }.fullScreenCover(isPresented: $redirectToHomePage) {
                    HomePageView()
                }
                .fullScreenCover(isPresented: $getMeToLogin) {
                    LoginView()
                }
            }
        }
        .alert(isPresented: $showAlert) {
                    if userExists() {
                        return Alert(
                            title: Text("User Already Exists"),
                            message: Text("The user with the provided email already exists."),
                            dismissButton: .default(Text("OK"))
                        )
                    } else {
                        return Alert(
                            title: Text("Validation Error"),
                            message: Text("Please fill in all the required fields correctly."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@(?:student\.upt\.ro|cs\.upt\.ro|upt\.ro)$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    func hashPassword(_ password: String) -> String {
        let inputData = Data(password.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashedString = hashedData.compactMap { String(format: "%02x", $0) }.joined()
        
        return hashedString
    }

    
    func save(){
        let hashedPassword = hashPassword(password)
        registrationViewModel.saveToDb(firstName: firstName, lastName: lastName, faculty: selectedFaculty, specialization: selectedSpecialization, year: Int(selectedYear) ?? 0, group: group, email: email, password: hashedPassword)
    }
    
    func fetch(){
        registrationViewModel.fetchUsersFromCoreData()
    }
    
    func userExists() -> Bool{
        fetch()
        if !registrationViewModel.fetchedUsers.isEmpty{
            for user in registrationViewModel.fetchedUsers{
                if user.email == email{
                    return true
                }
            }
        }
        return false
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
            TextField("First Name", text: $firstName, onEditingChanged: { isEditing in
                isFirstNameEditing = isEditing
                if !hasFirstNameBeenEdited && !isEditing {
                    hasFirstNameBeenEdited = true
                }
            })
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
                ForEach(faculties, id: \.self) { faculty in
                    Text(faculty).tag(faculty)
                }
            }
            .padding()
            .frame(width: 300.0, height: 40)

            Picker("Specialization", selection: $selectedSpecialization) {
                ForEach(specializations, id: \.self) { specialization in
                    Text(specialization).tag(specialization)
                }
            }
            .padding()
            .frame(width: 300.0, height: 40)
            
            Picker("Year", selection: $selectedYear) {
                ForEach(years, id: \.self) { year in
                    Text(year).tag(year)
                }
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
