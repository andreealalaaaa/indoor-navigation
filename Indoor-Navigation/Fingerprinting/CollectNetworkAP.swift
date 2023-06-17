//
//  CollectNetworkAP.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 17.05.2023.
//

import Foundation
import CoreLocation
import NetworkExtension

func collectWiFiInformation(completion: @escaping (_ networks: [NEHotspotNetwork]?, _ error: Error?) -> Void) {
    NEHotspotHelper.register(options: nil, queue: DispatchQueue.main) { (command) in
        if command.commandType == .evaluate || command.commandType == .filterScanList {
            if let networks = command.networkList {
                networks.forEach { (network) in
                    print("SSID: \(network.ssid)")
                    print("BSSID: \(network.bssid)")
                    print("Signal Strength: \(network.signalStrength)")
                    print("---------------")
                }
                completion(networks, nil)
            } else {
                completion(nil, nil)
            }
        }
    }
}


