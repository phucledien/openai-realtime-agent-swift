//
//  AppState.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 14/6/25.
//

import SwiftUI

@Observable
@MainActor
public class AppState {
    public static let shared = AppState()
    private init() {}
    
    public var scenario: Scenario = .chatSupervior
    public var agent: Agent = .chatAgent
    
    public var isConnected: Bool = false
    public var isPushToTalk: Bool = false
    public var isAudioPlayback: Bool = true
    public var isShowLog: Bool = true
    public var codec: Codec = .opus
}
