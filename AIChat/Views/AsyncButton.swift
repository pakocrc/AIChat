//
//  AsyncButton.swift
//  AIChat
//
//  Created by Francisco Cordoba on 10/1/25.
//

import SwiftUI

struct AsyncButton<Label: View>: View {
    let action: () async -> Void
    let label: Label

    @State var buttonDisabled: Bool

    init(buttonDisabled: Bool,
        action: @escaping () async -> Void,
         @ViewBuilder label: () -> Label) {
        self.buttonDisabled = buttonDisabled
        self.action = action
        self.label = label()
    }

    var body: some View {
        Button {
            buttonDisabled = true

            Task {
                await action()
                buttonDisabled = false
            }

        } label: {
            label
        }
        .background(buttonDisabled ? .gray : .black)
        .foregroundColor(.white)
        .presentationCornerRadius(15)
        .disabled(buttonDisabled)
        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .circular))
        .padding()

    }
}

#Preview {
    AsyncButton(buttonDisabled: true, action: {}) {
        Label {
            Text("Test Async Button")
        } icon: {
//            Image(systemName: "key.horizontal")
        }
    }
}
