//
//  GeminiAPIResponse.swift
//  AIChat
//
//  Created by Francisco Cordoba on 10/1/25.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
// let geminiAPIResponse = try? JSONDecoder().decode(GeminiAPIResponse.self, from: jsonData)

// MARK: - GeminiAPIResponse
struct GeminiAPIResponse: Codable {
    let candidates: [Candidate]?
    let usageMetadata: UsageMetadata?
    let modelVersion: String?
}

// MARK: - Candidate
struct Candidate: Codable {
    let content: Content?
    let finishReason: String?
    let avgLogprobs: Double?
}

// MARK: - Content
struct Content: Codable {
    let parts: [Part]?
    let role: String?
}

// MARK: - Part
struct Part: Codable {
    let text: String?
}

// MARK: - UsageMetadata
struct UsageMetadata: Codable {
    let promptTokenCount, candidatesTokenCount, totalTokenCount: Int?
}


// MARK: - Request Example
/*
 curl "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=GEMINI_API_KEY" \
 -H 'Content-Type: application/json' \
 -X POST \
 -d '{
   "contents": [{
     "parts":[{"text": "Explain how AI works"}]
     }]
    }'
 */

// MARK: - Response Example
let dummyResponse = """
{
  "candidates": [
    {
      "content": {
            "parts": [
              {
                "text": "A galaxy is a massive, gravitationally bound system consisting of stars, stellar remnants, interstellar gas and dust, and dark matter.  Galaxies range in size from dwarfs with just a few hundred million stars to giants with one trillion stars, all orbiting a common center of mass.  Our own galaxy, the Milky Way, is a spiral galaxy.  The different types of galaxies are categorized based on their visual morphology (shape)."
              }
            ],
        "role": "model"
      },
      "finishReason": "STOP",
      "avgLogprobs": -0.09438930160697849
    }
  ],
  "usageMetadata": {
    "promptTokenCount": 5,
    "candidatesTokenCount": 87,
    "totalTokenCount": 92
  },
  "modelVersion": "gemini-1.5-flash"
}
"""
