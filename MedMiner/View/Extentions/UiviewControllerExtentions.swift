//
//  NavbarExtentions.swift
//  MedMiner
//
//  Created by hosein nahari on 3/12/21.
//

import UIKit


extension UIViewController {
    
    
    func navigatinBackBarButtonConfig() {
        
        let backBarBtn = UIBarButtonItem(title: self.navigationItem.title, style: .plain, target: nil, action: nil)
        backBarBtn.tintColor = navigationItemColor
        navigationItem.backBarButtonItem = backBarBtn
        
    }
    
    func setUpNavBarItems() {
        

        let menuBarBtn = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)))
        menuBarBtn.tintColor = navigationItemColor
        navigationItem.backBarButtonItem?.tintColor = navigationItemColor
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

