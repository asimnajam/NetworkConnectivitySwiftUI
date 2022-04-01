//
//  ContentView.swift
//  RoutingInSwift
//
//  Created by Admin on 01/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var appState: NetworkMonitor
    
    var body: some View {
        VStack {
            switch appState.currentStatus {
            case .satisfied:
                Text("satisfied")
                    .padding()
                    .font(.system(size: 18.0))
            case .requiresConnection:
                Text("requiresConnection")
                    .padding()
                    .font(.system(size: 18.0))
            case .unsatisfied:
                Text("unsatisfied")
                    .padding()
                    .font(.system(size: 18.0))
            @unknown default:
                Text("default")
                    .padding()
                    .font(.system(size: 18.0))
            }
            switch appState.networkType {
            case .wifi:
                Text("Wifi")
                    .padding()
                    .font(.system(size: 18.0))
            case .cellular:
                Text("Cellular")
                    .padding()
                    .font(.system(size: 18.0))
            default:
                Text("Other")
                    .padding()
                    .font(.system(size: 18.0))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
