//
//  UserMenuVC.swift
//  MedMiner
//
//  Created by hosein nahari on 3/12/21.
//

import UIKit

class UserMenuVC: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rightViewRevealWidth = self.view.frame.size.width * (2 / 3)
        
        // Do any additional setup after loading the view.
    }
    
    
    //Actions
    @IBAction func unwindToUserMenu(_ unwindSegue: UIStoryboardSegue) {}
    
    
    
    
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//
//
//    }
//    
    
    
    
}
