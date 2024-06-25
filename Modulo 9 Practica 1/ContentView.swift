//
//  ContentView.swift
//  Modulo 9 Practica 1
//
//  Created by Desarrollo on 24/06/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var wifiMonitor: WifiMonitor
    @State var loading = false
    
    var body: some View {
        if wifiMonitor.isConnected {
            AudioView()
        } else {
            ContentUnavailableView(
                "No wifi connection",
                systemImage: "wifi.slash",
                description: Text("Please check your connection and try again.")
            )
        }
    }
}

#Preview {
    ContentView()
}
