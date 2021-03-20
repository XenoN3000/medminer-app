//
//  DrugStoreCell.swift
//  MedMiner
//
//  Created by hosein nahari on 3/16/21.
//

import UIKit



class DrugStoreCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configureCell(drugStore : DrugStore) {
        self.img.image = UIImage(named: drugStore.image)
        self.name.text = drugStore.name
        self.desc.text = "City: \(String(describing: drugStore.city)) Address: \(String(describing: drugStore.address))  working-time: \(String(drugStore.open) ) - \(String(drugStore.close))"
    
    }
    
    
}
