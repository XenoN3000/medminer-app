//
//  DrugStoreVC.swift
//  MedMiner
//
//  Created by hosein nahari on 3/13/21.
//

import UIKit

class DrugStoreVC: UIViewController, UIGestureRecognizerDelegate, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
 
    
    //OutLets
    @IBOutlet weak var dSImg: RoundCurveImg!
    @IBOutlet weak var dSAddrss: UILabel!
    @IBOutlet weak var dSName: UILabel!
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var searchTxtBox: UITextField!
    
    
    //vars
    private var tap: UITapGestureRecognizer!
    private var _drugStore: DrugStore!

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
    
    
    func initDrugStore(drugStore: DrugStore){
        setUpNavBarItems()
        setUpNavBarTitle(title: drugStore.name)
        self._drugStore = drugStore
    }
    
    func setUpView() {
        self.dSImg.image = UIImage(named: _drugStore.image)
        self.dSName.text = _drugStore.name
        self.dSAddrss.text = "\(_drugStore.city) - \(_drugStore.address)"
    }
    
    //Tap GestureRecognizer Delegation
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if gestureRecognizer is UITapGestureRecognizer {
            let location = touch.location(in: searchTableView)
            return (searchTableView.indexPathForRow(at: location) == nil)
            
        }
        return true
    }
    
    
    //actions
    @IBAction func searchBtnPressed(_ sender: Any) {
        view.endEditing(search())
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       let success = search()
        view.endEditing(success)
        return success
    }
    
    func search() -> Bool {
        var complition = false
        if searchTxtBox.text != "" {
            SearchService.instance.findDrugsInStore(store: _drugStore, drugName: searchTxtBox.text!) { (success) in
                if success {
                    self.searchTableView.reloadData()
                }
                complition = success
            }
        }
        
        return complition
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SearchService.instance.drugsInDrugstore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return tableViewConfig(indexPath: indexPath)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)!.contentView.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)!.contentView.backgroundColor = .yellow
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let drugInStore = SearchService.instance.drugsInDrugstore[indexPath.row]
        view.endEditing(true)
        performSegue(withIdentifier: TO_DRUG_INFO, sender: drugInStore)
    }
    
    
    
    
    func tableViewConfig(indexPath: IndexPath) -> UITableViewCell {
        if let cell = searchTableView.dequeueReusableCell(withIdentifier: DRUGS_IN_DRUGSTORE, for: indexPath) as? DrugsInStoreCell {
            
            let drug = SearchService.instance.drugsInDrugstore[indexPath.row]
            cell.configureCell(storeWithDrug: drug)
            return cell
        }
        return UITableViewCell()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let drugInfo = segue.destination as? DrugInfoVC {
            
            assert(sender as? DrugInfoVC != nil)
            drugInfo.initInfo(sender as! DrugstoreHasDrugs)
            
        }
    }

}
