//
//  OrderView.swift
//  HuliPizzaProject
//
//  Created by Duyen on 19/12/2024.
//

import SwiftUI

struct OrderView: View {
    var orders:[Int]
    var body: some View {
        ZStack (alignment: .top){
            ScrollView{
                ForEach(orders, id:\.self) { order in
                    OrderRowView(order: order)
                        .padding(4)
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 10)
                        .padding(.bottom, 5)
                        .padding([.leading, .trailing], 7)
                }
            }
            .padding(.top, 75)
            
            HStack {
                Text("Order Pizza")
                    .font(.title)
                Spacer()
                Label{
                    Text(59.90,format: .currency(code: "USD"))
                }
                icon: {
                    Image(systemName: orders.isEmpty ? "cart" : "cart.circle.fill")
                }
            }
            .padding()
            .background(.ultraThinMaterial)
            
   
           
        }
        .padding()
        .background(Color("Surf"))
    }
}


#Preview {
    OrderView(orders: [1,2,3,4,6])
}


