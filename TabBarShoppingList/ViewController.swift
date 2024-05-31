//
//  ViewController.swift
//  TabBarShoppingList
//
//  Created by Diplomado on 25/05/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var tableShoppingCart:UITableView!
    @IBOutlet weak var tableStore:UITableView!
    @IBOutlet weak var textField: UITextField!
    
    //var arrayShoppingList = [String]()
    var arrayShoppingList = ["uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho"]
    var arrayShoppingCart = ["ocho", "nueve", "diez", "once", "doce", "trece", "catorce", "quince"]
    var arrayProductsInstore = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Asegúrate de que todas las tablas no sean nil antes de asignar dataSource y delegate
//        guard let tableView = tableView, let tableShoppingCart = tableShoppingCart, let tableStore = tableStore else {
//            print("Una o más tablas no están conectadas")
//            return
//        }

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
            
        tableShoppingCart.dataSource = self
        tableShoppingCart.delegate = self
        tableShoppingCart.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        
        if let tableStore = tableStore { // Verificación de nil
            tableStore.dataSource = self
            tableStore.delegate = self
            tableStore.register(UITableViewCell.self, forCellReuseIdentifier: "storeCell")
        } else {
            print("tableStore is nil")
        }
    }
    
    @IBAction func addProdutStore(_ sender: Any) {
        arrayProductsInstore.append(textField.text ?? "")
        print(arrayProductsInstore)
        tableStore?.reloadData() // Uso opcional para evitar crashes si es nil
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
            return arrayShoppingList.count
        } else if tableView == self.tableShoppingCart {
            return 1 // Assuming you want only one row in the second table
        } else if tableView == self.tableStore {
            return arrayProductsInstore.count
        }

        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell
            cell?.cellTextLabel.text = arrayShoppingList[indexPath.row]
            return cell ?? UITableViewCell()
        } else if tableView == self.tableShoppingCart {
            let cellCart = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
            cellCart.configure(with: arrayShoppingCart)
            return cellCart
        } else if tableView == self.tableStore {
            let cell = tableView.dequeueReusableCell(withIdentifier: "storeCell", for: indexPath)
            cell.textLabel?.text = arrayProductsInstore[indexPath.row]
            return cell
        }

        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableShoppingCart(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableShoppingCart == self.tableShoppingCart {
            arrayShoppingCart.remove(at: indexPath.row)
            tableShoppingCart.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.tableShoppingCart {
            return 300
        }
        return UITableView.automaticDimension
    }
}
