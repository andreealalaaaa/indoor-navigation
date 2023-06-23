//
//  RegistrationViewModel.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 21.06.2023.
//

import Foundation
import CoreData
import CloudKit

class RegistrationViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    var currentMaxID: Int16 = 0
    var fetchedUsers: [User] = []
    
    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        return DataController.shared.container
    }()
    
    
    func isValid(){
        
    }
    
    
    func saveToDb(firstName: String, lastName: String, faculty: String, specialization: String, year: Int, group: String, email: String, password: String) {
        let context = persistentContainer.viewContext
        let user = User(context: context)
        
        // Set user properties
        currentMaxID += 1
        user.id = currentMaxID
        user.firstName = firstName
        user.lastName = lastName
        user.faculty = faculty
        user.specialization = specialization
        user.year = Int16(year)
        user.group = group
        user.email = email
        user.password = password
//        user.repeatPassword = repeatPassword

        do {
            try context.save()
            print("User saved successfully to Core Data.")
        } catch {
            print("Failed to save user data to Core Data: \(error)")
        }
        
        let record = CKRecord(recordType: "User")
        
        // Set record field values
        record.setValue(user.firstName, forKey: "firstName")
        record.setValue(user.lastName, forKey: "lastName")
        record.setValue(user.faculty, forKey: "faculty")
        record.setValue(user.specialization, forKey: "specialization")
        record.setValue(user.year, forKey: "year")
        record.setValue(user.group, forKey: "group")
        record.setValue(user.email, forKey: "email")
        record.setValue(user.password, forKey: "password")
//        record.setValue(user.repeatPassword, forKey: "repeatPassword")
        
        print("Set record field values.")

        // Save the record to CloudKit
        let database = CKContainer.default().privateCloudDatabase
        database.save(record) { (_, error) in
            if let error = error {
                print("Failed to save record to CloudKit: \(error)")
            } else {
                print("Record saved to CloudKit")
            }
        }
    }

    
    func prepareToFetchUsers(recordType: String, predicate: NSPredicate, completion: @escaping ([CKRecord]?, Error?) -> Void) {
        let query = CKQuery(recordType: recordType, predicate: predicate)
        let database = CKContainer.default().publicCloudDatabase
        database.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error {
                completion(nil, error)
                return
            }

            if let records = records {
                completion(Array(records), nil)
            }
        }
        
        printUsers()
    }
    
    func fetchUsersFromCoreData() {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()

        do {
            let users = try context.fetch(fetchRequest)
            fetchedUsers = users
            
            for user in fetchedUsers {
                print(user.email!)
            }
        } catch {
            print("Failed to fetch users from Core Data: \(error)")
        }
    }


    func fetchUsers() {
        let recordType = "User"
        let predicate = NSPredicate(value: true)
        
        prepareToFetchUsers(recordType: recordType, predicate: predicate) { (records, error) in
            if let error = error {
                print("Failed to fetch records from CloudKit: \(error)")
            } else if let records = records {
                let users = records.compactMap { record -> User? in
                    guard let firstName = record["firstName"] as? String,
                          let lastName = record["lastName"] as? String,
                          let faculty = record["faculty"] as? String,
                          let specialization = record["specialization"] as? String,
                          let year = record["year"] as? Int16,
                          let group = record["group"] as? String,
                          let email = record["email"] as? String,
                          let password = record["password"] as? String,
                          let repeatPassword = record["repeatPassword"] as? String else {
                        return nil
                    }
                    
                    let user = User()
                    user.firstName = firstName
                    user.lastName = lastName
                    user.faculty = faculty
                    user.specialization = specialization
                    user.year = year
                    user.group = group
                    user.email = email
                    user.password = password
                    
                    return user
                }
                DispatchQueue.main.async {
                    self.fetchedUsers = users
                }
            }
        }
    }
    
    func getStoredHashedPassword(email: String) -> String? {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        fetchRequest.fetchLimit = 1

        do {
            let users = try context.fetch(fetchRequest)
            if let user = users.first {
                return user.password
            }
        } catch {
            print("Failed to fetch user: \(error)")
        }

        return nil
    }

    
//    func fetchUsers(){
//        let context = persistentContainer.viewContext
//        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
//
//        do {
//                let users = try context.fetch(fetchRequest)
//                for user in users {
//                    let firstName = user.firstName
//                    let lastName = user.lastName
//                    let faculty = user.faculty
//                    let specialization = user.specialization
//                    let year = user.year
//                    let group = user.group
//                    let email = user.email
//                    let password = user.password
//                    let repeatedPassword = user.repeatPassword
//
//                    let u = User()
//                    u.firstName = firstName
//                    u.lastName = lastName
//                    u.faculty = faculty
//                    u.specialization = specialization
//                    u.year = year
//                    u.group = group
//                    u.email = email
//                    u.password = password
//                    u.repeatPassword = repeatedPassword
//
//                    fetchedUsers.append(u)
//                }
//            } catch {
//                print("Failed to fetch users: \(error)")
//            }
//            self.printUsers()
//        }
    
    
    
    
    
    func printUsers(){
        
        fetchUsersFromCoreData()
        fetchUsers()
        for u in fetchedUsers{
            print(u.email)
        }
    }
    
}
