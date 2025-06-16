//
//  MainView.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 14/6/25.
//

import SwiftUI

public struct MainView: View {
    private let transcriptItems: [TranscriptItem]
    
    public init(transcriptItems: [TranscriptItem]) {
        self.transcriptItems = transcriptItems
    }
    
    public var body: some View {
        VStack {
            TranscriptView(transcriptItems: transcriptItems)
            Spacer()
            Divider()
            ChatBarView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview(traits: .fixedLayout(width: 800, height: 600)) {
    MainView(transcriptItems: TranscriptItem.getSampleItems())
}
