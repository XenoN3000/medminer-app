//
//  DrugVC.swift
//  MedMiner
//
//  Created by hosein nahari on 3/16/21.
//

import UIKit

class DrugVC: UIViewController, UIGestureRecognizerDelegate, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
  
    
    //OutLets
    @IBOutlet weak var drugImg: CircleImage!
    @IBOutlet weak var drugName: UILabel!
    @IBOutlet weak var searchTxtBox: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var searchTableView: UITableView!
    
    
    
    //Vars
    private var tap: UITapGestureRecognizer!
    private var _drug: Drug!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTxtBox.delegate = self
        
        tap = addGestureConfig()
        tap.delegate = self
        view.addGestureRecognizer(tap)
        
        //menu Geture Config
        menuGestureConfig()
    }

    func setUpView(){
        self.drugImg.image = UIImage(named: self._drug!.image)
        self.drugName.text = self._drug!.name
        
        
        
        
    }
    
    
    func initDrug(drug: Drug) {
        setUpNavBarItems()
        setUpNavBarTitle(title: String(drug.name))
        self._drug = drug
    }
    
    
    // actions
    @IBAction func seachBtnPressed(_ sender: Any) {
        view.endEditing(search())
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var success = search()
        view.endEditing(success)
        return success
        
    }
    
    func search() -> Bool {
        var complition = false
            if searchTxtBox.text != ""{
                SearchService.instance.findStoresWithdrug(drug: _drug, storeName: String(searchTxtBox.text!)) { (success) in
               
                    if success{
                    self.searchTableView.reloadData()
                    }
                    complition = success
                }
            }
        return complition
    }
    
    
    //Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return SearchService.instance.storesWithDrug.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableViewConfig(indexpath: indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storeWithDrug = SearchService.instance.storesWithDrug[indexPath.row]
        print(storeWithDrug)
        view.endEditing(true)
        performSegue(withIdentifier: TO_DRUG_INFO, sender: storeWithDrug)
        
    }
    
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)!.contentView.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)!.contentView.backgroundColor = .yellow
    }
    
    
    
    func tableViewConfig(indexpath: IndexPath) -> UITableViewCell {
        if let cell = searchTableView.dequeueReusableCell(withIdentifier: STORE_WITH_DRUG_ID, for: indexpath) as? StoreWithDrugCell{
            
            let drugStore = SearchService.instance.storesWithDrug[indexpath.row]
            cell.configureCell(storeWithDrug: drugStore)
            return cell
            
        }else{
            return UITableViewCell()
        }
    }
    
    
    
 
    
    //Tap GestureRecognizer Delegation
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if gestureRecognizer is UITapGestureRecognizer {
            let location = touch.location(in: searchTableView)
            return (searchTableView.indexPathForRow(at: location) == nil)
            
        }
        return true
    }
    
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let drugInfoVC = segue.destination as? DrugInfoVC {
            assert(sender as? DrugInfoVC != nil)
            drugInfoVC.initInfo(sender as! DrugstoreHasDrugs)
        }
        
    }

}
