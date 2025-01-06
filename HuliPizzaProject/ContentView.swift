//
//  ContentView.swift
//  HuliPizzaProject
//
//  Created by Duyen on 19/12/2024.
//

import SwiftUI

struct ContentView: View {
    var menu:[MenuItem]
    @StateObject var orders:OrderModel = OrderModel()
    @State private var showOrders:Bool = true
    @State private var selectedItem: MenuItem = noMenuItem
    var body: some View {
        VStack {
            HeaderView()
                .shadow(radius: 5)
                .environment(\.colorScheme, .light)
            StatusBarView(showOrders: $showOrders)
            if showOrders{
                OrderView(orders: orders)
                    .cornerRadius(10)
            } else {
                MenuItemView(item: $selectedItem, orders: orders)
                    .padding(5)
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                MenuView(menu:menu, selectedItem: $selectedItem)
            }
            Spacer()
        }
        .padding()
        .background(LinearGradient(colors: [.cyan, Color("Surf"), Color("Sky"), .white], startPoint: .topLeading, endPoint: .bottom))
        .environmentObject(orders)
    }
}

#Preview {
    ContentView(menu:MenuModel().menu)
}
