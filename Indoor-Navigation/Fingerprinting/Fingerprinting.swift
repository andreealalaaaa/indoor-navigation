//
//  Fingerprinting.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 17.05.2023.
//

import Foundation
import CoreLocation

class Fingerprint{
    let ssid: String
    let bssid: String
    let signalStrength: Double
    
    init(ssid: String, bssid: String, signalStrength: Double) {
        self.ssid = ssid
        self.bssid = bssid
        self.signalStrength = signalStrength
    }
    
    func getFingerprint(){
        collectWiFiInformation { (networks, error) in
            if let error = error {
                print("Error collecting Wi-Fi information: \(error)")
                return
            }
            
            guard let networks = networks else {
                print("No Wi-Fi networks found")
                return
            }
            
            // Process the Wi-Fi networks
            for network in networks {
                let ssid = network.ssid
                let bssid = network.bssid
                let signalStrength = network.signalStrength
                
                let fingerprint = Fingerprint(ssid: ssid, bssid: bssid, signalStrength: signalStrength)
                
            }
        }
    }
}
