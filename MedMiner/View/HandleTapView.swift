//
//  HandleTapView.swift
//  MedMiner
//
//  Created by hosein nahari on 3/15/21.
//

import UIKit

@IBDesignable
class HandleTapView: UIView {
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpView()
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
        
    }
    
    func setUpView() {
        self.addGestureConfigInView()
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
