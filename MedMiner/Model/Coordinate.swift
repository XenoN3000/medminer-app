//
//  C oordinate.swift
//  MedMiner
//
//  Created by hosein nahari on 6/9/21.
//

import Foundation

struct Coordinate: Codable {
    
    public var x : Double
    public var y : Double
    
    
    init() {
        self.x = 0
        self.y = 0
    }
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}
