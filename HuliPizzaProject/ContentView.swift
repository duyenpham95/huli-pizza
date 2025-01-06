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
    @State private var showOrders:Bool = false
    @State private var selectedItem: MenuItem = noMenuItem
    @State private var presentGrid:Bool = true
    var body: some View {
        TabView {
            VStack {
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                StatusBarView(showOrders: $showOrders, presentGrid: $presentGrid)
                
                MenuItemView(item: $selectedItem, orders: orders)
                    .padding(5)
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                if presentGrid{
                    MenuGridView(menu: menu, selectedItem: $selectedItem)
                }
                else {
                    MenuView(menu:menu, selectedItem: $selectedItem)
                }
                Spacer()
            }.tabItem {
                Label("Menu", systemImage: "list.bullet")
            }
            VStack {
            HeaderView()
                .shadow(radius: 5)
                .environment(\.colorScheme, .light)
            StatusBarView(showOrders: $showOrders, presentGrid: $presentGrid)
//            if showOrders{
                OrderView(orders: orders)
                    .cornerRadius(10)
            }
            .tabItem{
                Label("Order", systemImage: "cart")
            }

        }
        .padding()
        .background(LinearGradient(colors: [.cyan, Color("Surf"), Color("Sky"), .white], startPoint: .topLeading, endPoint: .bottom))
        .environmentObject(orders)
    }
}

#Preview {
    ContentView(menu:MenuModel().menu)
}
