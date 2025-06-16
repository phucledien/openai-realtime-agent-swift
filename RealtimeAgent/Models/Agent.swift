//
//  Agent.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 14/6/25.
//


import SwiftUI

public enum Agent: Int, CaseIterable, Identifiable {
    case chatAgent
    
    public var id: Int {
        self.rawValue
    }
    
    public var title: String {
        switch self {
        case .chatAgent: return "Chat Agent"
        }
    }
}