//
//  DetailCard.swift
//  Food-Menu
//
//  Created by Bandit Silachai on 14/12/23.
//

import SwiftUI

struct DetailCardView: View {
    var item: MenuItem
    var image: String = "meat"
    
    var body: some View {
        HStack(alignment: .center, spacing:0, content: {
            HStack {
                Rectangle()
                    .fill(.clear)
                    .frame(width: 80, height: 80)
                    .overlay {
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 8))}
                VStack(alignment: .leading) {
                    Text(item.name)
                    Text("$\(item.price)")
                        .font(.caption)
                }
            }
            Spacer()
            Quantity(item: item)
        })
    }
}
