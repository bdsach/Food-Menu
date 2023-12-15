//
//  Food_MenuApp.swift
//  Food-Menu
//
//  Created by Bandit Silachai on 14/12/23.
//

import SwiftUI

@main
struct Food_MenuApp: App {
    @StateObject private var vm = FoodViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
