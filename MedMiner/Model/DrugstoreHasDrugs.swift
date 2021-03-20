//
//  File.swift
//  MedMiner
//
//  Created by hosein nahari on 3/2/21.
//

import Foundation

struct DrugstoreHasDrugs: Decodable {
    public private(set) var price: Double
    public private(set) var count: Int
    public private(set) var availability: String
    public private(set) var drugId: String
    public private(set) var drug: Drug
    public private(set) var name: String
    public private(set) var city: String
    public private(set) var drugStore: DrugStore
}
