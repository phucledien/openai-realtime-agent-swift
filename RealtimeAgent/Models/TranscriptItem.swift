//
//  TranscriptItem.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 14/6/25.
//

import Foundation

public struct TranscriptItem {
    public enum TranscriptItemType: String {
        case message
        case breadcrumb
    }
    
    public enum TranscriptItemRole: String {
        case user
        case assistant
    }
    
    public enum TranscriptItemStatus: String {
        case inProgress
        case done
    }
    
    public let itemId: String
    public let type: TranscriptItemType
    public let role: TranscriptItemRole?
    public let title: String?
    public let data: [String: Any]?
    public let expanded: Bool
    public let timestamp: String
    public let createdAtMs: Int
    public let status: TranscriptItemStatus
    public let isHidden: Bool
    public let guardrailResult: GuardrailResult?
}


extension TranscriptItem {
    public static func mockUser() -> Self {
        return TranscriptItem(
            itemId: UUID().uuidString,
            type: .message,
            role: .user,
            title: "Hello, how are you?",
            data: nil,
            expanded: false,
            timestamp: "10:30 AM",
            createdAtMs: 1000,
            status: .done,
            isHidden: false,
            guardrailResult: nil
        )
    }
    
    public static func mockAssistant() -> Self {
        return TranscriptItem(
            itemId: UUID().uuidString,
            type: .message,
            role: .assistant,
            title: "I'm doing well, thank you! How can I help you today?",
            data: nil,
            expanded: false,
            timestamp: "10:31 AM",
            createdAtMs: 1000,
            status: .done,
            isHidden: false,
            guardrailResult: GuardrailResult(
                status: .done,
                testText: "I'm doing well, thank you! How can I help you today?",
                category: ModerationCategory.none,
                rationale: "The message is a polite inquiry offering assistance and does not contain any offensive, disparaging, or violent content."
            )
        )
    }
    
    public static func mockBreadcrumb() -> Self {
        return TranscriptItem(
            itemId: UUID().uuidString,
            type: .breadcrumb,
            role: nil,
            title: "System Event",
            data: ["event": "user_login", "userId": "12345"],
            expanded: false,
            timestamp: "10:32 AM",
            createdAtMs: 1000,
            status: .done,
            isHidden: false,
            guardrailResult: nil
        )
    }
    
    public static func getSampleItems() -> [Self] {
        return (0...40).map { index in
            if index.isMultiple(of: 10) {
                return .mockBreadcrumb()
            }
            
            if index.isMultiple(of: 2) {
                return .mockAssistant()
            } else {
                return .mockUser()
            }
        }
    }
}

