//
//  MenuModel.swift
//  Food-Menu
//
//  Created by Bandit Silachai on 14/12/23.
//

import Foundation

enum MenuCategory: String {
    case soup = "Soup"
    case beef = "Beef"
    case dessert = "Dessert"
    case drink = "Drink"
}

struct MenuItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let price: Int
    let category: MenuCategory
    let image: String
}

struct CartItem {
    let menuItem: MenuItem
    let quantity: Int
}
