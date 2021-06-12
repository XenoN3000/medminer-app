//
//  LocationService.swift
//  MedMiner
//
//  Created by hosein nahari on 6/10/21.
//

import Foundation
import MapKit
import CoreLocation

class LocationService: NSCoder {
    static let instance = LocationService()
        
    override init() {
        
        super.init()
        self.locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestLocation()
        
    }
    
    
    var locationManager = CLLocationManager()
    var isEnable = false
    
    
    func calculateDistqance(coordinate: Coordinate) -> Double {
            
        let store = CLLocation(latitude: coordinate.x, longitude: coordinate.x)
        let user = CLLocation(latitude: UserDataService.instance.coordinate.x, longitude: UserDataService.instance.coordinate.y)
        let dis = user.distance(from: store)
        return dis
    }
    

    
}


extension LocationService : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         print("error:: \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways{
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if locations.first != nil {
            
            isEnable = true
            guard let x = locationManager.location?.coordinate.latitude else { return }
            guard let y = locationManager.location?.coordinate.longitude else { return }
            
            UserDataService.instance.setCoordinate(coordinate: Coordinate.init(x: x, y: y))
            
        }else{
            isEnable = false
        }
    }
    
}
