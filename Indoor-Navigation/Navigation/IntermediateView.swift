//
//  ContentView.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 19.06.2023.
//

import SwiftUI

struct IntermediateView: View {
    @StateObject private var stateManager = StateManager()
    var selectedLocation: Int
    
    var body: some View {
            if stateManager.isSearchMatricRunning {
                WaitView()
            } else {
                LocationNavigationView(selectedLocation: selectedLocation)
            }
        }

        func isRunning() {
            stateManager.startSearch()
        }
}

struct IntermediateView_Previews: PreviewProvider {
    static var previews: some View {
        IntermediateView(selectedLocation: 0)
    }
}


class StateManager: ObservableObject {
    @Published var isSearchMatricRunning = true
    @ObservedObject var beaconReceiverViewModel = BeaconReceiverViewModel()

    func startSearch() {
        // Perform your asynchronous task here
        beaconReceiverViewModel.matrixSearchResult
        //DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // After the task is completed, update the state variable
            self.isSearchMatricRunning = false
        //}
    }
}
