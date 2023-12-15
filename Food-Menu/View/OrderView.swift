//
//  Order.swift
//  Food-Menu
//
//  Created by Bandit Silachai on 14/12/23.
//

import SwiftUI

struct OrderView: View {
    @Binding var showCart: Bool
    @EnvironmentObject private var vm: FoodViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Order")
                .font(.title).bold()
            ForEach(vm.resultOrder(), id: \.0) { item in
                HStack(content: {
                    Text("- \(item.0)")
                        .font(.title3)
                        .fontWeight(.light)
                    Spacer()
                    Text("x\(item.1)")
                        .font(.headline)
                        .fontWeight(.light)
                })
            }
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity,
               minHeight: 0, maxHeight: .infinity,
               alignment: .leading)
        .padding()
        VStack(content: {
            Text("Total: $\(vm.countPrice())")
                .font(.title2).bold()
        })
        
        Button(action: {
            vm.successAlert.toggle()
        }, label: {
            Text("Submit")
        })
        
        .alert("Order complete", isPresented: $vm.successAlert) {
            Button {
                vm.orders.removeAll()
                showCart.toggle()
            } label: {
                Text("OK")
            }
        }
        .disabled(vm.orders.isEmpty)
        .buttonStyle(.borderedProminent)

    }
}


#Preview {
    OrderView(showCart: .constant(false))
        .environmentObject(FoodViewModel())
}
