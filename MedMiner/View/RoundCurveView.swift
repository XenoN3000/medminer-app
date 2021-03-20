//
//  RoundCurveView.swift
//  MedMiner
//
//  Created by hosein nahari on 3/15/21.
//

import UIKit

@IBDesignable
class RoundCurveView: UIView {
    
    
    
    
    @IBInspectable var curveRaidus: CGFloat = 0.0{
        
        didSet{
            self.layoutIfNeeded()
        }
    
    }
    
    
    @IBInspectable var shadowColor: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) {
         
        didSet{
            self.layoutIfNeeded()
        }
        
    }
    
    @IBInspectable var shadowOpacity: Float = 1 {
        didSet{
            self.layoutIfNeeded()
        }
    }
    
    
    @IBInspectable var shadowOffset: CGSize = .zero{
        
        didSet{
            self.layoutIfNeeded()
        }
    }
    
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        
        didSet{
            self.layoutIfNeeded()
        }
    }
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override func layoutSubviews() {
        
        self.layer.cornerRadius = curveRaidus
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale

    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
