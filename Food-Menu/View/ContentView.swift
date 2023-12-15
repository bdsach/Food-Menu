//
//  ContentView.swift
//  Food-Menu
//
//  Created by Bandit Silachai on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showCart = false
    
    @EnvironmentObject private var vm: FoodViewModel
    
    var body: some View {
        NavigationView(content: {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Text(MenuCategory.soup.rawValue)
                        .font(.title3)
                        .bold()
                    ForEach(vm.soups, id: \.id) {item in
                        DetailCardView(item: item)
                    }

                    Text(MenuCategory.beef.rawValue)
                        .font(.title3)
                        .bold()
                        .padding(.top, 30)
                    ForEach(vm.beefs, id: \.id) {item in
                        DetailCardView(item: item)
                    }

                    Text(MenuCategory.dessert.rawValue)
                        .font(.title3)
                        .bold()
                        .padding(.top, 30)
                    ForEach(vm.desserts, id: \.id) {item in
                        DetailCardView(item: item)
                    }
  
                    Text(MenuCategory.drink.rawValue)
                        .font(.title3)
                        .bold()
                        .padding(.top, 30)
                    ForEach(vm.drinks, id: \.id) {item in
                        DetailCardView(item: item)
                    }
                    
                    Spacer()
                }
                .padding()
                .navigationTitle("Menu")
                
            }
            .safeAreaPadding(.bottom, 50)
            .overlay(alignment: .topTrailing, content: {
                Circle()
                    .fill(.clear)
                    .frame(width: 50, height: 50)
                    .padding(.trailing)
                    .offset(x: 0, y: -50)
                    .overlay(alignment: .center) {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 50))
                            .offset(x: -5, y: -50)
                            .foregroundStyle(.gray)
                    }
            })
        })
        
        .overlay(alignment: .bottom) {
            Checkout(showCart: $showCart)
        }
        
        .sheet(isPresented: $showCart, content: {
            OrderView(showCart: $showCart)
            .presentationDetents([.medium, .large])
        })
    }
}


#Preview {
    ContentView()
        .environmentObject(FoodViewModel())
}
