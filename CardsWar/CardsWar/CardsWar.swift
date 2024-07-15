//
//  CardsWar.swift
//  CardsWar
//
//  Created by Danielle Shitrit on 14/07/2024.
//

import SwiftUI

@main
struct CardsWar: App {
    @StateObject var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(locationManager)
        }
    }
}

