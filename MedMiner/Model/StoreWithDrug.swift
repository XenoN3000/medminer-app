//
//  DSWithDrug.swift
//  MedMiner
//
//  Created by hosein nahari on 3/16/21.
//

import Foundation


struct StoreWithDrug: Decodable {
    
    
    public private(set) var img: String!
    public private(set) var name: String!
    public private(set) var city: String!
//   public private(set) var price: Double!
    public private(set) var price: Double!
    public private(set) var count: Int!
    
    
    init(img: String, name: String, city: String, price: Double, count: Int){
        self.img = img
        self.name = name
        self.city = city
        self.count = count
        self.price = price
    }
    
}
