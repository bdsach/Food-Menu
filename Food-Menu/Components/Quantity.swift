//
//  Quantity.swift
//  Food-Menu
//
//  Created by Bandit Silachai on 14/12/23.
//

import SwiftUI

struct Quantity: View {
    var item: MenuItem
    @EnvironmentObject private var vm: FoodViewModel
    
    var body: some View {
        HStack {
            Button("-") {
                vm.remove(item)
            }
            .buttonStyle(.plain)
            .padding([.leading], 10)
            .padding([.top, .bottom], 5)
            
            Text("\(vm.count(item))")
                .frame(width: 25)
            
            Button("+") {
                vm.add(item)
            }
            .buttonStyle(.plain)
            .padding([.trailing], 10)
            .padding([.top, .bottom], 5)
        }
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
