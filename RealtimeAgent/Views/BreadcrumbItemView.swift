//
//  BreadcrumbItemView.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 15/6/25.
//


import SwiftUI

struct BreadcrumbItemView: View {
    @State private var isExpanded: Bool = false
    
    private let item: TranscriptItem
    
    public init(item: TranscriptItem, isExpanded: Bool = false) {
        self.item = item
        self.isExpanded = isExpanded
    }
    
    private var hasData: Bool {
        guard let data = item.data else { return false }
        return !data.isEmpty
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack(alignment: .leading, spacing: 2) {
                // Timestamp
                Text(item.timestamp)
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundStyle(Color(.systemGray))
                
                // Title with expand arrow
                HStack(spacing: 4) {
                    if hasData {
                        Image(systemName: "arrowtriangle.right.fill")
                            .font(.system(size: 8))
                            .foregroundStyle(Color(.systemGray))
                            .rotationEffect(.degrees(isExpanded ? 90 : 0))
                            .animation(.easeInOut(duration: 0.2), value: isExpanded)
                    }
                    
                    Text(item.title ?? "")
                        .font(.system(size: 10, design: .monospaced))
                        .foregroundStyle(Color(.systemGray))
                }
                .onTapGesture {
                    if hasData {
                        isExpanded.toggle()
                    }
                }
                .cursor(hasData ? .pointingHand : .arrow)
            }
            
            // Expanded data
            if isExpanded, let data = item.data {
                Text(formatJSON(data))
                    .textSelection(.enabled)
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundStyle(Color(.systemGray))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    private func formatJSON(_ data: [String: Any]) -> String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [.prettyPrinted])
            return String(data: jsonData, encoding: .utf8) ?? "Invalid JSON"
        } catch {
            return "Error formatting JSON: \(error.localizedDescription)"
        }
    }
}

#Preview("Breadcrumb", traits: .fixedLayout(width: 600, height: 600)) {
    BreadcrumbItemView(item: .mockBreadcrumb())
        .padding()
}


