//
//  BeaconReceiverViewControllerWrapper.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 18.06.2023.
//

import Foundation
import SwiftUI

struct BeaconReceiverViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> BeaconReceiverViewController {
        // Instantiate and configure your BeaconReceiverViewController
        let beaconReceiverViewController = BeaconReceiverViewController()
        // Perform any necessary setup or configuration
        return beaconReceiverViewController
    }

    func updateUIViewController(_ uiViewController: BeaconReceiverViewController, context: Context) {
        // Update the view controller if needed
    }
}

struct ContentView: View {
    var body: some View {
        BeaconReceiverViewControllerWrapper()
    }
}

