//
//  ProfileVC.swift
//  MedMiner
//
//  Created by hosein nahari on 5/20/21.
//

import UIKit

class ProfileVC: UIViewController {

    
    //OutLets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet var bgView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        debugPrint(LocationService.instance.locationManager.location?.coordinate.latitude)
        debugPrint(LocationService.instance.locationManager.location?.coordinate.longitude)

        
        // Do any additional setup after loading the view.
    }

    @IBAction func logOutPresed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    func setUpView() {
        self.nameLbl.text = UserDataService.instance.Name
        self.phoneNumberLbl.text = UserDataService.instance.phoneNumber
        
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        
        bgView.addGestureRecognizer(closeTouch)
        
    }
    
    
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        
        dismiss(animated: true, completion: nil)
        
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
