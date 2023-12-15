//
//  Checkout.swift
//  Food-Menu
//
//  Created by Bandit Silachai on 14/12/23.
//

import Foundation
import SwiftUI

struct Checkout: View {
    @Binding var showCart: Bool
    @EnvironmentObject private var vm: FoodViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.regularMaterial)
            .frame(width: UIScreen.main.bounds.width * 0.9 ,height: 60)
            .overlay(content: {
                HStack(alignment: .lastTextBaseline ,content: {
                    HStack {
                        Text("\(vm.orders.count)").bold()
                        Text("Item")
                    }
                    .frame(width: 70)
                   
                    Spacer()
                    
                    Text("Checkout")
                        .fontWeight(.bold)
                        .frame(width: 140)
                    
                    Spacer()
                    Text("$\(vm.countPrice())")
                        .frame(width: 50)
                })
                .padding()
            })
            .onTapGesture {
                showCart.toggle()
//                vm.order.removeAll()
            }
    }
}

#Preview {
    Checkout(showCart: .constant(false))
}
