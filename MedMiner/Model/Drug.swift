//
//  Medicine.swift
//  MedMiner
//
//  Created by hosein nahari on 1/30/21.
//

import Foundation

struct Drug: Decodable {
    
    public private(set) var name : String
    public private(set) var genericName : String
    public private(set) var id : String
    public private(set) var price : Double
    public private(set) var companyName: String
    public private(set) var image : String
    public private(set) var createDate: String
    public private(set) var expireDate: String
    public private(set) var drugstoreHasDrugs: [DrugstoreHasDrugs]!
    
    init( name : String, genericName : String, id : String, price : Double, companyName: String,image : String,
          createDate: String,expireDate: String, drugstoreHasDrugs: [DrugstoreHasDrugs]?) {
        self.name = name
        self.genericName = genericName
        self.id = id
        self.price = price
        self.companyName = companyName
        self.image = image
        self.createDate = createDate
        self.expireDate = expireDate
        self.drugstoreHasDrugs = drugstoreHasDrugs
    }
}
