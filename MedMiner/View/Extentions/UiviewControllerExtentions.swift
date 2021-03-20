//
//  NavbarExtentions.swift
//  MedMiner
//
//  Created by hosein nahari on 3/12/21.
//

import UIKit


extension UIViewController {
    
    func setUpNavBarItems() {
        
        let menuBtn = UIButton(type: .system)
        menuBtn.setTitle("Menu", for: .normal)
        menuBtn.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        menuBtn.contentMode = .scaleAspectFit
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)), for: .touchUpInside)
        
        let menuBarBtn = UIBarButtonItem(customView: menuBtn)
        
        navigationItem.rightBarButtonItems = [menuBarBtn]
        
        
    }
    
    
    func setUpNavBarTitle(title: String) {
        navigationItem.title = title
    }
    
    
    
    func addGestureConfig() -> UITapGestureRecognizer {
        

        return UITapGestureRecognizer(target: self, action: #selector(self.handeledTap))
        
    
    }
    
    
    
    @objc func handeledTap() {
        view.endEditing(true)
    }

    
    
    func menuGestureConfig() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }
    
    
}

