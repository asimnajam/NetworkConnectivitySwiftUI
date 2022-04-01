//
//  NetworkMonitor.swift
//  RoutingInSwift
//
//  Created by Admin on 01/04/2022.
//

import Foundation
import Network

extension NWInterface.InterfaceType: CaseIterable {
    public static var allCases: [NWInterface.InterfaceType] = [.other, .wifi, .cellular, .loopback, .wiredEthernet]
}

final class NetworkMonitor: ObservableObject {
    static let shared = NetworkMonitor()
    private let monitor: NWPathMonitor
    private let networkMonitorQueue = DispatchQueue(label: "com.networkMonitorQueue")
    @Published var networkType: NWInterface.InterfaceType = .wifi
    @Published var currentStatus: NWPath.Status = .satisfied
    
    private init() {
        monitor = NWPathMonitor()
    }
    
    func start() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.currentStatus = path.status
            }
            guard let interface = NWInterface.InterfaceType.allCases.filter({ path.usesInterfaceType($0) }).first else {
                return
            }
            DispatchQueue.main.async {
                self?.networkType = interface
            }
        }
        monitor.start(queue: networkMonitorQueue)
    }
    
    func stop() {
        monitor.cancel()
    }
}
