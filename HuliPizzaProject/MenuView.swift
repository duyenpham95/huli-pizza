//
//  MenuView.swift
//  HuliPizzaProject
//
//  Created by Duyen on 19/12/2024.
//

import SwiftUI

struct MenuView: View {
    var menu:[MenuItem]
    var body: some View {
        ScrollView{
            ForEach(menu){ item in
                MenuRowView(item: item)
            }
        }
    }
}

#Preview {
    MenuView(menu:MenuModel().menu)
}

