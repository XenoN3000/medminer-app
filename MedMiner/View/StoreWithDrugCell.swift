//
//  StoreWithDrugCell.swift
//  MedMiner
//
//  Created by hosein nahari on 3/16/21.
//

import UIKit

class StoreWithDrugCell: UITableViewCell {

    @IBOutlet weak var img: RoundCurveImg!
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
        self.img.image = UIImage(named: storeWithDrug.drugstore?.picture ?? "\(DEFAULT_DS_PIC)")
        self.name.text = storeWithDrug.name
        self.desc.text = "count: \(String(storeWithDrug.count)) price: \(String(storeWithDrug.price))"
    }
    
    
    

}
