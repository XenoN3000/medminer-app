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
let TO_LOGIN = "toLogIn"


//MARK: - tablwViews ID
let STORE_WITH_DRUG_ID = "storeWithDrugCell"
let DRUGS_IN_DRUGSTORE = "drugsInStore"
let DRUG_USAGE_CELL = "uasgeCell"
let CART_CELL = "cartcell"




// URL Constants
let BASE_URL = "http://localhost:5000/api"
let SEARCH_DRUGS_URL = "\(BASE_URL)/drugs"
let SEARCH_DRUGS_BY_NAME_URL = "\(SEARCH_DRUGS_URL)/name?name="

let SEARCH_DS_URL = "\(BASE_URL)/drugstores"
let SEARCH_DS_BY_NAME_URL = "\(SEARCH_DS_URL)/name?name="

let SEARCH_DRUGSTORE_WITH_DRUG_URL1 = "\(BASE_URL)/StoresWithDrug"
let SEARCH_DRUGS_IN_DRUGSTORE_URL1 = "\(BASE_URL)/drugsinstore"
let SEARCH_DRUGS_IN_DRUGSTORE_URL = "\(BASE_URL)/drugsinstore/city/name/drugname"
let SEARCH_DRUGSTORE_WITH_DRUG_URL = "\(BASE_URL)/drugsinstore/name/drugname"
let SEARCH_STORES_WITH_DURGS_FIRSTTIME_URL = "\(BASE_URL)/storeswithdrug/drugname"

let USER_REGISTER = "\(BASE_URL)/Customers"
let LOGIN_USER = "\(BASE_URL)/getToken/phonenumber/password"

let FIND_USER_BY_TOKEN_URL = "\(BASE_URL)/getdetails/token"
//let FIRST_DRUG_STORES_LOADED_URL = "\(BASE_URL)/Drugstores"



//Headers
let HEADER = [
    "Content-type":"application/json"
]

//colors
let navigationItemColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
let tableViewRowColor = #colorLiteral(red: 0, green: 0.8303908706, blue: 0.3955751657, alpha: 1)

// default pictures
let PillFill = "pills.fill"
let Pills = "pills"
let HomeFill = "house.fill"
let Home = "house"


let DEFAULT_DRUG_PIC = "\(PillFill)"
let DEFAULT_DS_PIC = "\(HomeFill)"





//user defualts

let LOGGED_IN_KEY = "loggedIn"
let TOKEN_KEY = "token"
let USER_EMAIL_KEY = "userEmail"
let USER_PHONE_NUMBER_KEY = "userPhoneNumber"
let MEDICINE_USAGE_KEY = "medicineUsage"
let CART_KEY = "cartKey"




//Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

