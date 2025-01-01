//
//  RatingView.swift
//  HuliPizzaProject
//
//  Created by Duyen on 19/12/2024.
//

import SwiftUI

struct RatingView: View {
    var rating:Int = 4
    var body: some View {
        HStack{
            ForEach(1...6, id:\.self) {
                circle in
                Image(systemName: (circle <= rating) ? "fork.knife.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    RatingView(rating: 5)
}
