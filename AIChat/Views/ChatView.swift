//
//  ChatView.swift
//  AIChat
//
//  Created by Francisco Cordoba on 9/1/25.
//

import SwiftUI

struct ChatView: View {
    let service: GeminiService

    @State private var inputTextfield = ""
    @State private var responseText = ""
    @State private var isLoading = false
    @State private var buttonDisabled = false

    var body: some View {
        Text("AI Chat")
            .font(.title)
            .bold()

        VStack {
            ProgressView()
                .opacity(isLoading ? 1 : 0)
            ScrollView {
                Text(responseText)
                    .opacity(isLoading ? 0.5 : 1)
            }
        }
        .padding()

        Divider()

        VStack {
            TextField("Write a prompt...", text: $inputTextfield)
                .frame(alignment: .center)
                .padding()
                .border(Color.black)
                .padding()

            AsyncButton(buttonDisabled: buttonDisabled) {

                isLoading = true
                responseText = await service.makeRequest(prompt: inputTextfield)
                isLoading = false

            } label: {
                Text("Ask away...")
                    .frame(width: 300, height: 30, alignment: .center)
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    ChatView(service: GeminiService())
}
