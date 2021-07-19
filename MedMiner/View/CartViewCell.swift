//
//  CartViewCell.swift
//  MedMiner
//
//  Created by hosein nahari on 7/18/21.
//

import UIKit

class CartViewCell: UITableViewCell {
    @IBOutlet weak var img: CircleImage!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(storeWithDrug: DrugstoreHasDrugs) {
        self.img.image = UIImage(named: storeWithDrug.drug.picture!)
        self.name.text = storeWithDrug.drug.name
        self.priceLbl.text =  "price: \(String(storeWithDrug.price))"
    }
}
