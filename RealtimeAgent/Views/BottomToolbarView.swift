//
//  BottomToolbarView.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 14/6/25.
//


import SwiftUI


public struct BottomToolbarView: View {
    @State private var isConnected: Bool
    @Binding private var isPushToTalk: Bool
    @Binding private var isAudioPlayback: Bool
    @Binding private var isShowLog: Bool
    @Binding private var selectedCodec: Codec
    
    public init(
        isConnected: Bool,
        isPushToTalk: Binding<Bool>,
        isAudioPlayback: Binding<Bool>,
        isShowLog: Binding<Bool>,
        selectedCodec: Binding<Codec>
    ) {
        self.isConnected = isConnected
        _isPushToTalk = isPushToTalk
        _isAudioPlayback = isAudioPlayback
        _isShowLog = isShowLog
        _selectedCodec = selectedCodec
    }

    public var body: some View {
        HStack(spacing: 32) {
            if isConnected {
                Button(action: {}) {
                    Text("Disconnect")
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            } else {
                Button(action: {}) {
                    Text("Connect")
                }
                .buttonStyle(.borderedProminent)
            }
            
            HStack {
                Toggle("Push to talk", isOn: $isPushToTalk)
                    .disabled(!isConnected)
                Button(action: {}) {
                    Text("Talk")
                }
                .disabled(!isPushToTalk || !isConnected)
            }
            
            Toggle("Audio playback", isOn: $isAudioPlayback)
                .disabled(!isConnected)
            
            Toggle("Logs", isOn: $isShowLog)
            
            Picker(selection: $selectedCodec, label: Text("Codec")) {
                ForEach(Codec.allCases) { codec in
                    Text(codec.title)
                        .tag(codec)
                }
            }
            .frame(width: 200)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview("Disconnected", traits: .fixedLayout(width: 800, height: 600)) {
    BottomToolbarView(
        isConnected: false,
        isPushToTalk: .constant(false),
        isAudioPlayback: .constant(true),
        isShowLog: .constant(true),
        selectedCodec: .constant(.opus)
    )
}

#Preview("Connected", traits: .fixedLayout(width: 800, height: 600)) {
    BottomToolbarView(
        isConnected: true,
        isPushToTalk: .constant(false),
        isAudioPlayback: .constant(true),
        isShowLog: .constant(true),
        selectedCodec: .constant(.opus)
    )
}
