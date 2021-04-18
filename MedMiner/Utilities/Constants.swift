//
//  Constants.swift
//  MedMiner
//
//  Created by hosein nahari on 3/1/21.
//

import Foundation


//typealias
typealias CompletionHandler = (_ Success: Bool) -> ()

//Segues
let TO_DRUG_STORE = "ToDrugStore"
let TO_DRUG = "ToDrug"
let TO_DRUG_INFO = "ToDrugInfo"
let UNWIND_TO_USER_MENU = "unwindToUserMenu"



//tablwViews ID
let STORE_WITH_DRUG_ID = "storeWithDrugCell"
let DRUGS_IN_DRUGSTORE = "drugsInStore"



// URL Constants
let BASE_URL = "http://localhost:5000/api"
let SEARCH_DRUGS_URL = "\(BASE_URL)/drugs"
let SEARCH_DS_URL = "\(BASE_URL)/drugstores"
let SEARCH_DRUGSTORE_WITH_DRUG_URL = "\(BASE_URL)/StoresWithDrug"
let SEARCH_DRUGS_IN_DRUGSTORE_URL = "\(BASE_URL)/drugsinstore"

//Headers
let HEADER = [
    "Content-type":"application/json; charset=utf-8"
]

//colors
let navigationItemColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
let tableViewRowColor = #colorLiteral(red: 0, green: 0.8303908706, blue: 0.3955751657, alpha: 1)
