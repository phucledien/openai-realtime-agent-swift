//
//  RealtimeAgentApp.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 14/6/25.
//

import SwiftUI

@main
struct RealtimeAgentApp: App {
    @State private var appState: AppState = .shared
    
    var body: some Scene {
        @Bindable var appState = appState
        
        WindowGroup {
            AppView()
                .environment(appState)
                .frame(minWidth: 800, idealWidth: 1600, maxWidth: .infinity, minHeight: 600, idealHeight: 1200, maxHeight: .infinity)
                
        }
    }
}
