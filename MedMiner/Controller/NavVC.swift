//
//  navcontroller.swift
//  MedMiner
//
//  Created by hosein nahari on 3/12/21.
//

import UIKit

class NavVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavBarItems()
        
        
        

        // Do any additional setup after loading the view.
    }
    
    func setUpNavBarItems() {
        
        let menuBtn = UIButton(type: .system)
        menuBtn.setTitle("Menu", for: .normal)
        menuBtn.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        menuBtn.contentMode = .scaleAspectFit
        
        let menuBarBtn = UIBarButtonItem(customView: menuBtn)
        
        navigationItem.rightBarButtonItems = [menuBarBtn]
        
        
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
