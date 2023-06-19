//
//  CompassView.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 18.06.2023.
//

import SwiftUI
import CoreLocation
import CoreMotion

struct CompassView: View{
    @ObservedObject var beaconReceiverViewModel = BeaconReceiverViewModel()
    @State var loadingView = false
    @State private var rotationAngle: Angle = .zero
    @State private var backgroundColor: Color = .gray
    @State private var timer: Timer?
    private var computedAngle: Angle = .zero
    //@State var destination: (Int, Int) = (0, 0)
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
            //stopUpdatingRotation()
            let xp = result.0
            let yp = result.1
            
            let xb = destination.0
            let yb = destination.1
            
            let angle = beaconReceiverViewModel.computeAngle(startingPoint: (xp, yp), destination: (xb, yb))
            return "Please follow the finger! ANGLE IS \(angle)"
        } else {
            return "Please don't move while your location is computed!"
        }
    }
    
    init(selectedLocation: Int) {
        self.selectedLocation = selectedLocation
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                backgroundColor.edgesIgnoringSafeArea(.all)
                Text(matrixSearchResultDescription)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 500)
                
                Image(systemName: "hand.point.up")
                    .foregroundColor(.white)
                    .font(.system(size:200))
                    .cornerRadius(20)
                    .rotationEffect(rotationAngle)
                    .onAppear {
                        startUpdatingRotation()
                    }
            }
        }
    }
    
    private func startUpdatingRotation(){
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            rotationAngle += .degrees(45)
        }
    }
    
    private func giveAngle(){
        rotationAngle = .degrees(0)
    }
    
    private func stopUpdatingRotation() {
        timer?.invalidate()
    }
    
    private func updateBackground(_ distance: CLProximity, beacon: CLBeacon){
        UIView.animate(withDuration: 0.8) {
            switch distance {
            case .unknown:
                        backgroundColor = .gray
                        
                    case .far:
                        backgroundColor = red
                        
                    case .near:
                        backgroundColor = orange
                        
                    case .immediate:
                        backgroundColor = green
                    @unknown default:
                        backgroundColor = lightGray
            }
        }
    }
}

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView(selectedLocation: 0)
    }
}
