//
//  SteamAnalyticsApp.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import SwiftUI

@main
struct SteamAnalyticsApp: App {
    @State private var app = AppState()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(app)
                .task { app.carregar() }
                .frame(minWidth: 900, minHeight: 640)
        }
        .windowResizability(.contentMinSize)
        .defaultSize(width: 1180, height: 800)
        .commands {
            CommandGroup(replacing: .newItem) { }   // o app não cria documentos
        }
    }
}
