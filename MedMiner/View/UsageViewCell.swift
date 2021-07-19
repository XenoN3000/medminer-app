//
//  UsageViewCell.swift
//  MedMiner
//
//  Created by hosein nahari on 6/14/21.
//

import UIKit
import NotificationCenter

class UsageViewCell: UITableViewCell {

    
    //MARK: - OutLets
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var nextUseTimeLbl: UILabel!
    
    //MARK: - Var
    public private(set) var period = 0.00
    public private(set) var timerReset = 0.00
    public private(set) var timer : Timer?
    public private(set) var _usage : DrugUsage?
    let notificationCenter = UNUserNotificationCenter.current()

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell(dusage: DrugUsage){
        self._usage = dusage
        self.titleLBL.text = dusage.name
        self.bodyLbl.text = "\(dusage.dose) Every \(dusage.period)"
        self.nextUseTimeLbl.text = dusage.period
        self.period = Double(dusage.period)!
        self.timerReset = Double(dusage.period)!
    }
    
    
    
    
    
    
    
 
}
