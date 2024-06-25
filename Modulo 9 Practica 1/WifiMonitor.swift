//
//  InternetMonitor.swift
//  Modulo 9 Practica 1
//
//  Created by Desarrollo on 24/06/24.
//

import Foundation
import Network

class WifiMonitor: ObservableObject {
    private let networkMonitor = NWPathMonitor()
    private let monitorQueue = DispatchQueue(label: "Monitor")
    
    var isConnected = false
    
    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied && path.usesInterfaceType(.wifi)
            Task {
                await MainActor.run {
                    self.objectWillChange.send()
                }
            }
        }
        networkMonitor.start(queue: monitorQueue)
    }
}
