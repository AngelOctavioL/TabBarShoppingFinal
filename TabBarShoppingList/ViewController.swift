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
    @IBOutlet  weak var searchBar: UISearchBar!
    
    //var arrayShoppingList = ["uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho"]
    var arrayShoppingList = [String]()
    var arrayShoppingCart = [String]()
    
    var searchArray: [String] = []
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
            
        tableShoppingCart.dataSource = self
        tableShoppingCart.delegate = self
        tableShoppingCart.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        
        self.searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            //searchArray = arrayShoppingList
            // Acceder al arrayProductsInstore de StoreViewController
            if let tabBarController = self.tabBarController,
               let storeVC = tabBarController.viewControllers?.first(where: { $0 is StoreViewController }) as? StoreViewController {
                let arrayProductsInstore = storeVC.arrayProductsInstore
                print(arrayProductsInstore)
                arrayShoppingList = arrayProductsInstore
                // Utilizar el arrayProductsInstore en ViewController como desees
                
                // Recargar la tabla después de obtener los datos
                searchArray = arrayShoppingList
                tableView.reloadData()
            }
        }
    
    // Agregar esta función para manejar la acción del botón
        func addToCartButtonTapped(for indexPath: IndexPath) {
            let selectedItem = arrayShoppingList[indexPath.row]
            arrayShoppingCart.append(selectedItem)
            tableShoppingCart.reloadData()
        }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
            return searchArray.count
        } else if tableView == self.tableShoppingCart {
            return 1 // Assuming you want only one row in the second table
        }

        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if tableView == self.tableView {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
                cell.cellTextLabel.text = searchArray[indexPath.row]
                
                // Asigna la función de manejo del botón
                cell.addToCartAction = { [weak self] in
                    self?.addToCartButtonTapped(for: indexPath)
                }
                
                return cell
            } else if tableView == self.tableShoppingCart {
                let cellCart = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
                cellCart.configure(with: arrayShoppingCart)
                return cellCart
            }

            return UITableViewCell()
        }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hola!!!")
        self.arrayShoppingCart.remove(at: indexPath.row)
        tableShoppingCart.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.tableShoppingCart {
            return 300
        }
        return UITableView.automaticDimension
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchArray = arrayShoppingList.filter({ $0.prefix(searchText.count).lowercased() == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
}
