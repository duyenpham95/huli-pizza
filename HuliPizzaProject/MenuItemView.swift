//
//  MenuItemView.swift
//  HuliPizzaProject
//
//  Created by Duyen on 19/12/2024.
//

import SwiftUI

struct MenuItemView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Margherita")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.ultraThickMaterial)
                    .padding(.leading)
                   
                if let image = UIImage(named: "0x_lg"){
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding([.top,.bottom], 5)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                } else {
                    Image("surfboard_lg")
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(.degrees(180))
                }
            }
            .background(.linearGradient(colors: [Color("Surf"), Color("Sky").opacity(0.1)], startPoint: .leading, endPoint: .trailing), in:Capsule())
            .shadow(color:.teal, radius: 5, x:8, y:8)
            VStack {
          
                ScrollView {
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.").font(.custom("Georgia", size: 18, relativeTo: .body))
                }
            }

        }
    }
}

#Preview {
    MenuItemView()
}
