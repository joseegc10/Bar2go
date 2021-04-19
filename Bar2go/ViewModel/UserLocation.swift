//
//  UserLocation.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 24/3/21.
//

import Foundation
import CoreLocation


/// Clase para obtener la localización del usuario
class UserLocation: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()               /// Para establecer las propiedades de la ubicación
    @Published var locations: CLLocation? = nil     /// Para almacenar la localización
    
    // Establacemos las propiedades de la ubicación
    override init() {
        super.init()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    
    /// Almacenar la localización
    /// - Parameters:
    ///   - manager: propiedades de la localización
    ///   - locations: array donde se encuentra la localización
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.first else { return }
            self.locations = location
    }
    
}
