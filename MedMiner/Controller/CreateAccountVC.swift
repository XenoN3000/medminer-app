//
//  CreateAccountVC.swift
//  MedMiner
//
//  Created by hosein nahari on 3/25/21.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    //OutLets
    @IBOutlet weak var userNameTxtBox: UITextField!
    @IBOutlet weak var passwordTxtBox: UITextField!
    @IBOutlet weak var emailOrPhoneTxtBox: UITextField!
    @IBOutlet weak var addressTxtBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //Actions
    @IBAction func createAccountPeressed(_ sender: Any) {
        
        
        performSegue(withIdentifier: UNWIND_TO_USER_MENU, sender: nil)
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
