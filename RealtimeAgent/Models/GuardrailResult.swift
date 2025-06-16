//
//  GuardrailResult.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 14/6/25.
//


public struct GuardrailResult {
    public enum GuardRailResultStatus: String {
        case inProgress
        case done
    }
    
    public let status: GuardRailResultStatus
    public let testText: String?
    public let category: ModerationCategory?
    public let rationale: String?
}