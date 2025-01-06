//
//  MenuGridView.swift
//  HuliPizzaProject
//
//  Created by Duyen on 6/1/2025.
//

import SwiftUI

struct MenuGridView: View {
    @State private var favorites:[Int] = [-1]
    func menu(id: Int) -> MenuItem{
        menu.first(where: { $0.id == id }) ?? noMenuItem
    }
    
    var menu:[MenuItem]
    @State var selectedItem:MenuItem = noMenuItem
    let columnLayout = Array(repeating: GridItem(spacing:10), count: 3)
    let columnLayout2 = Array(repeating: GridItem(spacing:10), count: 5)
    var body: some View {
        VStack{
            LazyVGrid(columns: columnLayout2) {
                ForEach(favorites.sorted(), id:\.self) { item in
                    FavoriteTileView(menuItem: menu(id: item))
                        .onLongPressGesture {
                            if let index = favorites.firstIndex(where: {$0 == item}) {
                                favorites.remove(at: index)
                            }
                        }
                }
            }
            Text(selectedItem.name)
            ScrollView {
                LazyVGrid(columns: columnLayout){
                    ForEach(menu){ item in
                        if !favorites.contains(item.id){
                            MenuItemTileView(menuItem: item)
                                .animation(.easeOut, value: favorites)
                                .onTapGesture(count:2) {
                                    if !favorites.contains(item.id){
                                        withAnimation(.easeInOut) {
                                            favorites.append(item.id)
                                        }
                                    }
                                }
                                .onTapGesture {
                                    selectedItem = item
                                }
                                .onLongPressGesture{
                                    selectedItem = noMenuItem
                                }
                        }
                    }
                }
            }
        }
        .animation(.easeOut(duration: 0.5), value: favorites)
    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu)
}
