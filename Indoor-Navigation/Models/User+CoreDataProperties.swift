//
//  User+CoreDataProperties.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 21.06.2023.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var faculty: String?
    @NSManaged public var year: Int16
    @NSManaged public var group: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var repeatPassword: String?
    @NSManaged public var specialization: String?
    @NSManaged public var id: Int16

}

extension User : Identifiable {

}
