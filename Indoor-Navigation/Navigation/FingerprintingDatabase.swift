//
//  FingerprintingDatabase.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 25.06.2023.
//

import Foundation

class FingerprintingDatabase{
    let matrix: [[BeaconElement]]
    let matrix4th: [[BeaconElement]] // measurement unit between reference points = 0.5 m
    let matrix4th1m: [[BeaconElement]] // measurement unit between reference points = 1 m
    let matrix4th2m: [[BeaconElement]] // measurement unit between reference points = 2 m
    
    init() {
        self.matrix = [
            // row 0 with (0,0) (0,1) (0,2) (0,3)
            // (0, 0)
            [
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -29.992, proximity: 1.0), beaconSpecsB1: BeaconSpecs(rssi: -87.3076, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -87.9423, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -87.3181, proximity: 3.0)),
                // (0, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -66.3902, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.2767, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -97.6153, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.8815, proximity: 3.0)),
                // (0, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -77.3721, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.1126, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -90.6729, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -87.1767, proximity: 2.97)),
                // (0, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -65.5213, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.7433, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -94.5466, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -40.5263, proximity: 1.0))
            ],
            // row 1 with (1,0) (1,1) (1,2) (1,3)
            [
                // (1, 0)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -60.3533, proximity: 2.0), beaconSpecsB1: BeaconSpecs(rssi: -86.3170, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -91.8770, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -80.4127, proximity: 2.05)),
                // (1, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -56.0080, proximity: 2.0), beaconSpecsB1: BeaconSpecs(rssi: -88.9130, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -88.5591, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -82.3693, proximity: 2.71)),
                // (1, 2)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -69.4715, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.0000, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -89.4091, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -84.9120, proximity: 3.0)),
                // (1, 3)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -63.0890, proximity: 2.03), beaconSpecsB1: BeaconSpecs(rssi: -93.9062, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -97.0000, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -86.5775, proximity: 3.0))
            ],
            // row 2 with (2,0) (2,1) (2,2) (2,3)
            [
                // (2, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -62.3790, proximity: 2.0), beaconSpecsB1: BeaconSpecs(rssi: -88.7415, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.2272, proximity: 2.67), beaconSpecsB3: BeaconSpecs(rssi: -87.2889, proximity: 2.96)),
                // (2, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -71.5164, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -74.6576, proximity: 2.0), beaconSpecsB2: BeaconSpecs(rssi: -86.4144, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -80.5833, proximity: 2.05)),
                // (2, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -77.8524, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.5270, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -90.1304, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -79.9642, proximity: 2.0)),
                // (2, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -79.3387, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.2381, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -93.5263, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -83.9611, proximity: 2.93))
            ],
            // row 3 with (3,0) (3,1) (3,2) (3,3)
            [
                // (3, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -66.2421, proximity: 2.93), beaconSpecsB1: BeaconSpecs(rssi: -46.8750, proximity: 1.0), beaconSpecsB2: BeaconSpecs(rssi: -91.7403, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.5978, proximity: 3.0)),
                // (3, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -70.2845, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -73.9633, proximity: 2.0), beaconSpecsB2: BeaconSpecs(rssi: -91.6413, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.0312, proximity: 3.0)),
                // (3, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -64.2615, proximity: 2.07), beaconSpecsB1: BeaconSpecs(rssi: -86.0285, proximity: 2.94), beaconSpecsB2: BeaconSpecs(rssi: -88.6304, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -87.5238, proximity: 3.0)),
                // (3, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -75.9024, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.3061, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -49.8642, proximity: 1.0), beaconSpecsB3: BeaconSpecs(rssi: -91.0204, proximity: 3.0))
            ]
        ]
        
        
        self.matrix4th = [
            // row 0 with (0,0) (0,0.5) (0,1) (0,1.5), (0,2) (0,2.5) (0,3) (0,3.5), (0,4) (0,4.5) (0,5) (0,5.5), (0,6)
            // (0, 0)
            [
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -55.4, proximity: 1.0), beaconSpecsB1: BeaconSpecs(rssi: -95.72, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.44, proximity: 1.0), beaconSpecsB3: BeaconSpecs(rssi: -96.8, proximity: 3.0)),
                // (0, 0.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -76.84, proximity: 2.12), beaconSpecsB1: BeaconSpecs(rssi: -91.92, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -97.6153, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.6, proximity: 3.0)),
                // (0, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -80.24, proximity: 2.36), beaconSpecsB1: BeaconSpecs(rssi: -94.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -95.32, proximity: 3.0)),
                // (0, 1.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -85.92, proximity: 2.6), beaconSpecsB1: BeaconSpecs(rssi: -91.12, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.16, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.64, proximity: 3.0)),
                //(0, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -86.24, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -88.8, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -96.28, proximity: 3.0)),
                // (0, 2.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.8, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.52, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.88, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.76, proximity: 3.0)),
                // (0, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.36, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.96, proximity: 3.0)),
                // (0, 3.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.72, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.68, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.56, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.24, proximity: 1.0)),
                //(0,4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.08, proximity: 1.0), beaconSpecsB1: BeaconSpecs(rssi: -90.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.64, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.68, proximity: 3.0)),
                // (0, 4.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.92, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -76.04, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.72, proximity: 3.0)),
                // (0, 5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.36, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.76, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -75.4, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -85.72, proximity: 3)),
                // (0, 5.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.36, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.24, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -88.6, proximity: 2.88)),
                // (0, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -83.32, proximity: 3.0)),
                // (0, 6.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.44, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.56, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.08, proximity: 3.0)),
                // (0, 7)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.96, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.96, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -81.32, proximity: 2.36)),
                // (0, 7.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -97.24, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.28, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -75.72, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -68.84, proximity: 2.0)),
                // (0, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.44, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.72, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.6, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -58.44, proximity: 1.0)),
                // (0, 8.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -97.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.44, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -55.96, proximity: 1.12))
        ],
            // row 1 with (0.5, 0) (0.5, 0.5) (0.5, 1) (0.5, 1.5) (0.5, 2) (0.5, 2.5) (0.5, 3) (0.5, 3.5) (0.5, 4) (0.5, 4.5) (0.5, 5) (0.5, 5.5) (0.5, 6) (0.5, 6.5) (0.5, 7) (0.5, 7.5) (0.5, 8) (0.5, 8.5)
            [
                // (0.5, 0)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -79.92, proximity: 2.2), beaconSpecsB1: BeaconSpecs(rssi: -93.28, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.28, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.36, proximity: 3)),
                // (0.5, 0.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -84.64, proximity: 2.8), beaconSpecsB1: BeaconSpecs(rssi: -92.08, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -88.72, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -95.44, proximity: 3.0)),
                // (0.5, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.68, proximity: 3), beaconSpecsB1: BeaconSpecs(rssi: -97.72, proximity: 3), beaconSpecsB2: BeaconSpecs(rssi: -89.36, proximity: 3), beaconSpecsB3: BeaconSpecs(rssi: -95.8, proximity: 3)),
                // (0.5, 1.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -91.4, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.04, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -87.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -97.28, proximity: 3.0)),
                // (0.5, 2)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -93.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -88.16, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.68, proximity: 3.0)),
                // (0.5, 2.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -93.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -97.36, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -88.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.12, proximity: 3.0)),
                // (0.5, 3)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -95.24, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.72, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.48, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.4, proximity: 3.0)),
                // (0.5, 3.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.8, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.8, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.2, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -96.28, proximity: 3.0)),
                // (0.5, 4)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -92.28, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -85.52, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.88, proximity: 3.0)),
                // (0.5, 4.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -92.52, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -98.04, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.56, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.92, proximity: 3.0)),
                // (0.5, 5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.88, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.72, proximity: 3.0)),
                // (0.5, 5.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -95.72, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.44, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.52, proximity: 3.0)),
                // (0.5, 6)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.16, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -87.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -96.96, proximity: 3.0)),
                // (0.5, 6.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -93.8, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.64, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.88, proximity: 3.0)),
                // (0.5, 7)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -97.08, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.04, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -88.0, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -85.72, proximity: 2.64)),
                // (0.5, 7.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -96.8, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.16, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -90.28, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -87.8, proximity: 3.0)),
                // (0.5, 8)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -95.4, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -97.0, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -87.12, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -83.84, proximity: 2.8)),
                // (0.5, 8.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -90.64, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -97.68, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.64, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -63.84, proximity: 1.28)),
            ],
            // row 3 with (1, 0) (1, 0.5)... (1, 8.5)
            [   // (1, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi:-82.84, proximity: 2.36), beaconSpecsB1: BeaconSpecs(rssi: -93.48, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi:-86.6, proximity: 1.0), beaconSpecsB3: BeaconSpecs(rssi: -92.92, proximity: 3.0)),
                // (1, 0.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -87.72, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.92, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -87.84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.52, proximity: 3.0)),
                // (1, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -85.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.8, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -85.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -88.44, proximity: 3.0)),
                // (1, 1.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -87.08, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.6, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.64, proximity: 3.0)),
                // (1, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -86.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi:-95.16, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.08, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.68, proximity: 3.0)),
                // (1, 2.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -86.28, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.12, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -89.44, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.4, proximity: 3.0)),
                // (1, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -88.2, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.0, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.16, proximity: 3.0)),
                // (1, 3.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.52, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.04, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91, proximity: 1.0)),
                // (1, 4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.8, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.04, proximity: 3.0)),
                // (1, 4.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -87.28, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.52, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.12, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.0, proximity: 3.0)),
                // (1, 5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.28, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.8, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.48, proximity: 3.0)),
                // (1, 5.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.68, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.4, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.2, proximity: 2.88)),
                // (1, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi:-93.24, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.36, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.36, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.52, proximity: 3.0)),
                // (1, 6.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -93.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.28, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.76, proximity: 3.0)),
                // (1, 7)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.76, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -76.96, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -83.88, proximity: 3.0)),
                // (1, 7.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.52, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.88, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -75.88, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -87.24, proximity: 2.0)),
                // (1, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -93.44, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.64, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -86.36, proximity: 1.0)),
                // (1, 8.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.52, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.16, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -85.96, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -80.6, proximity: 2.48))
            ],
            
            // row 4 with (1.5, 0), (1.5, 0.5), (1.5, 1) ... (1.5, 8.5)
            [
                // (1.5, 0)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -84.48, proximity: 2.52), beaconSpecsB1: BeaconSpecs(rssi: -93.36, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.44, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.56, proximity: 3.0)),
                // (1.5, 0.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -80.68, proximity: 2.0), beaconSpecsB1: BeaconSpecs(rssi: -96.4, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -85.52, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -88.08, proximity: 3.0)),
                // (1.5, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -85.4, proximity: 2.88), beaconSpecsB1: BeaconSpecs(rssi: -94.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.72, proximity: 3), beaconSpecsB3: BeaconSpecs(rssi: -87.32, proximity: 3.0)),
                // (1.5, 1.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -87.08, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.44, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.44, proximity: 3.0)),
                // (1.5, 2)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -90.2, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.08, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.56, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -95.64, proximity: 3.0)),
                // (1.5, 2.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -88.4, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.64, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.64, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.44, proximity: 3.0)),
                // (1.5, 3)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -89.2, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -95.6, proximity: 3.0)),
                // (1.5, 3.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -90.72, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.8, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.88, proximity: 3.0)),
                // (1.5, 4)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -90.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -89.76, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -85.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.92, proximity: 3.0)),
                // (1.5, 4.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -90.68, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.44, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.64, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.28, proximity: 3.0)),
                // (1.5, 5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -87.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.8, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.28, proximity: 3.0)),
                // (1.5, 5.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -86.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.96, proximity: 3.0)),
                // (1.5, 6)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -92.36, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.64, proximity: 3.0)),
                // (1.5, 6.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -95.36, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.36, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.2, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -88.84, proximity: 3.0)),
                // (1.5, 7)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -89.6, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.8, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.16, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -85.6, proximity: 2.52)),
                // (1.5, 7.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.16, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.68, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -84.88, proximity: 3.0)),
                // (1.5, 8)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -91.92, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -82.28, proximity: 2.0)),
                // (1.5, 8.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -96.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -98.36, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.44, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -83.76, proximity: 3.0)),
            ],
            
            // row 5 with (2, 0), (2, 0.5), (2, 1) ... (2, 8.5)
            [   // (2, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -84.92, proximity: 2.36), beaconSpecsB1: BeaconSpecs(rssi: -92.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.96, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.4, proximity: 3.0)),
                // (2, 0.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -90.6, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.12, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -85.2, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.44, proximity: 3.0)),
                // (2, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.24, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.88, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.12, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -95.08, proximity: 3.0)),
                // (2, 1.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.64, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.72, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.08, proximity: 3.0)),
                // (2, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.16, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.36, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.24, proximity: 3.0)),
                // (2, 2.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.04, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.44, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.12, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.08, proximity: 3.0)),
                // (2, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.52, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.52, proximity: 3.0)),
                // (2, 3.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -90.36, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.12, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.16, proximity: 1.0)),
                // (2, 4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.4, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.88, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.52, proximity: 3.0)),
                // (2, 4.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -90.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.04, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.4, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.12, proximity: 3.0)),
                // (2, 5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.52, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.68, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.36, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.4, proximity: 3.0)),
                // (2, 5.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -91.32, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -97.04, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -95.24, proximity: 3.0)),
                // (2, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -93.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.84, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.0, proximity: 3.0)),
                // (2, 6.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -93.16, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.12, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.8, proximity: 3.0)),
                // (2, 7)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -90.88, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.72, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.12, proximity: 3.0)),
                // (2, 7.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.32, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -84.92, proximity: 2.8)),
                // (2, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.32, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -86, proximity: 3.0)),
                // (2, 8.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.04, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.96, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.84, proximity: 3.0))
            ],
            // row 6 with 2.5 (2.5, 0), (2.5, 0.5), (2.5, 1) ... (2.5, 8.5)
            [
                // (2.5, 0)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -92.08, proximity: 2.52), beaconSpecsB1: BeaconSpecs(rssi: -94.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.28, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.8, proximity: 3.0)),
                // (2.5, 0.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.2, proximity: 2.0), beaconSpecsB1: BeaconSpecs(rssi: -93.28, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.32, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.12, proximity: 3.0)),
                // (2.5, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -87.68, proximity: 2.88), beaconSpecsB1: BeaconSpecs(rssi: -93.16, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81, proximity: 3), beaconSpecsB3: BeaconSpecs(rssi: -86.64, proximity: 3.0)),
                // (2.5, 1.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -92.916, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.48, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.24, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -85.64, proximity: 3.0)),
                // (2.5, 2)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -91.72, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.76, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.4, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.4, proximity: 3.0)),
                // (2.5, 2.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -93.88, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.72, proximity: 3.0)),
                // (2.5, 3)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -90.72, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.48, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.56, proximity: 3.0)),
                // (2.5, 3.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -91.36, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.12, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.32, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -95.84, proximity: 3.0)),
                // (2.5, 4)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -89.52, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.12, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.4, proximity: 3.0)),
                // (2.5, 4.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -89.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.08, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -87.6, proximity: 3.0)),
                // (2.5, 5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -90.64, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.72, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -87.04, proximity: 3.0)),
                // (2.5, 5.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -89.8, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.72, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -74.24, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -84.92, proximity: 2.88)),
                // (2.5, 6)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -85.08, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -86.84, proximity: 2.8)),
                // (2.5, 6.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.64, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -97.64, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.32, proximity: 3.0)),
                // (2.5, 7)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.32, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -76.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.52, proximity: 2.52)),
                // (2.5, 7.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -96.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -97.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.08, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -86.28, proximity: 3.0)),
                // (2.5, 8)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -96.8, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.72, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -87.28, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.76, proximity: 2.0)),
                // (2.5, 8.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -96.6, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.36, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -74.32, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -86.12, proximity: 3.0)),
            ],
            // row 7 with 3 (3, 0), (3, 0.5), (3, 1) ... (3, 8.5)
            [   // (3, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -89.76, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.6, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.84, proximity: 3.0)),
                // (3, 0.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -91.44, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.44, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -89.4, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.64, proximity: 3.0)),
                // (3, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.44, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.36, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.62, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.6, proximity: 3.0)),
                // (3, 1.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.92, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.36, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.56, proximity: 3.0)),
                // (3, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -90.64, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.52, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.2, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.64, proximity: 3.0)),
                // (3, 2.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -87.12, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.92, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.08, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.56, proximity: 3.0)),
                // (3, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.52, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.72, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.84, proximity: 3.0)),
                // (3, 3.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.28, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.36, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.56, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.6, proximity: 3.0)),
                // (3, 4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.92, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.8, proximity: 3.0)),
                // (3, 4.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -88.64, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.16, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.52, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.32, proximity: 3.0)),
                // (3, 5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.8, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.84, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.12, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.8, proximity: 3.0)),
                // (3, 5.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.88, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.4, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.72, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.44, proximity: 3.0)),
                // (3, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.4, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -97.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.96, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -86.96, proximity: 3.0)),
                // (3, 6.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -97.12, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.68, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.96, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -86.08, proximity: 3.0)),
                // (3, 7)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.88, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -97.04, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -70.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -88.08, proximity: 3.0)),
                // (3, 7.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -97.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -73.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -88.88, proximity: 2.8)),
                // (3, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.88, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -73.16, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.4, proximity: 3.0)),
                // (3, 8.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.12, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -76.72, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -85.8, proximity: 3.0))
            ],
            // row 8 with 3.5 (3.5, 0), (3.5, 0.5), (3.5, 1) ... (3.5, 8.5)
            [
                // (3.5, 0)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -92.52, proximity: 3), beaconSpecsB1: BeaconSpecs(rssi: -91.64, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.36, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.12, proximity: 3.0)),
                // (3.5, 0.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -93.16, proximity: 2.0), beaconSpecsB1: BeaconSpecs(rssi: -92.4, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.04, proximity: 3.0)),
                // (3.5, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.08, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi:-92.04, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.68, proximity: 3), beaconSpecsB3: BeaconSpecs(rssi: -93.84, proximity: 3.0)),
                // (3.5, 1.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -87.72, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -85.32, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.36, proximity: 3.0)),
                // (3.5, 2)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -92.12, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi:-88.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -85.28, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.24, proximity: 3.0)),
                // (3.5, 2.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -93.88, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.52, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.08, proximity: 3.0)),
                // (3.5, 3)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.96, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.36, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.76, proximity: 3.0)),
                // (3.5, 3.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -92.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.84, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.56, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.44, proximity: 3.0)),
                // (3.5, 4)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -93.68, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.48, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.36, proximity: 3.0)),
                // (3.5, 4.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -93.8, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.28, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.88, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -87.48, proximity: 3.0)),
                // (3.5, 5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -93.24, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.72, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.04, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.4, proximity: 3.0)),
                // (3.5, 5.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.6, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.76, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.24, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.52, proximity: 3.0)),
                // (3.5, 6)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.64, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.04, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.96, proximity: 2.8)),
                // (3.5, 6.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi:-92.4, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.88, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -71.88, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.88, proximity: 3.0)),
                // (3.5, 7)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.24, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.16, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.4, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -84.4, proximity: 2.72)),
                // (3.5, 7.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -96.0, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -97.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -72.2, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -88.8, proximity: 3.0)),
                // (3.5, 8)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -95.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.76, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.4, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.2, proximity: 3.0)),
                // (3.5, 8.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -96.64, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.48, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -88.88, proximity: 3.0)),
            ],
            // row 9 with 4 (4, 0), (4, 0.5), (4, 1) ... (4, 8.5)
            [   // (4, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.28, proximity: 3.0)),
                // (4, 0.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -93.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.16, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.72, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.08, proximity: 3.0)),
                // (4, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.8, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.08, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.12, proximity: 3.0)),
                // (4, 1.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.04, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.84, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -87.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.52, proximity: 3.0)),
                // (4, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.96, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.0, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.56, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.0, proximity: 3.0)),
                // (4, 2.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -88.28, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.64, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.48, proximity: 3.0)),
                // (4, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.16, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.36, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.12, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.08, proximity: 3.0)),
                // (4, 3.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.88, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.44, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -76.72, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -87.44, proximity: 3.0)),
                // (4, 4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -91.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.04, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -76.04, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.64, proximity: 3.0)),
                // (4, 4.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.0, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.8, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.64, proximity: 3.0)),
                // (4, 5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.04, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.28, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.48, proximity: 3.0)),
                // (4, 5.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -93.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.44, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.88, proximity: 3.0)),
                // (4, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.84, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -86.24, proximity: 3.0)),
                // (4, 6.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.8, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.88, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -85.12, proximity: 3.0)),
                // (4, 7)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -93.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.52, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.8, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -85.28, proximity: 3.0)),
                // (4, 7.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.28, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.48, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -73.32, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.52, proximity: 3.0)),
                // (4, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -97.24, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -84.68, proximity: 3.0)),
                // (4, 8.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.64, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.48, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -88.88, proximity: 3.0))
            ],
            // row 10 with 4.5 (4.5, 0), (4.5, 0.5), (4.5, 1) ... (4.5, 8.5)
            [
                // (4.5, 0)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -91.44, proximity: 3), beaconSpecsB1: BeaconSpecs(rssi: -93.84, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.28, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.96, proximity: 3.0)),
                // (4.5, 0.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.56, proximity: 2.0), beaconSpecsB1: BeaconSpecs(rssi: -90.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.28, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.6, proximity: 3.0)),
                // (4.5, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -91.96, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.84, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.28, proximity: 3), beaconSpecsB3: BeaconSpecs(rssi: -90.12, proximity: 3.0)),
                // (4.5, 1.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -93.44, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -75.2, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.4, proximity: 3.0)),
                // (4.5, 2)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -92.96, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.52, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -76.08, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -87.64, proximity: 3.0)),
                // (4.5, 2.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -93.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.36, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.56, proximity: 3.0)),
                // (4.5, 3)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -89.6, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.72, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -76.4782, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.28, proximity: 3.0)),
                // (4.5, 3.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -96.68, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.24, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.44, proximity: 3.0)),
                // (4.5, 4)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -89.04, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.16, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.76, proximity: 3.0)),
                // (4.5, 4.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.92, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.0, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -88.6, proximity: 3.0)),
                // (4.5, 5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -95.44, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.83, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.32, proximity: 3.0)),
                // (4.5, 5.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -95.72, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.76, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.04, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -88.92, proximity: 3.0)),
                // (4.5, 6)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -93.6, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -76.6, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.28, proximity: 3.0)),
                // (4.5, 6.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -95.72, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.04, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.48, proximity: 3.0)),
                // (4.5, 7)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -96.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -72.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -88.08, proximity: 2.72)),
                // (4.5, 7.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.6, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -72.2, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.96, proximity: 3.0)),
                // (4.5, 8)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -96.64, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.0, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.64, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.88, proximity: 3.0)),
                // (4.5, 8.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -95.32, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.88, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -68.24, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.56, proximity: 3.0)),
            ],
            // row 11 with 5 (5, 0), (5, 0.5), (5, 1) ... (5, 8.5)
            [   // (5, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.28, proximity: 3.0)),
                // (5, 0.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -91.2, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -84.12, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.12, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.12, proximity: 3.0)),
                // (5, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.88, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -87.92, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.0, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.24, proximity: 3.0)),
                // (5, 1.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.96, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -89.4, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.2, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -87.84, proximity: 3.0)),
                // (5, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -90.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -89.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.64, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.44, proximity: 3.0)),
                // (5, 2.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.12, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.72, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.56, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.84, proximity: 3.0)),
                // (5, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.04, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.64, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.04, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.88, proximity: 3.0)),
                // (5, 3.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -93.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.28, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.6, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.72, proximity: 3.0)),
                // (5, 4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.52, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.8, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.72, proximity: 3.0)),
                // (5, 4.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.28, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.04, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.24, proximity: 3.0)),
                // (5, 5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -91.64, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.12, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.52, proximity: 3.0)),
                // (5, 5.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.72, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.4, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.68, proximity: 3.0)),
                // (5, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.08, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.8, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.56, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -87.2, proximity: 3.0)),
                // (5, 6.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.08, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.44, proximity: 3.0)),
                // (5, 7)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.92, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.76, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.12, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.6, proximity: 3.0)),
                // (5, 7.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.52, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -72.32, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.92, proximity: 3.0)),
                // (5, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -71.64, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.2, proximity: 3.0)),
                // (5, 8.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.48, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -61.64, proximity: 2.48), beaconSpecsB3: BeaconSpecs(rssi: -87.76, proximity: 3.0))
            ],
            // row 12 with 5.5 (5.5, 0), (5.5, 0.5), (5.5, 1) ... (5.5, 8.5)
            [
                // (5.5, 0)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -90.32, proximity: 3), beaconSpecsB1: BeaconSpecs(rssi: -76.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.96, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -96.44, proximity: 3.0)),
                // (5.5, 0.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.16, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -75.88, proximity: 2.0), beaconSpecsB2: BeaconSpecs(rssi: -86.24, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.92, proximity: 3.0)),
                // (5.5, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.08, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -84.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.6, proximity: 3), beaconSpecsB3: BeaconSpecs(rssi: -95.88, proximity: 3.0)),
                // (5.5, 1.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -91.52, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -88.28, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.28, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.4, proximity: 3.0)),
                // (5.5, 2)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -93.64, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -88.04, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.28, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.84, proximity: 3.0)),
                // (5.5, 2.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.44, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.52, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -96.72, proximity: 3.0)),
                // (5.5, 3)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -92.96, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.0, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.4, proximity: 3.0)),
                // (5.5, 3.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -92.8, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.8, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.4, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.2, proximity: 3.0)),
                // (5.5, 4)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.44, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.68, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -85.04, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.76, proximity: 3.0)),
                // (5.5, 4.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -95.64, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.36, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.08, proximity: 3.0)),
                // (5.5, 5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.88, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.52, proximity: 3.0)),
                // (5.5, 5.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -95.16, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.84, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.08, proximity: 3.0)),
                // (5.5, 6)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -92.28, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.48, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.0, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.96, proximity: 3.0)),
                // (5.5, 6.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -94.36, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.12, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.4, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.24, proximity: 3.0)),
                // (5.5, 7)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -95.6, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.0, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.88, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -86.04, proximity: 3.0)),
                // (5.5, 7.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -96, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.28, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -68.56, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -95.4, proximity: 3.0)),
                // (5.5, 8)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -96.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -97.0, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -59.68, proximity: 2.0), beaconSpecsB3: BeaconSpecs(rssi: -92.36, proximity: 3.0)),
                // (5.5, 8.5)
                BeaconElement( beaconSpecsB0: BeaconSpecs(rssi: -95.32, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.48, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -50.52, proximity: 2.0), beaconSpecsB3: BeaconSpecs(rssi: -90.36, proximity: 3.0)),
            ],
            
            // row 13 with 6 (6, 0), (6, 0.5), (6, 1) ... (6, 8.5)
            [   // (6, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.72, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -56.96, proximity: 1.0), beaconSpecsB2: BeaconSpecs(rssi: -84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -96.44, proximity: 3.0)),
                // (6, 0.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.32, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -64.16, proximity: 1.6), beaconSpecsB2: BeaconSpecs(rssi: -85.88, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.44, proximity: 3.0)),
                // (6, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.64, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -78.72, proximity: 2.0), beaconSpecsB2: BeaconSpecs(rssi: -89.56, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.72, proximity: 3.0)),
                // (6, 1.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -97.16, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -82.64, proximity: 2.68), beaconSpecsB2: BeaconSpecs(rssi: -85.48, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.48, proximity: 3.0)),
                // (6, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.36, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -85.16, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -95.64, proximity: 3.0)),
                // (6, 2.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.24, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -89.48, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -85.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.72, proximity: 3.0)),
                // (6, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.08, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -89.36, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.92, proximity: 3.0)),
                // (6, 3.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.28, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -88.0, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.8, proximity: 3.0)),
                // (6, 4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -91.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.32, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.76, proximity: 3.0)),
                // (6, 4.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.24, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.4, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.88, proximity: 3.0)),
                // (6, 5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.36, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.84, proximity: 3.0)),
                // (6, 5.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.72, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.44, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.76, proximity: 3.0)),
                // (6, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.16, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.84, proximity: 3.0)),
                // (6, 6.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -91.8, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.4, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -74.72, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.92, proximity: 3.0)),
                // (6, 7)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.68, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.12, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -76.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.08, proximity: 3.0)),
                // (6, 7.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.16, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -68.08, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.32, proximity: 3.0)),
                // (6, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.8, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.8, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -63.16, proximity: 2.12), beaconSpecsB3: BeaconSpecs(rssi: -94.88, proximity: 3.0)),
                // (6, 8.5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.36, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -46.8, proximity: 1.4), beaconSpecsB3: BeaconSpecs(rssi: -93.96, proximity: 3.0))
            ]
        ]
        
        self.matrix4th1m = [
            // row 0 with (0,0) (0,1), (0,2) (0,3), (0,4) (0,5) , (0,6)
            // (0, 0)
            [
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -55.4, proximity: 1.0), beaconSpecsB1: BeaconSpecs(rssi: -95.72, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.44, proximity: 1.0), beaconSpecsB3: BeaconSpecs(rssi: -96.8, proximity: 3.0)),
                // (0, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -80.24, proximity: 2.36), beaconSpecsB1: BeaconSpecs(rssi: -94.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -95.32, proximity: 3.0)),
                //(0, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -86.24, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -88.8, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -96.28, proximity: 3.0)),
                // (0, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.36, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.96, proximity: 3.0)),
                //(0,4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.08, proximity: 1.0), beaconSpecsB1: BeaconSpecs(rssi: -90.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.64, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.68, proximity: 3.0)),
                // (0, 5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.36, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.76, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -75.4, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -85.72, proximity: 3)),
                // (0, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -83.32, proximity: 3.0)),
                // (0, 7)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.96, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.96, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -81.32, proximity: 2.36)),
                // (0, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.44, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.72, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.6, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -58.44, proximity: 1.0)),
            ],
            // row 1 with (1, 0) (1, 0.5)... (1, 8.5)
            [   // (1, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi:-82.84, proximity: 2.36), beaconSpecsB1: BeaconSpecs(rssi: -93.48, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi:-86.6, proximity: 1.0), beaconSpecsB3: BeaconSpecs(rssi: -92.92, proximity: 3.0)),
                // (1, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -85.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.8, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -85.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -88.44, proximity: 3.0)),
                 // (1, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -86.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi:-95.16, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.08, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.68, proximity: 3.0)),
                // (1, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -88.2, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.0, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.16, proximity: 3.0)),
                // (1, 4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.8, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.04, proximity: 3.0)),
                // (1, 5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.28, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.8, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.48, proximity: 3.0)),
                // (1, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi:-93.24, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.36, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.36, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.52, proximity: 3.0)),
                // (1, 7)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.76, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -76.96, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -83.88, proximity: 3.0)),
                // (1, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -93.44, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.64, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -86.36, proximity: 1.0)),
            ],
            // row 2 with (2, 0), (2, 1), (2, 2) ... (2, 8)
            [   // (2, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -84.92, proximity: 2.36), beaconSpecsB1: BeaconSpecs(rssi: -92.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.96, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.4, proximity: 3.0)),
                // (2, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.24, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.88, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.12, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -95.08, proximity: 3.0)),
                // (2, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.16, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.36, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.24, proximity: 3.0)),
                // (2, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.52, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.52, proximity: 3.0)),
                // (2, 4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.4, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.88, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.52, proximity: 3.0)),
                // (2, 5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.52, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.68, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.36, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.4, proximity: 3.0)),
                // (2, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -93.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.84, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.0, proximity: 3.0)),
                // (2, 7)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -90.88, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.72, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.12, proximity: 3.0)),
                // (2, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.32, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -86, proximity: 3.0)),
            ],
            // row 3 with 3 (3, 0), (3, 1), (3, 2) ... (3, 3)
            [   // (3, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -89.76, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.6, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.84, proximity: 3.0)),
                // (3, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.44, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.36, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.62, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.6, proximity: 3.0)),
                // (3, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -90.64, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.52, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -84.2, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.64, proximity: 3.0)),
                // (3, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.52, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.72, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.84, proximity: 3.0)),
                // (3, 4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.92, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.8, proximity: 3.0)),
                // (3, 5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.8, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.84, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.12, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.8, proximity: 3.0)),
               // (3, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.4, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -97.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.96, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -86.96, proximity: 3.0)),
                // (3, 7)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.88, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -97.04, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -70.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -88.08, proximity: 3.0)),
                // (3, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.88, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -73.16, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.4, proximity: 3.0)),
            ],
            // row 4 with 4 (4, 0), (4, 1), (4, 2) ... (4, 8)
            [   // (4, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.28, proximity: 3.0)),
                // (4, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.8, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.08, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.12, proximity: 3.0)),
                // (4, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.96, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.0, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.56, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.0, proximity: 3.0)),
                // (4, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.16, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.36, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.12, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.08, proximity: 3.0)),
                // (4, 4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -91.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.04, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -76.04, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.64, proximity: 3.0)),
                // (4, 5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.04, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.2, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.28, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.48, proximity: 3.0)),
                // (4, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.84, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -86.24, proximity: 3.0)),
                // (4, 7)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -93.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.52, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.8, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -85.28, proximity: 3.0)),
                // (4, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -97.24, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -84.68, proximity: 3.0)),
            ],
            // row 5 with 5 (5, 0), (5, 1), (5, 2) ... (5, 8)
            [   // (5, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.28, proximity: 3.0)),
                // (5, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.88, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -87.92, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.0, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -89.24, proximity: 3.0)),
                // (5, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -90.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -89.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.64, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.44, proximity: 3.0)),
                // (5, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.04, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.64, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.04, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.88, proximity: 3.0)),
                // (5, 4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.52, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.8, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.72, proximity: 3.0)),
                // (5, 5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -91.64, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.12, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.52, proximity: 3.0)),
                // (5, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.08, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.8, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.56, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -87.2, proximity: 3.0)),
                // (5, 7)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.92, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.76, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.12, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.6, proximity: 3.0)),
                // (5, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -71.64, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.2, proximity: 3.0)),
            ],
            
            // row 6 with 6 (6, 0), (6, 1), (6, 2) ... (6, 8)
            [   // (6, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.72, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -56.96, proximity: 1.0), beaconSpecsB2: BeaconSpecs(rssi: -84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -96.44, proximity: 3.0)),
                // (6, 1)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.64, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -78.72, proximity: 2.0), beaconSpecsB2: BeaconSpecs(rssi: -89.56, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.72, proximity: 3.0)),
                // (6, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.36, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -85.16, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -95.64, proximity: 3.0)),
                // (6, 3)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.08, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -89.36, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.92, proximity: 3.0)),
                // (6, 4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -91.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.32, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.76, proximity: 3.0)),
                // (6, 5)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.36, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.84, proximity: 3.0)),
                // (6, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.16, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.84, proximity: 3.0)),
                // (6, 7)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.68, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.12, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -76.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -94.08, proximity: 3.0)),
                // (6, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.8, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.8, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -63.16, proximity: 2.12), beaconSpecsB3: BeaconSpecs(rssi: -94.88, proximity: 3.0)),
            ]
        ]
        
        self.matrix4th2m = [
            // row 0 with (0,0) (0,1), (0,2) (0,3), (0,4) (0,5) , (0,6)
            // (0, 0)
            [
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -55.4, proximity: 1.0), beaconSpecsB1: BeaconSpecs(rssi: -95.72, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.44, proximity: 1.0), beaconSpecsB3: BeaconSpecs(rssi: -96.8, proximity: 3.0)),
                //(0, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -86.24, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -88.8, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -96.28, proximity: 3.0)),
                //(0,4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.08, proximity: 1.0), beaconSpecsB1: BeaconSpecs(rssi: -90.24, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -77.64, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.68, proximity: 3.0)),
                // (0, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83.84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -83.32, proximity: 3.0)),
                // (0, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -96.44, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -96.72, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.6, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -58.44, proximity: 1.0)),
            ],
            // row 1 with (2,0), (2,1)... (2,8)
            [   // (2, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -84.92, proximity: 2.36), beaconSpecsB1: BeaconSpecs(rssi: -92.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -79.96, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.4, proximity: 3.0)),
                // (2, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.16, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.36, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.24, proximity: 3.0)),
                // (2, 4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -89.4, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.88, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -81.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.52, proximity: 3.0)),
                // (2, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -93.84, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.84, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -90.0, proximity: 3.0)),
                // (2, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.32, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -83, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -86, proximity: 3.0)),
            ],
            // row 2 with (4,0), (4,1)... (4,8)
            [   // (4, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.96, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -80.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.28, proximity: 3.0)),
                // (4, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.96, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -95.0, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.56, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.0, proximity: 3.0)),
                // (4, 4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -91.56, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -94.04, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -76.04, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -91.64, proximity: 3.0)),
                // (4, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -91.84, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.68, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -86.24, proximity: 3.0)),
                // (4, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -97.24, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.6, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -78.76, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -84.68, proximity: 3.0)),
            ],
            // row 3 with (6,0), (6,1)... (6,8)
            [   // (6, 0)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.72, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -56.96, proximity: 1.0), beaconSpecsB2: BeaconSpecs(rssi: -84, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -96.44, proximity: 3.0)),
                // (6, 2)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -94.76, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -90.36, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -85.16, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -95.64, proximity: 3.0)),
                // (6, 4)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -91.48, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.56, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -86.32, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -92.76, proximity: 3.0)),
                // (6, 6)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -92.16, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -93.32, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -82.92, proximity: 3.0), beaconSpecsB3: BeaconSpecs(rssi: -93.84, proximity: 3.0)),
                // (6, 8)
                BeaconElement(beaconSpecsB0: BeaconSpecs(rssi: -95.8, proximity: 3.0), beaconSpecsB1: BeaconSpecs(rssi: -92.8, proximity: 3.0), beaconSpecsB2: BeaconSpecs(rssi: -63.16, proximity: 2.12), beaconSpecsB3: BeaconSpecs(rssi: -94.88, proximity: 3.0)),
            ]
        ]
    }
    
    func getMatrix4th() -> [[BeaconElement]]{
        return self.matrix4th
    }
    
    func getMatrix4th1m() -> [[BeaconElement]]{
        return self.matrix4th1m
    }
    
    func getMatrix4th2m() -> [[BeaconElement]]{
        return self.matrix4th2m
    }
}
