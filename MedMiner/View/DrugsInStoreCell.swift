//
//  DrugsInStoreCell.swift
//  MedMiner
//
//  Created by hosein nahari on 3/17/21.
//

import UIKit

class DrugsInStoreCell: UITableViewCell {
    
    
    @IBOutlet weak var img: CircleImage!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(storeWithDrug: DrugstoreHasDrugs) {
        self.img.image = UIImage(named: storeWithDrug.drug.image)
        self.name.text = storeWithDrug.drug.name
        self.desc.text = "count: \(String(storeWithDrug.count)) price: \(String(storeWithDrug.price))"
    }
}
