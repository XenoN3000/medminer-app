//
//  UserDataService.swift
//  MedMiner
//
//  Created by hosein nahari on 5/5/21.
//

import Foundation


class UserDataService {
    static let instance = UserDataService()
    
//    public private(set) var id = ""
//    public private(set) var address = ""
    public private(set) var Name = ""
    public private(set) var phoneNumber = ""
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
    
}


