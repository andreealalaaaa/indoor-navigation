//
//  CompassView.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 18.06.2023.
//

import SwiftUI
import CoreLocation
import CoreMotion
import Combine
import SwiftUI
import CoreBluetooth
import simd

struct LocationNavigationView: View{
    @ObservedObject var beaconReceiverViewModel = BeaconReceiverViewModel()
    @State private var rotationAngle: Angle = .zero
    var selectedLocation: Int
    
    
    
    var red = Color(hue: 0.0, saturation: 0.7, brightness: 1.0)
    var green = Color(hue: 0.3, saturation: 0.7, brightness: 0.8)
    var orange = Color(hue: 0.1, saturation: 0.7, brightness: 1.0)
    var lightGray = Color(hue: 0.2, saturation: 0.0, brightness: 0.7)
    
    var destination: (Int, Int) {
            switch selectedLocation {
//          test case 2 measuring unit = 0.5 m
            case 4:
                return (0, 0)
            case 1:
                return (12, 0)
            case 2:
                return (0, 17)
            case 3:
                return (12, 17)
            default:
                return (-1, -1)
//          test case 2 measuring unit = 1 m
//            case 4:
//                return (0, 0)
//            case 1:
//                return (7, 0)
//            case 2:
//                return (0, 9)
//            case 3:
//                return (7, 9)
//            default:
//                return (-1, -1)
//          test case 2 measuring unit = 2 m
//            case 4:
//                return (0, 0)
//            case 1:
//                return (3, 0)
//            case 2:
//                return (0, 4)
//            case 3:
//                return (3, 4)
//            default:
//                return (-1, -1)
            }
        }
    
    var matrixSearchResultDescription: String {
        if let result = beaconReceiverViewModel.matrixSearchResult {
            let xp = result.0
            let yp = result.1
            print("\(xp)  \(yp)")
            
            let xb = destination.0
            let yb = destination.1
            print("result ", xp, yp)
            
            let angle = beaconReceiverViewModel.computeAngle(startingPoint: (xp, yp), destination: (xb, yb))
            
            if (angle == 0){
                return "You are already at the destination!"
            }
            
            if beaconReceiverViewModel.backgroundColor == green{
                return "You arrived at your destination!"
            }
            
            return "Please follow the direction given by the pointer!"
        } else {
            return "Please don't move while your location is computed!"
        }
    }
    
    var computedAngle: Double {
        if let result = beaconReceiverViewModel.matrixSearchResult {
            let xp = result.0
            let yp = result.1
            
            let xb = destination.0
            let yb = destination.1
            
            let angle = beaconReceiverViewModel.computeAngle(startingPoint: (xp, yp), destination: (xb, yb))
            return angle
        } else {
            return 0
        }
    }
    
    var body: some View {
        NavigationView{
            
                if beaconReceiverViewModel.backgroundColor == Color.pink {
                    WaitView()
                } else{
                    ZStack{
                    beaconReceiverViewModel.backgroundColor.edgesIgnoringSafeArea(.all)
                    //backgroundColor.edgesIgnoringSafeArea(.all)
                    Text(matrixSearchResultDescription)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 500)
                        .frame(width: 300, height: 900)
                    
                    Image(systemName: "hand.point.up")
                        .foregroundColor(.white)
                        .font(.system(size:200))
                        .padding()
                        .rotationEffect(.degrees(computedAngle))

                }
            }
        }
    }
}

struct LocationNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationNavigationView(selectedLocation: 0)
    }
}
