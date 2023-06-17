//
//  NetworkAPController.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 17.05.2023.
//

import Foundation
import CoreData

func createNetworkAP (ssid: String, bssid: String, signalStrength: Double, in managedContext: NSManagedObjectContext){
    let newNetworkAP = NetworkAP(context: managedContext)
    
    newNetworkAP.ssid = ssid
    newNetworkAP.bssid = bssid
    newNetworkAP.signalStrength = signalStrength
    
    do {
        try managedContext.save()
    } catch {
        print("Error saving new NetworkAP: \(error)")
    }
}

func getNetworkAP(in managedContext: NSManagedObjectContext) -> [NetworkAP] {
        let fetchRequest: NSFetchRequest<NetworkAP> = NetworkAP.fetchRequest()

        do {
            let networkAPs = try managedContext.fetch(fetchRequest)
            return networkAPs
        } catch {
            print("Error fetching networkAPs: \(error)")
            return []
        }
}

func updateNetworkAP(networkAP: NetworkAP, ssid: String, bssid: String, signalStrength: Double, in managedContext: NSManagedObjectContext){
    networkAP.ssid = ssid
    networkAP.bssid = bssid
    networkAP.signalStrength = signalStrength

    do {
        try managedContext.save()
    } catch {
        print("Error updating NetworkAP: \(error)")
    }
}

func deleteNetworkAP(networkAP: NetworkAP, in managedContext: NSManagedObjectContext) {
    managedContext.delete(networkAP)

    do {
        try managedContext.save()
    } catch {
        print("Error deleting NetworkAP: \(error)")
    }
}
