//
//  LocationDelegate.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 18.06.2023.
//

import Foundation
import Combine
import CoreLocation

class LocationDelegate: NSObject, CLLocationManagerDelegate {
  var locationCallback: ((CLLocation) -> ())? = nil
  var headingCallback: ((CLLocationDirection) -> ())? = nil
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let currentLocation = locations.last else { return }
    locationCallback?(currentLocation)
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    headingCallback?(newHeading.trueHeading)
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("⚠️ Error while updating location " + error.localizedDescription)
  }
}
