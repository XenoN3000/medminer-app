//
//  DrugUsage.swift
//  MedMiner
//
//  Created by hosein nahari on 6/6/21.
//

import Foundation


struct DrugUsage: Codable {
    
    public private(set) var name: String
    public private(set) var period: String
    public private(set) var dose: String
    public private(set) var id: UUID
    public private(set) var startTime: Date?
    public var offset : TimeInterval = 0
    
    
    var elapsed : TimeInterval {
            get {
                return self.elapsed(since: Date())
            }
        }
    
    var isRunning = false {
            didSet {
                if isRunning  {
                    self.startTime = Date()
                } else {
                    if self.startTime != nil{
                        self.offset = self.elapsed
                        self.startTime = nil
                    }
                }
            }
        }
    
    func elapsed(since: Date) -> TimeInterval {
            var elapsed = offset
            if let startTime = self.startTime {
                elapsed += -startTime.timeIntervalSince(since)
            }
            return elapsed
        }
    
}
