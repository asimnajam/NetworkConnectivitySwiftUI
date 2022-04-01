//
//  RoutingInSwiftApp.swift
//  RoutingInSwift
//
//  Created by Admin on 01/04/2022.
//

import SwiftUI

@main
struct RoutingInSwiftApp: App {
    let networkMonitor = NetworkMonitor.shared
    
    init() {
        networkMonitor.start()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(networkMonitor)
        }
    }
}
