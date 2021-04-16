//
//  UserLocation.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 24/3/21.
//

import Foundation
import CoreLocation

class UserLocation: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    @Published var locations: CLLocation? = nil
    
    override init() {
        super.init()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.first else { return }
            self.locations = location
    }
    
}
