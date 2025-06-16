//
//  MessageItemView.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 14/6/25.
//

import SwiftUI

public struct MessageItemView: View {
    public let item: TranscriptItem
    
    public init(item: TranscriptItem) {
        self.item = item
    }
    
    private var isUser: Bool {
        item.role == .user
    }
    
    private var isBracketedMessage: Bool {
        guard let title = item.title else { return false }
        return title.hasPrefix("[") && title.hasSuffix("]")
    }
    
    private var displayTitle: String {
        guard let title = item.title else { return "" }
        return isBracketedMessage ? String(title.dropFirst().dropLast()) : title
    }
    
    public var body: some View {
        HStack {
            if isUser {
                Spacer()
            }
            
            VStack(alignment: isUser ? .trailing : .leading, spacing: 0) {
                // Message bubble
                VStack(alignment: .leading, spacing: 4) {
                    // Timestamp
                    Text(item.timestamp)
                        .font(.system(size: 10, design: .monospaced))
                        .foregroundColor(isUser ? .gray : Color(.secondaryLabelColor))
                    
                    // Message content
                    Text(displayTitle)
                        .font(.body)
                        .foregroundColor(isBracketedMessage ? .gray : (isUser ? Color(.textColor) : Color(.secondaryLabelColor)))
                        .italic(isBracketedMessage)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                // Guardrail result
                if let guardrailResult = item.guardrailResult {
                    GuardrailChipView(guardrailResult: guardrailResult)
                }
            }
            .background(isUser ? Color(.textBackgroundColor) : Color(.secondarySystemFill))
            .foregroundColor(isUser ? .white : .black)
            .cornerRadius(16)
            .frame(maxWidth: 300, alignment: isUser ? .trailing : .leading)
            
            if !isUser {
                Spacer()
            }
        }
    }
}




// MARK: - Preview
#Preview("User", traits: .fixedLayout(width: 600, height: 600)) {
    MessageItemView(item: .mockUser())
        .padding()
}

#Preview("Assistant", traits: .fixedLayout(width: 600, height: 600)) {
    MessageItemView(item: .mockAssistant())
        .padding()
}
