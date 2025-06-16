//
//  TranscriptView.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 14/6/25.
//


import SwiftUI

public struct TranscriptView: View {
    @State private var justCopied: Bool = false

    private let transcriptItems: [TranscriptItem]
    
    public init(transcriptItems: [TranscriptItem]) {
        self.transcriptItems = transcriptItems
    }
    
    public var body: some View {
        VStack {
            header
            Spacer()
            content
        }
    }
    
    @ViewBuilder
    private var header: some View {
        VStack {
            HStack {
                Text("Transcript")
                    .font(.headline)
                Spacer()
                
                Button(action: copy) {
                    Label {
                        Text(justCopied ? "Copied!" : "Copy")
                    } icon: {
                        Image(systemName: "document.on.clipboard")
                    }
                }
                Button(action: downloadAudio) {
                    Label {
                        Text("Download Audio")
                    } icon: {
                        Image(systemName: "arrow.down.circle")
                    }
                }
                
            }
            Spacer()
            
            Divider()
        }
        .frame(height: 30)
    }
    
    @ViewBuilder
    private var content: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(transcriptItems.filter { !$0.isHidden }, id: \.itemId) { item in
                    switch item.type {
                    case .message:
                        MessageItemView(
                            item: item
                        )
                    case .breadcrumb:
                        BreadcrumbItemView(
                            item: item,
                        )
                    }
                }
            }
            .padding()
        }
    }
    
    private func copy() {
        justCopied = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.justCopied = false
        }
    }
    
    private func downloadAudio() {
       // FIXME: implement
    }
}

#Preview(traits: .fixedLayout(width: 800, height: 600)) {
    TranscriptView(transcriptItems: TranscriptItem.getSampleItems())
}

