//
//  MenuRowView.swift
//  HuliPizzaProject
//
//  Created by Duyen on 19/12/2024.
//

import SwiftUI

struct MenuRowView: View {
    var item:Int
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            // Image(systemName: "\(item).circle.fill").font(.largeTitle)
            if let image = UIImage(named: "\(item)_sm"){
                Image(uiImage: image)
                    .clipShape(Circle())
                    .padding(.trailing, -25)
//                    .padding(.leading, -15)
            } else {
                Image("surfboard_sm")
            }
            VStack(alignment: .leading) {
                Text("Margherita")
                RatingView(rating: 4)
            }
            Spacer()
        }
    }
}

#Preview {
    MenuRowView(item: 2)
}
