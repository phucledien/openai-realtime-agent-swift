//
//  Scenario.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 14/6/25.
//


import SwiftUI

public enum Scenario: Int, CaseIterable, Identifiable {
    case customerServiceRetail
    case chatSupervior
    case simpleHandoff
    
    public var id: Int {
        self.rawValue
    }
    
    public var title: String {
        switch self {
        case .customerServiceRetail: return "Customer Service Retail"
        case .chatSupervior: return "Chat Supervisor"
        case .simpleHandoff: return "Simple Handoff"
        }
    }
   
    // FIXME: will support all scenario later
    public var isSupported: Bool {
        switch self {
        case .customerServiceRetail: return false
        case .chatSupervior: return true
        case .simpleHandoff: return false
        }
    }
}