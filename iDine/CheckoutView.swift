//
//  CheckoutView.swift
//  iDine
//
//  Created by Shubhamay Das on 17.07.22.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipAmounts = [10, 20, 30, 0]
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay? ",selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
            }
            
            Toggle("Add iDine Loyalty Card", isOn: $addLoyaltyDetails.animation())
            if(addLoyaltyDetails) {
                TextField("Enter iDine Number", text: $loyaltyNumber)
            }
            
            Section(header: Text("Add a Tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Total: $100")) {
                Button("Confirm Order") {
                    
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
