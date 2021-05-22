//
//  LogInVC.swift
//  MedMiner
//
//  Created by hosein nahari on 3/25/21.
//

import UIKit

class LogInVC: UIViewController, UIGestureRecognizerDelegate {
    
    //OutLets
    @IBOutlet weak var userNameTxtBox: UITextField!
    @IBOutlet weak var passwordTxtBox: UITextField!
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpNavigatinBarConfig()
        
        let tap = addGestureConfig()
        tap.delegate = self
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
        
    
    
    
    
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
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        
    
        guard let phoneNumber = userNameTxtBox.text else { return }
        guard let pass = passwordTxtBox.text else { return }
        AuthService.instance.loginUser(phoneNumber: phoneNumber, password: pass) { (success) in
            if success {
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.destination is CreateAccountVC {
            let backBtn = UIBarButtonItem(title: navigationItem.title, style: .plain, target: nil, action: nil)
            backBtn.tintColor = navigationItemColor
            navigationItem.backBarButtonItem = backBtn
            
        }
    }


}
