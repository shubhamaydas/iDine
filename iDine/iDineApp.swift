//
//  iDineApp.swift
//  iDine
//
//  Created by Shubhamay Das on 17.07.22.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
