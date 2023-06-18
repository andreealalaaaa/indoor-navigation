//
//  BeaconSpecs.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 18.06.2023.
//

import Foundation

class BeaconSpecs{
    let rssi: Double
    var proximity: Double
    var major: Int = 0
  
    init(rssi: Double, proximity: Double) {
        self.rssi = rssi
        self.proximity = proximity
    }
    
    init(rssi: Double, proximity: Double, major: Int) {
        self.rssi = rssi
        self.proximity = proximity
        self.major = major
    }
}
