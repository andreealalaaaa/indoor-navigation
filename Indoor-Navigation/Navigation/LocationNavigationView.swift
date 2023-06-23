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

struct LocationNavigationView: View{
    @ObservedObject var beaconReceiverViewModel = BeaconReceiverViewModel()
    @State var loadingView = false
    @State private var rotationAngle: Angle = .zero
    var selectedLocation: Int
    
    
    
    var red = Color(hue: 0.0, saturation: 0.7, brightness: 1.0)
    var green = Color(hue: 0.3, saturation: 0.7, brightness: 0.8)
    var orange = Color(hue: 0.1, saturation: 0.7, brightness: 1.0)
    var lightGray = Color(hue: 0.2, saturation: 0.0, brightness: 0.7)
    
    var destination: (Int, Int) {
            switch selectedLocation {
            case 0:
                return (0, 0)
            case 1:
                return (0, 3)
            case 2:
                return (3, 0)
            case 3:
                return (3, 3)
            default:
                return (0, 0)
            }
        }
    
    var matrixSearchResultDescription: String {
        if let result = beaconReceiverViewModel.matrixSearchResult {
            let xp = result.0
            let yp = result.1
            print("\(xp)  \(yp)")
            
            let xb = destination.0
            let yb = destination.1
            print("result ", xb, yb)
            
            let angle = beaconReceiverViewModel.computeAngle(startingPoint: (xp, yp), destination: (xb, yb))
            if beaconReceiverViewModel.backgroundColor == green{
                return "You arrived at your destination."
            }
            return "Please follow the finger! ANGLE IS \(angle)"
        } else {
            return "Please don't move while your location is computed!"
        }
    }
    
    var computedAngle: Double {
        if let result = beaconReceiverViewModel.matrixSearchResult {
            //stopUpdatingRotation()
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
    
    init(selectedLocation: Int) {
        self.selectedLocation = selectedLocation
    }
    
    var body: some View {
        NavigationView{
            
                if beaconReceiverViewModel.backgroundColor == Color.blue {
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


extension Color {
    static func background(for proximity: CLProximity?, isLoading: Bool) -> Color {
        if isLoading {
            return .mint // Or any other color you'd like to use while loading
        }
        
        switch proximity {
        case .immediate:
            return .green
        case .near:
            return .yellow
        case .far:
            return .red
        case .unknown:
            fallthrough
        default:
            return .gray
        }
    }
}
