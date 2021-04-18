//
//  ViewController.swift
//  MedMiner
//
//  Created by hosein nahari on 1/29/21.
//

import UIKit




class SearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate, UITextFieldDelegate{
    
    
    //Outlets
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchTxtBox: UITextField!
    
    
    
    //vars
    var segmentCondition = false
    var bottomConstraint: NSLayoutConstraint?
    private var tap: UITapGestureRecognizer!
    
    
    
    //View Did Load => start
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBarItems()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTxtBox.delegate = self
            
        self.searchTableView.reloadData()
        
        tap = addGestureConfig()
        tap.delegate = self
        view.addGestureRecognizer(tap)
        
        menuGestureConfig()

        // Do any additional setup after loading the view.
    }
    
    
    //UIGestureRecognizer Delegation
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {

        if gestureRecognizer is UITapGestureRecognizer{
            let location = touch.location(in: searchTableView)
            return (searchTableView.indexPathForRow(at: location) == nil)
        }
        return true
    }
    

   
    
    // table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViweCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableViweConfig(indexPath: indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if segmentCondition {
            tableView.cellForRow(at: indexPath)!.selectionStyle = .none
            let search = SearchService.instance.DrugStores[indexPath.row]
            view.endEditing(true)
            performSegue(withIdentifier: TO_DRUG_STORE, sender: search )
            
        } else {
            
            let search = SearchService.instance.medicines[indexPath.row]
            view.endEditing(true)
            
            performSegue(withIdentifier: TO_DRUG, sender: search)
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)!.contentView.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)!.contentView.backgroundColor = tableViewRowColor
    }
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if let drugStoreVC = segue.destination as? DrugStoreVC {

            navigatinBackBarButtonConfig()
            
            assert(sender as? DrugStore != nil)
            drugStoreVC.initDrugStore(drugStore: sender as! DrugStore)
        }else if let drugVC = segue.destination as? DrugVC {
            
            navigatinBackBarButtonConfig()
            
            assert(sender as? Drug != nil)
            drugVC.initDrug(drug: sender as! Drug)
        }
    }



    @IBAction func segmentControllChanged(_ sender: Any) {
        if segmentControl.selectedSegmentIndex == 0 {
            searchTxtBox.text = ""
            segmentCondition = false
        }else {
            searchTxtBox.text = ""
            segmentCondition = true
        }
        searchTableView.reloadData()
    }
    
    
    
    
    
    
    
    func tableViweCount() -> Int {
        if segmentCondition {
            return SearchService.instance.DrugStores.count
        }else{
            return SearchService.instance.medicines.count
        }
    }
    
    
    
    @IBAction func searchPressed(_ sender: Any) {

        view.endEditing(search())
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       let success = search()
        view.endEditing(success)
        return success
    }
    
    
    func search() -> Bool{
        var complition = false
        if searchTxtBox.text != "" && !segmentCondition {
            SearchService.instance.findDrugs(drugName: String(searchTxtBox.text!))  { (success) in
                
            if success{
                self.searchTableView.reloadData()
                complition = success
                }
            }
        }else if searchTxtBox.text != "" && segmentCondition{
            SearchService.instance.findDS(drugStoreName: String(searchTxtBox.text!)) { (success)  in
                complition = success
                if success{
                    self.searchTableView.reloadData()
                }
                
            }
        }
        return complition
    }
    
    
    func tableViweConfig(indexPath : IndexPath) -> UITableViewCell {
        
        if segmentCondition {
            if let cell = searchTableView.dequeueReusableCell(withIdentifier: "DSCell", for: indexPath) as? DrugStoreCell {
            
                let drugStore = SearchService.instance.DrugStores[indexPath.row]
                cell.configureCell(drugStore:  drugStore)
                    return cell
        }else{
            return UITableViewCell()
            }
        }else{
            if let cell = searchTableView.dequeueReusableCell(withIdentifier: "medicineCell", for: indexPath) as? DrugCell {
            
                    let medicine = SearchService.instance.medicines[indexPath.row]
                    cell.configureCell(medicine: medicine)
                    return cell
        }else{
            return UITableViewCell()
            }
        
        }
        
    }
    
}
