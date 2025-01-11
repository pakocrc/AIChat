//
//  GeminiService.swift
//  AIChat
//
//  Created by Francisco Cordoba on 10/1/25.
//

import Foundation

final class GeminiService {
    private let networkManager = NetworkManager()
    private let requestBuilder = RequestBuilder()

    func makeRequest(prompt: String) async -> String {
        guard let request = requestBuilder.buildRequest(prompt: prompt) else {
            return ErrorMessages.creatingRequest.rawValue
        }

        do {
//            let data = try await dummyAsyncFunction()
            let data = try await networkManager.sendRequest(request)
            return decodeGeminiAPIResponse(data)

        } catch {
            print(ErrorMessages.executingRequest.rawValue)
            return ErrorMessages.executingRequest.rawValue
        }
    }

    private func decodeGeminiAPIResponse(_ data: Data) -> String {
        do {
            let apiResponse = try JSONDecoder().decode(GeminiAPIResponse.self, from: data)
            return apiResponse.candidates?.first?.content?.parts?.first?.text ?? ErrorMessages.emptyResponse.rawValue

        } catch let ex {

            print("\(ErrorMessages.decodeFailed.rawValue). \(ex)")
            return ErrorMessages.decodeFailed.rawValue
        }
    }

    private func dummyAsyncFunction() async -> Data {
        // Simulate some asynchronous work with a delay
        try? await Task.sleep(nanoseconds: 1_000_000) // Sleep for 1 millisecond

        let data = dummyResponse.data(using: .utf8) ?? Data()

        return data
    }
}
