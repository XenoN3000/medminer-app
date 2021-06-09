//
//  AuthService.swift
//  MedMiner
//
//  Created by hosein nahari on 5/5/21.
//

import Foundation
import Alamofire
import SwiftyJSON



class AuthService {
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    
    
    
    var isLoggedIn : Bool {
        get{
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set{
            defaults.setValue(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    
    var authToken: String {
        
        get{
            return defaults.value(forKey: TOKEN_KEY) as? String ?? ""
        }
        
        set{
            defaults.setValue(newValue, forKeyPath: TOKEN_KEY)
        }
        
    }
    
    var phoneNumber: String {
        get {
            return defaults.value(forKey: USER_PHONE_NUMBER_KEY) as? String ?? ""
        }
        set {
            defaults.setValue(newValue, forKey: USER_PHONE_NUMBER_KEY)
        }
    }
    
    
    
    func registerUser(phoneNumber: String,name: String , passWord: String, completion: @escaping CompletionHandler) {
        
        let body:[String: Any] = [
            "phonenumber": phoneNumber,
            "name": name,
            "password": passWord
        ]
        
        let url = "\(USER_REGISTER)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        Alamofire.request(url! , method: .post, parameters: body , encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            
            
            switch response.result{
                case .success(_):
                
                    completion(true)
                    
                case .failure(let error):
            
                    completion (false)
                    debugPrint(error)
            }
        }
    }
    
    func loginUser(phoneNumber: String, password: String, completion: @escaping CompletionHandler) {
        
        let url = "\(LOGIN_USER),\(phoneNumber),\(password)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            switch response.result{
                
                case .success(_):

                    guard let data = response.data else { return }
                    self.setUpAuthService(data: data)
                    self.setUpUserInfo(data: data)
                    completion(true)
                    
                
                case .failure(let error):
                    debugPrint(error)
                    completion(false)
            
            }
        }
    }
    
    func findUserByToken(completion: @escaping CompletionHandler) {
        print(authToken)
        let url  = "\(FIND_USER_BY_TOKEN_URL),\(authToken)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            switch response.result{
            case .success(_):
                
                guard let data = response.data else { return }
                self.setUpUserInfo(data: data)
                completion(true)
                
            case .failure(let error):
                debugPrint(error)
                completion(false)
            }
            
        }
        
    }
    
    func setUpUserInfo(data: Data) {
        do {
            let json = try JSON(data: data)
            let name = json["name"].stringValue
            let phoneNumber = json["phonenumber"].stringValue
            let coordinatr = json["coordinate"]
            
            
            print(name)
            UserDataService.instance.setUSerDAta(name: name, phoneNumber: phoneNumber)
            
            
        }catch {
            return
        }
        
    }
    
    func setUpAuthService(data: Data) {
        
        do{
        let json = try JSON(data: data)
        self.authToken = json["token"].stringValue
            self.phoneNumber = json["phonenumber"].stringValue
        self.isLoggedIn = true
        }catch{
            return
        }
    }
    
    
}
