//
//  C oordinate.swift
//  MedMiner
//
//  Created by hosein nahari on 6/9/21.
//

import Foundation

struct Coordinate: Codable {
    
    public private(set) var x : Double 
    public private(set) var y : Double
    
    
    init() {
        self.x = 0
        self.y = 0
    }
}
