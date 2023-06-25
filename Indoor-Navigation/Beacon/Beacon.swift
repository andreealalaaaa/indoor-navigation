//
//  Beacon.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 18.06.2023.
//

import Foundation

class Beacon{
    let uuid: UUID
    let major: Int
    let minor: Int
    let accuracy: Double
    let proximity: Double
    let rssi: Double
    
    init(uuid: UUID, major: Int, minor: Int, accuracy: Double, proximity: Double, rssi: Double) {
        self.uuid = uuid
        self.major = major
        self.minor = minor
        self.accuracy = accuracy
        self.proximity = proximity
        self.rssi = rssi
    }
}
