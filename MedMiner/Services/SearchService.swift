//
//  SearchService.swift
//  MedMiner
//
//  Created by hosein nahari on 1/30/21.
//

import Foundation

import Alamofire
import SwiftyJSON


class SearchService {

    static let instance = SearchService()

    var DrugStores = [DrugStore]()
    var medicines = [Drug]()
    var storesWithDrug = [DrugstoreHasDrugs]()
    var drugsInDrugstore = [DrugstoreHasDrugs]()
    

    func clearDrugstores() {
        self.DrugStores.removeAll()
    }

    func clearMedicines() {
        self.medicines.removeAll()
    }
    
    func clearStoresWithdrug() {
        self.storesWithDrug.removeAll()
    }
    
    func clearDrugsInDrugstore() {
        self.drugsInDrugstore.removeAll()
    }

    //method to generate test value

    func findDS(drugStoreName: String, completion: @escaping CompletionHandler) {
        let url = "\(SEARCH_DS_URL)/\(drugStoreName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        
        self.clearDrugstores()
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).validate().responseJSON{ (response) in
            
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                do{
                    self.DrugStores = try JSONDecoder().decode([DrugStore].self, from: json.rawData())
                    completion(true)
                }catch{
                    debugPrint(error)
                    completion(false)
                }
                
            case .failure(let error):
                completion(false)
                print(error)
                
            }
    }
 }

    func findDrugs(drugName: String, completion: @escaping CompletionHandler) {
        let url = "\(SEARCH_DRUGS_URL)/\(drugName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        self.clearMedicines()
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).validate().responseJSON { (response) in
            
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                do{
                    self.medicines = try JSONDecoder().decode([Drug].self, from: json.rawData())
                    completion(true)
                }catch{
                    debugPrint(error)
                    completion(false)
                }
                
            case .failure(let error):
                completion(false)
                print(error)
                
            }
            
        }

    }
    
    
    
    func findStoresWithdrug(drug: Drug, storeName: String, complition: @escaping CompletionHandler) {
        
        let url = "\(SEARCH_DRUGSTORE_WITH_DRUG_URL)/\(drug.id)/\(storeName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        self.clearStoresWithdrug()
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).validate().responseJSON { (response) in
            
            switch response.result{
                case .success(let value):
                    let json = JSON(value)
                
                    do{
                        self.storesWithDrug = try JSONDecoder().decode([DrugstoreHasDrugs].self, from: json.rawData())
                        complition(true)
                    }catch{
                        debugPrint(error as Any)
                        complition(false)
                    }
                
                    break
                case .failure(let error):
                    complition(false)
                    print(error)
                }
            
        }
    }
    
    
    
    func findDrugsInStore(store: DrugStore, drugName: String, complition: @escaping CompletionHandler) {
        let urlString = "\(SEARCH_DRUGS_IN_DRUGSTORE_URL)/\(store.city)/\(store.name)/\(drugName)"
        let url = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        self.clearDrugsInDrugstore()
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    do{
                        self.drugsInDrugstore = try JSONDecoder().decode([DrugstoreHasDrugs].self, from: json.rawData())
                        complition(true)
                    }catch{
                        debugPrint(error)
                        complition(false)
                    }
                 case .failure(let error):
                    print(error)
                    complition(false)
            }
        }
    }
    
    
    

}