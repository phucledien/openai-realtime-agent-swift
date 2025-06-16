//
//  ChatBarView.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 14/6/25.
//


import SwiftUI

public struct ChatBarView: View {
    @State private var message: String = ""
    
    private func sendMessage() {
        message = ""
    }
    
    public var body: some View {
        HStack {
            TextField("Input Message", text: $message, prompt: Text("Type a message..."))
                .onSubmit {
                    sendMessage()
                }
            
            Button(action: sendMessage) {
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .buttonStyle(.plain)
            .disabled(message.isEmpty)
        }
    }
}

#Preview(traits: .fixedLayout(width: 800, height: 600)) {
    ChatBarView()
}
