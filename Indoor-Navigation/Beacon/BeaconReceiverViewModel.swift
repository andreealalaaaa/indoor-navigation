//
//  BeaconReceiverViewModel.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 18.06.2023.
//

import Foundation
import CoreLocation
import SwiftUI

class BeaconReceiverViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var proxCompass: CLProximity = .unknown
    @Published var backgroundColor: Color = .mint
    @Published  var matrixSearchResult: (Int, Int)? = nil
    
    let majorValue: CLBeaconMajorValue = 0
    let minorValue: CLBeaconMinorValue = 0
    
    var locationManager: CLLocationManager!
    var beaconRegion: CLBeaconRegion!
    var mintBeaconCount = 0
    var lightblueBeaconCount = 0
    var blueberryBeaconCount = 0
    var iphoneBeaconCount = 0
    var blueberryBeacons: [BeaconSpecs] = []
    var mintBeacons: [BeaconSpecs] = []
    var lightblueBeacons: [BeaconSpecs] = []
    var iphoneBeacons: [BeaconSpecs] = []
    var beaconRegions = [CLBeaconRegion]()
    var destinationBeacon: Int = 0
    var fingerprintingDB = FingerprintingDatabase()
    var matrix: [[BeaconElement]] = [[]]
    
    override init(){
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        if #available(iOS 14.0, *) {
            locationManager.requestAlwaysAuthorization()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
        
        self.matrix = fingerprintingDB.getMatrix4th2m()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    monitorBeacons()
                }
            }
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
            
            if mintBeaconCount == 10 && lightblueBeaconCount == 10 && blueberryBeaconCount == 10 && iphoneBeaconCount == 10 && matrixSearchResult == nil{
                let b0 = computeBeaconAvg(readBeacons: iphoneBeacons)
                let b1 = computeBeaconAvg(readBeacons: lightblueBeacons)
                let b2 = computeBeaconAvg(readBeacons: mintBeacons)
                let b3 = computeBeaconAvg(readBeacons: blueberryBeacons)
                let results = BeaconElement(beaconSpecsB0: b0, beaconSpecsB1: b1, beaconSpecsB2: b2, beaconSpecsB3: b3)
                
                matrixSearchResult = searchMatrixWithProximity(matrix: matrix, beacons: results)
            }
            
            if major == destinationBeacon {
                if beacon.proximity != .unknown{
                    updateBackground(beacon.proximity)
                    proxCompass = beacon.proximity
                }
            }
        }
    }
    
    func updateBackground(_ distance: CLProximity) {
        let redNew = Color(hue: 0.0, saturation: 0.7, brightness: 1.0)
        let greenNew = Color(hue: 0.3, saturation: 0.7, brightness: 0.8)
        let orangeNew = Color(hue: 0.1, saturation: 0.7, brightness: 1.0)
        let lightGray = Color(hue: 0.2, saturation: 0.0, brightness: 0.7)
        
        switch distance {
        case .unknown:
            backgroundColor = lightGray
        case .far:
            backgroundColor = redNew
        case .near:
            backgroundColor = orangeNew
        case .immediate:
            backgroundColor = greenNew
        }
    }

    
    func getPartOfSystem(startingPoint: (Int, Int), destination: (Int, Int), computedAtanAngle: Angle) -> Angle{
        let xb = destination.0
        let yb = destination.1
        
        let xp = startingPoint.0
        let yp = startingPoint.1
        
        var angle: Angle = .zero
        var quadran = 0
        
        if xb < xp && yb < yp {
            quadran = 3
        }else if xb < xp && yb > yp {
            quadran = 2
        } else if xb > xp && yb > yp{
            quadran = 1
        } else{
            quadran = 4
        }
        
        switch quadran{
        case 1:
            angle.degrees = computedAtanAngle.degrees
        case 2:
            angle.degrees = 270 + computedAtanAngle.degrees
        case 3:
            angle.degrees = 180 + computedAtanAngle.degrees
        case 4:
            angle.degrees = 180 - computedAtanAngle.degrees
        default:
            angle.degrees = computedAtanAngle.degrees
        }
        
        
        return angle
    }
    
    func computeAngle(startingPoint: (Int, Int), destination: (Int, Int)) -> Double{
        let xb = destination.0
        let yb = destination.1
        
        destinationBeacon = verifyDestinationBeacon(x: xb, y: yb)
        let xp = startingPoint.0
        let yp = startingPoint.1
        
        var oppositeSide: Double = 0
        var adjiacentSide: Double = 0
        
        oppositeSide = Double(abs(yb-yp))
        adjiacentSide = Double(abs(xb-xp))
        
        let angleRadians = atan(oppositeSide / adjiacentSide)
        let angleDegrees = Angle.degrees(angleRadians * 180 / .pi)
        
        
        print("Opposite side \(oppositeSide) ; Adjiacent side \(adjiacentSide)")
        print("The ANGLE IS \(angleRadians) \(angleDegrees.degrees)")
        
        var angle = getPartOfSystem(startingPoint: startingPoint, destination: destination, computedAtanAngle: angleDegrees)
        
        print()
        print("Angle after quadran computations \(angle.degrees)")
        
        if (xb, yb) == (0, 0) && (xp, yp) == (0, 0){
            angle = Angle.degrees(0.0)
        }
        
        return angle.degrees
    }
    
    func verifyDestinationBeacon(x: Int, y: Int) -> Int{
        if x == 0 && y == 0{
            return 1
        } else if x == 0 && y == 17{
            return 41106
        } else if x == 12 && y == 0{
            return 15754
        } else if x == 12 && y == 17{
            return 13070
        }
        
//        if x == 0 && y == 0{
//            return 13070
//        } else if x == 0 && y == 9{
//            return 41106
//        } else if x == 7 && y == 0{
//            return 41106
//        } else if x == 7 && y == 9{
//            return 1
//        }
        
//        if x == 0 && y == 0{
//            return 13070
//        } else if x == 0 && y == 4{
//            return 41106
//        } else if x == 3 && y == 0{
//            return 41106
//        } else if x == 3 && y == 4{
//            return 1
//        }
        
        return 0
    }
    
    func searchMatrixWithProximity(matrix: [[BeaconElement]], beacons: BeaconElement) -> (Int, Int) {
        var bestMatch: BestMatch?
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
                    var bestMatchProximityDifferenceB0 = proximityDifferenceB0
                    var bestMatchRSSIDifferenceB0 = rssiDifferenceB0

                    var bestMatchProximityDifferenceB1 = proximityDifferenceB1
                    var bestMatchRSSIDifferenceB1 = rssiDifferenceB1

                    var bestMatchProximityDifferenceB2 = proximityDifferenceB2
                    var bestMatchRSSIDifferenceB2 = rssiDifferenceB2

                    var bestMatchProximityDifferenceB3 = proximityDifferenceB3
                    var bestMatchRSSIDifferenceB3 = rssiDifferenceB3

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

        return BeaconSpecs(rssi: resultRSSI, proximity: resultProximity)
    }
    
    func stopRangingAll(){
        for region in beaconRegions {
            locationManager.stopRangingBeacons(satisfying: region.beaconIdentityConstraint)
        }

        beaconRegions.removeAll()
    }
    
    func stopRangingBeaconB0() {
        let b0Region = beaconRegions[3]
        locationManager.stopRangingBeacons(satisfying: b0Region.beaconIdentityConstraint)
        beaconRegions.remove(at: 3)
    }
    
    func stopRangingBeaconB3() {
        let b3Region = beaconRegions[2]
        locationManager.stopRangingBeacons(satisfying: b3Region.beaconIdentityConstraint)
        beaconRegions.remove(at: 2)
    }
    
    func stopRangingBeaconB2() {
        let b2Region = beaconRegions[1]
        locationManager.stopRangingBeacons(satisfying: b2Region.beaconIdentityConstraint)
        beaconRegions.remove(at: 1)
    }
    
    func stopRangingBeaconB1() {
        let b1Region = beaconRegions[0]
        locationManager.stopRangingBeacons(satisfying: b1Region.beaconIdentityConstraint)
        beaconRegions.remove(at: 0)
    }
}
