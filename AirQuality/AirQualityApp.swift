//
//  AirQualityApp.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 26/02/22.
//

import SwiftUI

@main
struct AirQualityApp: App {
    /// Socket manager
    var sm = SocketManager()
    var body: some Scene {
        WindowGroup {
            /// Initial screen that shows city list information
            CityListsView(vm: CityListViewModel(socketManager: sm))
        }
    }
}
