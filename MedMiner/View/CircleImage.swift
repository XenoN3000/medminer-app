//
//  CircleImage.swift
//  MedMiner
//
//  Created by hosein nahari on 3/12/21.
//

import UIKit


@IBDesignable
class CircleImage: UIImageView {
    
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    
    override  func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
        
    }
    
    
    func setUpView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
