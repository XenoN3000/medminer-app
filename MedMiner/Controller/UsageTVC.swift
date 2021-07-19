//
//  UsageTVC.swift
//  MedMiner
//
//  Created by hosein nahari on 6/6/21.
//

import UIKit
import UserNotifications

class UsageTVC: UITableViewController {
    
    
    
    let notificationCenter = UNUserNotificationCenter.current()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigatinBarConfig()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UserDataService.instance.usages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: DRUG_USAGE_CELL, for: indexPath) as? UsageViewCell{
            let duseage = UserDataService.instance.usages[indexPath.row]
        
            cell.configureCell(dusage: duseage)
            
            return cell
        }
           return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let endusage =  UserDataService.instance.usages[indexPath.row]
            UserDataService.instance.usages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            notificationCenter.removePendingNotificationRequests(withIdentifiers: [endusage.id.uuidString])
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
//    MARK: - navBarItem Setup
    
    func setUpNavigatinBarConfig() {
        let backBtn = UIButton(type: .system)
        backBtn.setTitle(" Menu", for: .normal)
        backBtn.setImage( UIImage(systemName: "chevron.backward" ), for: .normal)
        backBtn.addTarget(self, action: #selector(self.back), for: .touchUpInside)
        backBtn.tintColor = navigationItemColor
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
        
    }
    
    
    @objc func back(){
        dismiss(animated: true, completion: nil)
    }
    
    
//    MARK: - Actions
    @IBAction func addBtnPressed(_ sender: Any) {
        
        addUsageRowStuf()
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
                
                var druguseage = DrugUsage(name: name!, period: period!, dose: dose!, id: UUID.init())
                                
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
                    } else{
                        druguseage.isRunning = true
                    }
                }

                self.tableView.reloadData()

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
            alertTxtField.placeholder = "Drug name"
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
    
}
