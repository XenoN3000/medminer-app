//
//  MedicineCell.swift
//  MedMiner
//
//  Created by hosein nahari on 1/30/21.
//

import UIKit

class DrugCell: UITableViewCell {
    
    //Outlets
    @IBOutlet weak var medImg: UIImageView!    
    @IBOutlet weak var medName: UILabel!
    @IBOutlet weak var medDesc: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configureCell(medicine : Drug) {
        self.medImg.image = UIImage(named: medicine.image)
        self.medName.text = medicine.name
        self.medDesc.text = "price: \(String(describing: medicine.price))    company:\(String(describing:medicine.companyName))"
        

    
    }
    

}
