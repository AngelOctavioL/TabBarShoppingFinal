//
//  DataSharingProtocol.swift
//  TabBarShoppingList
//
//  Created by Diplomado on 31/05/24.
//

import Foundation

class Items {
    static let sharedInstance = Items()
    var arrayProductsInstore = [String]()
}
