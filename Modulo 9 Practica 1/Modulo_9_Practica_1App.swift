//
//  Modulo_9_Practica_1App.swift
//  Modulo 9 Practica 1
//
//  Created by Desarrollo on 24/06/24.
//

import SwiftUI

@main
struct Modulo_9_Practica_1App: App {
    @StateObject private var wifiMonitor = WifiMonitor()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(wifiMonitor)
        }
    }
}
