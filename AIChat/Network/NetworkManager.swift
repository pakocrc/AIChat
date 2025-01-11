//
//  NetworkManager.swift
//  AIChat
//
//  Created by Francisco Cordoba on 10/1/25.
//

import Foundation

final class NetworkManager {
    func sendRequest(_ request: URLRequest) async throws -> Data {
        let (responseData, _) = try await URLSession.shared.data(for: request)
        return responseData
    }
}
