//
//  Network.swift
//  CatALog
//
//  Created by Andy Kayley on 13/03/2023.
//

import Foundation

protocol Networking {
    func data(
        from url: URL,
        delegate: URLSessionTaskDelegate?
    ) async throws -> (Data, URLResponse)

    func data(
        for request: URLRequest,
        delegate: URLSessionTaskDelegate?
    ) async throws -> (Data, URLResponse)
}

extension Networking {

    func data(from url: URL) async throws -> (Data, URLResponse) {
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue(TheCatApi.theCatApiKey, forHTTPHeaderField: "x-api-key")

        print(urlRequest.allHTTPHeaderFields ?? "No header fields")

        return try await data(for: urlRequest)
    }

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await data(for: request, delegate: nil)
    }
}

extension URLSession: Networking { }
