//
//  AppView.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 14/6/25.
//

import SwiftUI

public struct AppView: View {
    
    @Environment(AppState.self) private var appState
    
    // FIXME: replace this with real data later
    private let transcriptItems = TranscriptItem.getSampleItems()
    
    public var body: some View {
        @Bindable var appState = appState
        
        VStack {
            HStack {
                GroupBox {
                    MainView(transcriptItems: transcriptItems)
                }
                if appState.isShowLog {
                    GroupBox {
                        LogsView()
                    }
                    .transition(.move(edge: .trailing))
                }
            }
            .animation(.easeInOut, value: appState.isShowLog)
            
            Spacer()
            
            BottomToolbarView(
                isConnected: appState.isConnected,
                isPushToTalk: $appState.isPushToTalk,
                isAudioPlayback: $appState.isAudioPlayback,
                isShowLog: $appState.isShowLog,
                selectedCodec: $appState.codec
                
            )
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(
            Text("Realtime API Agents")
        )
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Picker(selection: $appState.scenario, label: Text("Scenario")) {
                    ForEach(Scenario.allCases) { scenario in
                        if (scenario.isSupported) {
                            Text(scenario.title)
                                .tag(scenario)
                        }
                    }
                }
            }
            ToolbarItem(placement: .automatic) {
                Picker(selection: $appState.agent, label: Text("Agent")) {
                    ForEach(Agent.allCases) { agent in
                        Text(agent.title)
                            .tag(agent)
                    }
                }
            }
        }
    }
}

#Preview {
    AppView()
        .environment(AppState.shared)
        .frame(minWidth: 800, idealWidth: 1600, maxWidth: .infinity, minHeight: 600, idealHeight: 1200, maxHeight: .infinity)
}



