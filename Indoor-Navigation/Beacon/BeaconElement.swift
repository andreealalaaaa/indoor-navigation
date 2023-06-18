//
//  BeaconElement.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 18.06.2023.
//

import Foundation

class BeaconElement{
    var beaconSpecsB0: BeaconSpecs
    var beaconSpecsB1: BeaconSpecs
    var beaconSpecsB2: BeaconSpecs
    var beaconSpecsB3: BeaconSpecs
    
    init(beaconSpecsB0: BeaconSpecs, beaconSpecsB1: BeaconSpecs, beaconSpecsB2: BeaconSpecs, beaconSpecsB3: BeaconSpecs) {
        self.beaconSpecsB0 = beaconSpecsB0
        self.beaconSpecsB1 = beaconSpecsB1
        self.beaconSpecsB2 = beaconSpecsB2
        self.beaconSpecsB3 = beaconSpecsB3
    }
}
