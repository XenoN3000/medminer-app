//
//  DrugStore.swift
//  MedMiner
//
//  Created by hosein nahari on 1/30/21.
//

import Foundation



struct DrugStore: Codable {
    
    public private(set) var name : String
    public private(set) var address : String
    public private(set) var city : String
    public private(set) var drugstore_Has_Drugs : [DrugstoreHasDrugs]!
    public private(set) var picture : String?
    public private(set) var worktime : String
    public private(set) var coordinate : Coordinate
    
}
