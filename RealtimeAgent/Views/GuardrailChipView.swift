//
//  GuardrailChipView.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 16/6/25.
//


import SwiftUI

public struct GuardrailChipView: View {
    public enum ViewState {
        case pending
        case pass
        case fail
        
        public var description: String {
            switch self {
            case .pending: return "Pending"
            case .pass: return "Pass"
            case .fail: return "Fail"
            }
        }
        
        public var color: Color {
            switch self {
            case .pending:
                return Color(.gray)
            case .pass:
                return Color(.green)
            case .fail:
                return Color(.red)
            }
        }
        
        public var icon: String {
            switch self {
            case .pending:
                return "clock"
            case .pass:
                return "checkmark.circle"
            case .fail:
                return "exclamationmark.triangle"
            }
        }
    }
    
    
    @State private var isExanded: Bool = false
    
    private let guardrailResult: GuardrailResult
    
    private var state: ViewState {
        guard guardrailResult.status == .done, let category = guardrailResult.category else {
            return .pending
        }
            
        if category == ModerationCategory.none {
            return .pass
        }
        
        return .fail
    }
    
    private var isPassed: Bool {
        return guardrailResult.category == ModerationCategory.none
    }
    
    private var resultTitle: String {
        if guardrailResult.status == .inProgress { return "Pending" }
            
        guard let category = guardrailResult.category else { return "Unknown" }
        
        if category == ModerationCategory.none {
            return "Pass"
        }
        
        return "Fail"
    }
    
    public init(guardrailResult: GuardrailResult, isExanded: Bool = false) {
        self.guardrailResult = guardrailResult
        self.isExanded = isExanded
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Guardrail:")
                    .foregroundStyle(Color(.textColor))
                HStack(spacing: 2) {
                    Image(systemName: state.icon)
                    Text(state.description)
                }
                .foregroundStyle(state.color)
                Spacer()
            }
            if isExanded {
                VStack(alignment:. leading) {
                    Text("Moderation Category: \(guardrailResult.category?.description ?? "Unknown")")
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.textColor))

                    Text(guardrailResult.rationale ?? "")
                        .foregroundStyle(Color(.textColor))

                    HStack(spacing: 4) {
                        Rectangle()
                            .frame(width: 1)
                            .fixedSize()
                        Text(guardrailResult.testText ?? "")
                    }
                    .foregroundStyle(Color(.placeholderTextColor))
                }
                .transition(.move(edge: .bottom))
            }
        }
        .font(.caption)
        .padding(.vertical, 8)
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .background(Color(.textBackgroundColor))
        .cursor(state == .pending ? .arrow : .pointingHand)
        .onTapGesture {
            guard state != .pending else { return }
            withAnimation {
                isExanded.toggle()
            }
        }
    }
}

#Preview("Pending", traits: .fixedLayout(width: 300, height: 300)) {
    GuardrailChipView(
        guardrailResult: .init(status: .inProgress,
                               testText: "hello",
                               category: ModerationCategory.none,
                               rationale: "Nothing")
    )
}

#Preview("Pass") {
    GuardrailChipView(
        guardrailResult: .init(status: .done,
                               testText: "hello",
                               category: ModerationCategory.none,
                               rationale: "Nothing")
    )
}

#Preview("Fail") {
    GuardrailChipView(
        guardrailResult: .init(status: .done,
                               testText: "hello",
                               category: ModerationCategory.violence,
                               rationale: "Nothing")
    )
}
