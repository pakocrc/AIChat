//
//  RequestBuilder.swift
//  AIChat
//
//  Created by Francisco Cordoba on 10/1/25.
//

import Foundation

final class RequestBuilder {
    private let apiKey = "AIzaSyCbMy3FafRKAfZ8CqgPdhucVdY2_CGYD1s"
    private let baseUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent"

    func buildRequest(prompt: String) -> URLRequest? {
        guard let url = URL(string: "\(baseUrl)?key=\(apiKey)") else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "contents": [
                "parts": [
                    "text": prompt
                ]
            ]
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
            return nil
        }

        request.httpBody = jsonData
        return request
    }
}
