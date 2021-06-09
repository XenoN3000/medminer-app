//
//  Medicine.swift
//  MedMiner
//
//  Created by hosein nahari on 1/30/21.
//

import Foundation

struct Drug: Codable {
    
    public private(set) var name : String
    public private(set) var drug_ID : String
    public private(set) var company_Name: String
    public private(set) var picture : String!
    public private(set) var create_Date: String
    public private(set) var expiration_Date: String

}
