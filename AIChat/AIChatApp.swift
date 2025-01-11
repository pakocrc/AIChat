//
//  AIChatApp.swift
//  AIChat
//
//  Created by Francisco Cordoba on 9/1/25.
//

import SwiftUI

@main
struct AIChatApp: App {
    let service = GeminiService()

    var body: some Scene {
        WindowGroup {
            ChatView(service: service)
        }
    }
}
