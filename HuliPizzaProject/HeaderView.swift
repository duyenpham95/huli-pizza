//
//  HeaderView.swift
//  HuliPizzaProject
//
//  Created by Duyen on 19/12/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("surfBanner")
                .resizable()
                .scaledToFit()
            Text("Huli Pizza Company")
                .font(.custom("Georgia", size: 30, relativeTo: .title))
//                .foregroundColor(Color("Sky"))
                .foregroundStyle(.regularMaterial)
                .fontWeight(.semibold)
        }
    }
}


#Preview {
    HeaderView()
}
