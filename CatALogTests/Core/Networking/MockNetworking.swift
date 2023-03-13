//
//  MockNetworking.swift
//  CatALogTests
//
//  Created by Andy Kayley on 13/03/2023.
//

import Foundation

@testable import CatALog

final class MockNetworking: Networking {

    var result = Result<Data, Error>.success(Data())

    func data(
        from url: URL,
        delegate: URLSessionTaskDelegate?
    ) async throws -> (Data, URLResponse) {
        try (result.get(), URLResponse())
    }
}
