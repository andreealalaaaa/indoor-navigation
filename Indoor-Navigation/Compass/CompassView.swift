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
    var selectedLocation: Int
    @State private var rotationAngle: Angle = .zero
    @State private var backgroundColor: Color = .gray
    
    var red = Color(hue: 0.0, saturation: 0.7, brightness: 1.0)
    var green = Color(hue: 0.3, saturation: 0.7, brightness: 0.8)
    var orange = Color(hue: 0.1, saturation: 0.7, brightness: 1.0)
    var lightGray = Color(hue: 0.2, saturation: 0.0, brightness: 0.7)
    
    
    var body: some View {
        NavigationView{
            ZStack{
                backgroundColor.edgesIgnoringSafeArea(.all)
                //                NavigationLink(destination: LoadingView(), isActive: $loadingView){
                //
                let matrix = beaconReceiverViewModel.matrixSearchResult
                Text("Hello, position is \(matrix.0)")
                Image(systemName: "hand.point.up")
                    .foregroundColor(.white)
                    .font(.system(size:200))
                    .cornerRadius(20)
                    .rotationEffect(rotationAngle)
                    .onAppear{
                        startUpdatingRotation()
                        //updateBackground(<#T##distance: CLProximity##CLProximity#>, beacon: <#T##CLBeacon#>)
                    }
            }
        }
    }
    
    private func startUpdatingRotation(){
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
        rotationAngle += .degrees(45)
        }
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

//private extension CompassView{
//    var pointIcon: some View{
//        Section{
//            Image(systemName: "hand.point.up")
//                .foregroundColor(.mint)
//                .font(.system(size:200))
//                .cornerRadius(20)
//                .rotationEffect(rotationAngle)
//                .onAppear(perform: startUpdatingRotation())
//        }
//    }

//}
