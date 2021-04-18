//
//  DrugStore.swift
//  MedMiner
//
//  Created by hosein nahari on 1/30/21.
//

import Foundation



struct DrugStore: Decodable {
    
    public private(set) var name : String
    public private(set) var address : String
    public private(set) var city : String
    public private(set) var open : String
    public private(set) var close : String
    public private(set) var drugstoreHasDrugs : [DrugstoreHasDrugs]!
    public private(set) var image : String
    
    
    init(name : String, address: String, city: String, open: String, close: String, drugstoreHasDrugs: [DrugstoreHasDrugs]?, image : String) {
        self.name = name
        self .address = address
        self.city = city
        self.open = open
        self.close = close
        self.drugstoreHasDrugs = drugstoreHasDrugs
        self.image = image
    }
}
