//
//  LogsView.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 14/6/25.
//


import SwiftUI

public struct LogsView: View {
    public var body: some View {
        VStack {
            header
            Spacer()
            content
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    private var header: some View {
        VStack {
            HStack {
                Text("Logs")
                    .font(.headline)
                Spacer()
            }
            Spacer()
            Divider()
        }
        .frame(height: 30)
    }
    
    @ViewBuilder
    private var content: some View {
        VStack {
            Text("Logs content")
            Spacer()
        }
    }
}

#Preview(traits: .fixedLayout(width: 800, height: 600)) {
    LogsView()
}
