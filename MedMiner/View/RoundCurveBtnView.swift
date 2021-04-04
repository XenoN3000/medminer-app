//
//  RoundCurveBtnView.swift
//  MedMiner
//
//  Created by hosein nahari on 3/22/21.
//

import UIKit

@IBDesignable
class RoundCurveBtnView: UIButton {
    
    
    
    
    @IBInspectable var curveRaidus: CGFloat = 0.0{
        
        didSet{
            self.layoutIfNeeded()
        }
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = curveRaidus
        
    }
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
