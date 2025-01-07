//
//  OrderView.swift
//  HuliPizzaProject
//
//  Created by Duyen on 19/12/2024.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var orders:OrderModel
    var body: some View {
        VStack {
            NavigationStack{
                List{
                    ForEach($orders.orderItems) { $order in
                        //Text(order.item.name)
                        NavigationLink(value:order) {
                            OrderRowView(order: $order)
                                .padding(4)
                                .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 10)
                                .padding(.bottom, 5)
                                .padding([.leading, .trailing], 7)
                        }.navigationDestination(for: OrderItem.self) { order in
                            OrderDetailView(orderItem: $order, presentSheet: .constant(false), newOrder: .constant(false))
                        }.navigationTitle("Your Order")
                    }
                    .onDelete{indexSet in
                        orders.orderItems.remove(atOffsets: indexSet)
                    }
                    .onMove { source, destination in
                        orders.orderItems.move(fromOffsets: source, toOffset: destination)
                    }
                }
            }
            //            .padding(.top, 75)
            //            Button("Delete Order") {
            //                if !orders.orderItems.isEmpty {
            //                    orders.removeLast()
            //                }
            //            }
            //            .padding(5)
            //            .background(.regularMaterial, in:Capsule())
            //            .padding(7)
        }
        .background(.regularMaterial)
    }
}


#Preview {
    OrderView(orders: OrderModel())
}


