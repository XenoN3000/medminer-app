//
//  DrugInfoVC.swift
//  MedMiner
//
//  Created by hosein nahari on 3/17/21.
//

import UIKit

class DrugInfoVC: UIViewController {

    
    //vars
    private var _drugStoreHasDrug: DrugstoreHasDrugs!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func initInfo(_ storeWithDrug: DrugstoreHasDrugs) {
        self._drugStoreHasDrug = storeWithDrug
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
