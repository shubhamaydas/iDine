//
//  OrderView.swift
//  iDine
//
//  Created by Shubhamay Das on 17.07.22.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("price: \(item.price)")
                        }
                    }
                }
                
                Section {
                    NavigationLink (destination: CheckoutView()) {
                            Text("Place Order")
                        }
                    
                }
            }
        }.navigationTitle("Order")
            .listStyle(InsetGroupedListStyle())
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        OrderView()
            .environmentObject(Order())
        }
    }
}
