//
//  MapViewControllerDelegate.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 18.06.2023.
//

import Foundation
import CoreLocation

protocol MapViewControllerDelegate {
  func update(location: CLLocation)
}
