//
//  UserDataService.swift
//  MedMiner
//
//  Created by hosein nahari on 5/5/21.
//

import Foundation


class UserDataService {
    static let instance = UserDataService()
    
    
    let defaults = UserDefaults.standard
    var cart : [DrugstoreHasDrugs] {
        
        set{
            defaults.setValue(try? PropertyListEncoder().encode(newValue), forKey: CART_KEY)
        }
        
        get{
            if let data = defaults.value(forKey: CART_KEY) as? Data {
                return try! PropertyListDecoder().decode(Array<DrugstoreHasDrugs>.self, from: data)
            }
            return []
        }
        
    }
    
    
    var usages : [DrugUsage] {
        set{
            defaults.setValue(try? PropertyListEncoder().encode(newValue), forKey: MEDICINE_USAGE_KEY)
        }
        get{
            if let data = defaults.value(forKey: MEDICINE_USAGE_KEY) as? Data {
                return try! PropertyListDecoder().decode(Array<DrugUsage>.self, from: data)
            }
            return []
        }
    }
    
    

    
    
    
    
//    public private(set) var id = ""
//    public private(set) var address = ""
    public private(set) var Name = ""
    public private(set) var phoneNumber = ""
    public private(set) var coordinate = Coordinate()
//    public private(set) var gender = ""
    

    

    func setUSerDAta(name: String, phoneNumber: String) {
        self.Name = name
        self.phoneNumber = phoneNumber
        }
    
    func logoutUser() {
        self.Name = ""
        self.phoneNumber = ""
        AuthService.instance.authToken = ""
        AuthService.instance.phoneNumber = ""
        AuthService.instance.isLoggedIn = false
    }
    
    func setUSerDAta(name: String, phoneNumber: String, coordinate: Coordinate) {
        self.Name = name
        self.phoneNumber = phoneNumber
        self.coordinate = coordinate
        }
    

    
    func setCoordinate(coordinate: Coordinate) {
        self.coordinate = coordinate
    }
    
    
    
    
}


