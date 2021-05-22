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
        
        guard let userName = userNameTxtBox.text else { return }
        guard let password = passwordTxtBox.text else { return }
        guard let phoneNumber = emailOrPhoneTxtBox.text else { return }

       
        AuthService.instance.registerUser(phoneNumber: phoneNumber, name: userName, passWord: password) { (success) in
            if success {
                AuthService.instance.loginUser(phoneNumber: phoneNumber, password: password) { (loginSuccess) in
                    if loginSuccess {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.performSegue(withIdentifier: UNWIND_TO_USER_MENU, sender: nil)
                    }else{
                        print("error")
                    }
                }
            }else{
                print("errrrrroooorrrrr")
            }
        }

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
