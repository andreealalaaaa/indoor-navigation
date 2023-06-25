//
//  NetworkAP+CoreDataProperties.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 17.05.2023.
//
//

import Foundation
import CoreData


extension NetworkAP {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NetworkAP> {
        return NSFetchRequest<NetworkAP>(entityName: "NetworkAP")
    }

    @NSManaged public var id: Int32
    @NSManaged public var ssid: String
    @NSManaged public var bssid: String
    @NSManaged public var signalStrength: Double

}

extension NetworkAP : Identifiable {

}
