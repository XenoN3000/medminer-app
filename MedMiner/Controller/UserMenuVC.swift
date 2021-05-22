//
//  UserMenuVC.swift
//  MedMiner
//
//  Created by hosein nahari on 3/12/21.
//

import UIKit

class UserMenuVC: UIViewController{
    
    //OutLets
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rightViewRevealWidth = self.view.frame.size.width * (2 / 3)
        setUpUserInfo()
        NotificationCenter.default.addObserver(self, selector: #selector(UserMenuVC.userDataDidChanged(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        // Do any additional setup after loading the view.
    }
    
    
    //Actions
    @IBAction func unwindToUserMenu(_ unwindSegue: UIStoryboardSegue) {}
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        print(UserDataService.instance.Name)
        
        if AuthService.instance.isLoggedIn {
            
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
            
        }else{
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
        
    }
    
    
    
    
    @objc func userDataDidChanged(_ notif: Notification){
        setUpUserInfo()
    }
    
    
    func setUpUserInfo() {
        if AuthService.instance.isLoggedIn{
            print(UserDataService.instance.Name)
            loginBtn.setTitle(UserDataService.instance.Name, for: .normal)
        }else{
            
            loginBtn.setTitle("LogIn", for: .normal)
            
        }
    }
    
    
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
