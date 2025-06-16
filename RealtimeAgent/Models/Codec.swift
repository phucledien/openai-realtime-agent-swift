//
//  Codec.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 14/6/25.
//


import SwiftUI

public enum Codec: Int, CaseIterable, Identifiable {
    case opus
    case pcmu
    case pcma
    
    public var id: Int {
        self.rawValue
    }
    
    public var khz: Int {
        switch self {
        case .opus: return 48
        case .pcma, .pcmu: return 8
        }
    }
    
    public var title: String {
        switch self {
        case .opus : return "Opus (\(khz) kHz)"
        case .pcma: return "PCMA (\(khz) kHz)"
        case .pcmu: return "PCMU (\(khz) kHz)"
        }
    }
}