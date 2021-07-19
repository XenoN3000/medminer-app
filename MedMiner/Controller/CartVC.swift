//
//  CartVC.swift
//  MedMiner
//
//  Created by hosein nahari on 6/6/21.
//

import UIKit

class CartVC: UIViewController, UITableViewDelegate, UITableViewDataSource {


    //MARK: - OutLets
    @IBOutlet weak var priceTxtLbl: UILabel!
    @IBOutlet weak var cartTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cartTableView.dataSource = self
        self.cartTableView.delegate = self
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    
    func setUpView() {
        cartTableView.reloadData()
        priceTxtLbl.text = "\(calculatePrice()) Toman"
        
        
    }
    
    
    
    func calculatePrice() -> Double {
        var p = 0.00
        let formatter = NumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: "EN") as Locale?
                
        for drug in UserDataService.instance.cart {
            var s = drug.price.replacingOccurrences(of: "تومان", with: "")
            var final = formatter.number(from: s)
            p = p + Double(final!)
        }
     
        
        return p
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let noneed = UserDataService.instance.cart[indexPath.row]
            UserDataService.instance.cart.remove(at: indexPath.row)
            cartTableView.deleteRows(at: [indexPath], with: .fade)
            setUpView()
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDataService.instance.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableViewConfig(indexpath: indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableViewConfig(indexpath: IndexPath) -> UITableViewCell {
        
        if let cell = cartTableView.dequeueReusableCell(withIdentifier: CART_CELL, for: indexpath) as? CartViewCell{
            
            let drug = UserDataService.instance.cart[indexpath.row]
            cell.configureCell(storeWithDrug: drug)
            return cell
        }
        
        return UITableViewCell()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
