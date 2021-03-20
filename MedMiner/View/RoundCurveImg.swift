//
//  RoundCurveImg.swift
//  MedMiner
//
//  Created by hosein nahari on 3/16/21.
//

import UIKit


@IBDesignable
class RoundCurveImg: UIImageView {
    
    
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
