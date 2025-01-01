//
//  MenuView.swift
//  HuliPizzaProject
//
//  Created by Duyen on 19/12/2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ScrollView{
            ForEach(1...25, id:\.self){ item in
                MenuRowView(item: item)
            }
        }
    }
}

#Preview {
    MenuView()
}
