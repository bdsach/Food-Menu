//
//  FoodViewModel.swift
//  Food-Menu
//
//  Created by Bandit Silachai on 14/12/23.
//

import Foundation

struct MenuOrder: Identifiable, Hashable {
    var id = UUID()
    var items: MenuItem
    var quantity: Int
}

final class FoodViewModel: ObservableObject {
    let soups: [MenuItem] = [
        MenuItem(name: "Tom Yum Goong", price: 0, category: .soup, image: "tom-yum-goong"),
        MenuItem(name: "Wonton Soup", price: 0, category: .soup, image: "wonton"),
    ]

    let beefs: [MenuItem] = [
        MenuItem(name: "Rib Eye", price: 8, category: .beef, image: "rib-eye"),
        MenuItem(name: "Pork", price: 8, category: .beef, image: "pork"),
        MenuItem(name: "Chicken", price: 8, category: .beef, image: "chicken"),
    ]

    let desserts: [MenuItem] = [
        MenuItem(name: "Matcha Ice Cream", price: 5, category: .dessert, image: "matcha_ice_cream"),
    ]

    let drinks: [MenuItem] = [
        MenuItem(name: "Pepsi", price: 3, category: .drink, image: "pepsi"),
        MenuItem(name: "Ice Green Tea with Mint", price: 3, category: .drink, image: "iced-green-tea-with-mint"),
    ]
    @Published var successAlert = false
    @Published var orders: [MenuOrder] = []
    
    func add(_ item: MenuItem) {
        let limitItem = orders.filter { $0.items.name == item.name }
        
        if limitItem.count < 10 {
            orders.append(MenuOrder(items: item, quantity: 1))
        }
    }
    
    func remove(_ item: MenuItem) {
        if let findIndex = orders.firstIndex(where: { $0.items.name == item.name }) {
            orders.remove(at: findIndex)
        }
    }
    
    func getImage(_ item: MenuItem) -> String {
        
        return ""
    }

    func count(_ item: MenuItem) -> Int {
        let filtered = orders.filter { $0.items.name == item.name }
        return filtered.count
    }
    
    func countPrice() -> Int {
        
        let price = orders.map { item in
            item.items.price
        }.reduce(0) { prev, next in
            return prev + next
        }

        return price
    }
    
    func resultOrder() -> [(String, Int)] {

        var tupleOrders: [(String, Int)] = []
        
        for val in orders {
            if orders.contains(val) {
                tupleOrders.append((val.items.name, 1))
            }
        }

        var counts: [String: Int] = [:]

        for (item, count) in tupleOrders {
            if let existingCount = counts[item] {
                counts[item] = existingCount + count
            } else {
                counts[item] = count
            }
        }
        
        return counts.map { (item, count) in
            return (item, count)
        }

    }
    
}

