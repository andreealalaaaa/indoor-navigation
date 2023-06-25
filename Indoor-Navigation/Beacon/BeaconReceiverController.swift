//
//  BeaconReceiverController.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 18.06.2023.
//

import Foundation
import CoreLocation
import UIKit

class BeaconReceiverViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    var beaconRegion: CLBeaconRegion!

    let majorValue: CLBeaconMajorValue = 0
    let minorValue: CLBeaconMinorValue = 0

    var blueberryBeacons: [BeaconSpecs] = []
    var mintBeacons: [BeaconSpecs] = []
    var lightblueBeacons: [BeaconSpecs] = []
    var iphoneBeacons: [BeaconSpecs] = []

    var beaconRegions = [CLBeaconRegion]()

    var mintBeaconCount = 0
    var lightblueBeaconCount = 0
    var blueberryBeaconCount = 0
    var iphoneBeaconCount = 0

    let proximityThreshold: Double = 0.03
    let rssiThreshold: Double = 3

    let matrix: [[BeaconElement]] = [
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

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager.delegate = self

        if #available(iOS 14.0, *) {
            locationManager.requestAlwaysAuthorization()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }


        print("aici am reusit sa ajung")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    print("in autorizare")
                    monitorBeacons()
                }
                else{
                    print("nu am permisiune la ranging")
                }
            }else{
                print("nu am persmisiune la monitorizare")
            }
        }else{
            print("not always authorized")
        }
    }

    func monitorBeacons() {
        let proximityUUID = UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!

        let mintBeaconConstraint = CLBeaconIdentityConstraint(uuid: proximityUUID, major: 13070, minor: 11444)
        let blueBeaconConstraint = CLBeaconIdentityConstraint(uuid: proximityUUID, major: 15754, minor: 44263)
        let blueberryBeaconConstraint = CLBeaconIdentityConstraint(uuid: proximityUUID, major: 41106, minor: 42282)
        let iphoneBeaconConstraint = CLBeaconIdentityConstraint(uuid: proximityUUID, major: 1, minor: 1)

        startRangingBeacon(with: mintBeaconConstraint)
        startRangingBeacon(with: blueBeaconConstraint)
        startRangingBeacon(with: blueberryBeaconConstraint)
        startRangingBeacon(with: iphoneBeaconConstraint)
    }

    func startRangingBeacon(with constraint: CLBeaconIdentityConstraint) {
        let beaconRegion = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: constraint.description)

        if CLLocationManager.isRangingAvailable() {
            locationManager.startRangingBeacons(satisfying: beaconRegion.beaconIdentityConstraint)
            beaconRegions.append(beaconRegion)
        } else {
            print("Beacon ranging is not available.")
        }
    }

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        for beacon in beacons {
            let uuid =  beacon.uuid
            let major = Int(beacon.major.intValue)
            let minor = Int(beacon.minor.intValue)
            let accuracy = Double(beacon.accuracy)
            let proximity = Double(beacon.proximity.rawValue)
            let rssi = Double(beacon.rssi)

            if rssi != 0.0 && accuracy != -1 {
                if beacon.major == 13070 && mintBeaconCount  < 10 {
                    mintBeaconCount += 1
                    let mint = BeaconSpecs(rssi: rssi, proximity: proximity)
                    mintBeacons.append(mint)
                }else if beacon.major == 15754 && lightblueBeaconCount < 10 {
                    lightblueBeaconCount += 1
                    let lightblue = BeaconSpecs(rssi: rssi, proximity: proximity)
                    lightblueBeacons.append(lightblue)
                } else if beacon.major == 41106 && blueberryBeaconCount < 10 {
                    blueberryBeaconCount += 1
                    let blue = BeaconSpecs(rssi: rssi, proximity: proximity)
                    blueberryBeacons.append(blue)
                    print("blueberry count", blueberryBeaconCount)
                } else if beacon.major == 1 && iphoneBeaconCount < 10 {
                    iphoneBeaconCount += 1
                    let iphone = BeaconSpecs(rssi: rssi, proximity: proximity)
                    iphoneBeacons.append(iphone)
                }
                print("\(uuid), \(major), \(minor), \(accuracy), \(proximity), \(rssi)")
            }

            if mintBeaconCount == 10 && lightblueBeaconCount == 10 && blueberryBeaconCount == 10 && iphoneBeaconCount == 10 {
                stopRangingBeacon()

                let b0 = computeBeaconAvg(readBeacons: iphoneBeacons)
                let b1 = computeBeaconAvg(readBeacons: lightblueBeacons)
                let b2 = computeBeaconAvg(readBeacons: mintBeacons)
                let b3 = computeBeaconAvg(readBeacons: blueberryBeacons)
                let results = BeaconElement(beaconSpecsB0: b0, beaconSpecsB1: b1, beaconSpecsB2: b2, beaconSpecsB3: b3)

                let bestmatched = searchMatrixWithProximity(matrix: matrix, beacons: results, proximityThreshold: proximityThreshold, rssiThreshold: rssiThreshold)

                    //                for b in bestmatched{
                    //                    print("row: ", b.rowIndex," column: ", b.columnIndex, " proximity: ", b.proximity, " rssi: ", b.rssi)
                    //                }
                    //}

                    //            print("\(uuid), \(major), \(minor), \(accuracy), \(proximity), \(rssi)")
                }
            }
        }

        func searchMatrixWithProximity(matrix: [[BeaconElement]], beacons: BeaconElement, proximityThreshold: Double, rssiThreshold: Double) -> (Int, Int) {
            var bestMatchResults: [BestMatch] = []
            var bestMatch: BestMatch?
            var bestMatchProximityDifferenceB0 = 20000.0
            var bestMatchRSSIDifferenceB0 = 20000.0
            var bestMatchProximityDifferenceB1 = 20000.0
            var bestMatchRSSIDifferenceB1 = 20000.0
            var bestMatchProximityDifferenceB2 = 20000.0
            var bestMatchRSSIDifferenceB2 = 20000.0
            var bestMatchProximityDifferenceB3 = 20000.0
            var bestMatchRSSIDifferenceB3 = 20000.0

            var bestRssiDiff = 20000.0
            var bestProximityDiff = 20000.0

            for rowIndex in 0..<matrix.count {
                let row = matrix[rowIndex]
                for columnIndex in 0..<row.count {
                    let element = row[columnIndex]
                    let proximityDifferenceB0 = abs(element.beaconSpecsB0.proximity - beacons.beaconSpecsB0.proximity)
                    let rssiDifferenceB0 = abs(element.beaconSpecsB0.rssi - beacons.beaconSpecsB0.rssi)

                    let proximityDifferenceB1 = abs(element.beaconSpecsB1.proximity - beacons.beaconSpecsB1.proximity)
                    let rssiDifferenceB1 = abs(element.beaconSpecsB1.rssi - beacons.beaconSpecsB1.rssi)

                    let proximityDifferenceB2 = abs(element.beaconSpecsB2.proximity - beacons.beaconSpecsB2.proximity)
                    let rssiDifferenceB2 = abs(element.beaconSpecsB2.rssi - beacons.beaconSpecsB2.rssi)

                    let proximityDifferenceB3 = abs(element.beaconSpecsB3.proximity - beacons.beaconSpecsB3.proximity)
                    let rssiDifferenceB3 = abs(element.beaconSpecsB3.rssi - beacons.beaconSpecsB3.rssi)

                    let totalDifferenceRssi = rssiDifferenceB0+rssiDifferenceB1+rssiDifferenceB2+rssiDifferenceB3
                    let totalDifferenceProximity = proximityDifferenceB0 + proximityDifferenceB1 + proximityDifferenceB2 + proximityDifferenceB3

                    if(totalDifferenceRssi<=bestRssiDiff && totalDifferenceProximity<=bestProximityDiff){

                        bestMatch = BestMatch(rowIndex: rowIndex, columnIndex: columnIndex)
                        bestMatchProximityDifferenceB0 = proximityDifferenceB0
                        bestMatchRSSIDifferenceB0 = rssiDifferenceB0

                        bestMatchProximityDifferenceB1 = proximityDifferenceB1
                        bestMatchRSSIDifferenceB1 = rssiDifferenceB1

                        bestMatchProximityDifferenceB2 = proximityDifferenceB2
                        bestMatchRSSIDifferenceB2 = rssiDifferenceB2

                        bestMatchProximityDifferenceB3 = proximityDifferenceB3
                        bestMatchRSSIDifferenceB3 = rssiDifferenceB3

                        bestRssiDiff = totalDifferenceRssi
                        bestProximityDiff = totalDifferenceProximity
                    }
                }
            }

            if let bestMatch = bestMatch {
                print("row: ", bestMatch.rowIndex," column: ", bestMatch.columnIndex)
            } else{
                print("no match")
            }

            return (bestMatch!.rowIndex, bestMatch!.columnIndex)
        }

        func computeBeaconAvg(readBeacons: [BeaconSpecs]) -> BeaconSpecs{
            var sumProx: Double = 0.00
            var sumRSSI: Double = 0.00
            var resultProximity: Double = 0.00
            var resultRSSI: Double = 0.00

            if (!readBeacons.isEmpty){
                for readBeacon in readBeacons {
                    sumRSSI = sumRSSI + readBeacon.rssi
                    sumProx = sumProx + readBeacon.proximity
                }

                resultRSSI = sumRSSI/10
                resultProximity = sumProx/10
            }

            print("avg is rssi: \(resultRSSI) and proximity: \(resultProximity)")
            return BeaconSpecs(rssi: resultRSSI, proximity: resultProximity)
        }

        func stopRangingBeacon() {
            for region in beaconRegions {
                locationManager.stopRangingBeacons(satisfying: region.beaconIdentityConstraint)
            }

            beaconRegions.removeAll()
        }

    }
