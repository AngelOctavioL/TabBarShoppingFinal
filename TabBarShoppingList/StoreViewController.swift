//
//  StoreViewController.swift
//  TabBarShoppingList
//
//  Created by Diplomado on 31/05/24.
//

import UIKit

class StoreViewController: UIViewController {
    @IBOutlet weak var tableStore:UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var arrayProductsInstore = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableStore.dataSource = self
        tableStore.delegate = self
        tableStore.register(UINib(nibName: "CustomTableStoreViewCell", bundle: nil), forCellReuseIdentifier: "storeCell")
    }
    
    @IBAction func addProdutStore(_ sender: Any) {
        arrayProductsInstore.append(textField.text ?? "")
        tableStore?.reloadData() // Uso opcional para evitar crashes si es nil
        print(arrayProductsInstore)
    }
}

extension StoreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayProductsInstore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeCell") as? CustomTableStoreViewCell
        
        if indexPath.section == 0 {
            cell?.cellTextLabel.text = arrayProductsInstore[indexPath.row]
        }
        
        return cell!
    }
}

extension StoreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return indexPath.section == 0 ? 120.0 : 200.0
    }
}
