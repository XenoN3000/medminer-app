//
//  DrugInfoVC.swift
//  MedMiner
//
//  Created by hosein nahari on 3/17/21.
//

import UIKit
import UserNotifications

class DrugInfoVC: UIViewController {

    
    //vars
    private var _drugStoreHasDrug: DrugstoreHasDrugs?
    let notificationCenter = UNUserNotificationCenter.current()

    
    //OutLets
    @IBOutlet weak var drugImg: CircleImage!
    @IBOutlet weak var drugNameLbl: UILabel!
    @IBOutlet weak var drugInfo: UITextView!
    @IBOutlet weak var addToFavoritBtn: RoundCurveBtnView!
    @IBOutlet weak var addToCartBtn: RoundCurveBtnView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if _drugStoreHasDrug == nil {
            addToCartBtn.isEnabled = false
            addToFavoritBtn.isEnabled = false
        }else{
            addToCartBtn.isEnabled = true
            addToFavoritBtn.isEnabled = true
            setUpView()
        }
        // Do any additional setup after loading the view.
    }
    
    func initInfo(_ storeWithDrug: DrugstoreHasDrugs) {
        self._drugStoreHasDrug = storeWithDrug
    }
    
    
    func setUpView() {
        
        self.drugImg.image = UIImage(named: self._drugStoreHasDrug?.drug.picture ??
            "\(DEFAULT_DRUG_PIC)")
        
        self.drugNameLbl.text = self._drugStoreHasDrug?.drug.name ?? "no_Name"
        
    }
    
  
    @IBAction func addToFavoriteBtnPressed(_ sender: UIButton) {
        addUsageRowStuf()
//        print("hello!")
    }
    
    
    @IBAction func addToCartPressed(_ sender: Any) {
        if let toCart = _drugStoreHasDrug {
            UserDataService.instance.cart.append(toCart)
        }
        
    }
    
    
    
    
    func addUsageRowStuf(){
        
        
        var ArraytextField = [UITextField](repeating: UITextField(), count: 3)
        
        let alert = UIAlertController(title: "Add Drug", message: "", preferredStyle: .alert)
        
   
        let close = UIAlertAction(title: "cancel", style: .default, handler: nil)

        let action = UIAlertAction(title: "confirm", style: .default) { (action) in
            
            let name = ArraytextField[0].text
            let dose = ArraytextField[1].text
            let period = ArraytextField[2].text
            
            
            if (name != "" && name != nil) && (dose != "" && dose != nil) && (period != "" && period != nil){
                
                let druguseage = DrugUsage(name: name!, period: period!, dose: dose!, id: UUID.init())
                                
                UserDataService.instance.usages.append(druguseage)
                
                
                
                
                let content = UNMutableNotificationContent()
                
                
                content.title = "Reminder"
                
                content.body = "use \(dose!) of \(name!)"
                content.sound = UNNotificationSound.default
                content.badge = 1
                
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (Double(period!)! * 60), repeats: true)
            
                let request = UNNotificationRequest(identifier: druguseage.id.uuidString, content: content, trigger: trigger)
                
                self.notificationCenter.add(request) { error in
                    if let error = error  {
                        print("Error \(error.localizedDescription)")
                    }
                }
            }else{
                alert.message = "please complet all fields !"
                self.present(alert, animated: true, completion: nil)
            }
        }

        
        
        alert.addTextField { (alertTxtField) in
            alertTxtField.text = "Drug Name:"
            alertTxtField.isUserInteractionEnabled = false
            alertTxtField.borderStyle = .none
            ArraytextField[2] = alertTxtField
           
        }
     
        
        alert.addTextField { (alertTxtField) in
            alertTxtField.text = self._drugStoreHasDrug?.drug.name
            alertTxtField.textColor = .gray
            alertTxtField.isUserInteractionEnabled = false
            alertTxtField.textAlignment = .center
            ArraytextField[0] = alertTxtField
            
        }
        
        alert.addTextField { (alertTxtField) in
            alertTxtField.text = "Dose:"
            alertTxtField.isUserInteractionEnabled = false
            alertTxtField.borderStyle = .none
            ArraytextField[2] = alertTxtField
           
        }
     
        alert.addTextField { (alertTxtField) in
            alertTxtField.placeholder = "Dose"
            alertTxtField.textAlignment = .center
            alertTxtField.keyboardType = .decimalPad

            ArraytextField[1] = alertTxtField
            

        }
        
        alert.addTextField { (alertTxtField) in
            alertTxtField.text = "period (in min):"
            alertTxtField.isUserInteractionEnabled = false
            alertTxtField.borderStyle = .none
            ArraytextField[2] = alertTxtField
           
        }

        alert.addTextField { (alertTxtField) in
            alertTxtField.placeholder = "period (in min)"
            alertTxtField.textAlignment = .center
            alertTxtField.keyboardType = .decimalPad
            ArraytextField[2] = alertTxtField
           
        }
        
        alert.addAction(close)
        alert.addAction(action)
        
        
        present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
