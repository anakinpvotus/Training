//
//  AppSUIApp.swift
//  AppSUI
//
//  Created by Pavel ANIKIN on 05.06.2022.
//

import SwiftUI

@main
struct AppSUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DashboardViewModel())
        }
    }
}
