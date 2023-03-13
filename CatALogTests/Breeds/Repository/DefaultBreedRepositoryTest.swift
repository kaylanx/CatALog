//
//  DefaultBreedRepositoryTest.swift
//  CatALogTests
//
//  Created by Andy Kayley on 13/03/2023.
//

import XCTest

@testable import CatALog

final class DefaultBreedRepositoryTest: XCTestCase {

    func test_WhenAllBreedsRequested_ThenAllBreedsReturned() async throws {

        let allBreedsJsonFileURL = try XCTUnwrap(
            Bundle(for: DefaultBreedRepositoryTest.self)
                .url(forResource: "all-breeds", withExtension: "json"))

        let fileContents = try String(contentsOf: allBreedsJsonFileURL)

        let mockNetworking = MockNetworking()
        let data = try XCTUnwrap(fileContents.data(using: .utf8))
        mockNetworking.result = Result<Data, Error>.success(data)

        let defaultBreedRepository: BreedRepository = DefaultBreedRepository(networking: mockNetworking)
        let allBreeds = try await defaultBreedRepository.allBreeds()

        XCTAssertEqual(67, allBreeds.count)
    }
}

