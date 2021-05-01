//
//  File.swift
//  MedMiner
//
//  Created by hosein nahari on 3/2/21.
//

import Foundation

struct DrugstoreHasDrugs: Decodable {
    public private(set) var price: String
    public private(set) var count: Int
    public private(set) var drug_ID: String
    public private(set) var drug: Drug
    public private(set) var name: String
    public private(set) var city: String
    public private(set) var drugstore: DrugStore
}
