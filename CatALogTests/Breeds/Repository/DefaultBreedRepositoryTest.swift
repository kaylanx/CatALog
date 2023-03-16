//
//  DefaultBreedRepositoryTest.swift
//  CatALogTests
//
//  Created by Andy Kayley on 13/03/2023.
//

import XCTest

@testable import CatALog

final class DefaultBreedRepositoryTest: XCTestCase {

    private var allBreedsJsonData: Data = Data()

    override func setUpWithError() throws {
        let allBreedsJsonFileURL = try XCTUnwrap(
            Bundle(for: DefaultBreedRepositoryTest.self)
                .url(forResource: "all-breeds", withExtension: "json"))

        let allBreedsJson = try String(contentsOf: allBreedsJsonFileURL)
        allBreedsJsonData = try XCTUnwrap(allBreedsJson.data(using: .utf8))
    }

    func test_WhenAllBreedsRequested_ThenAllBreedsReturned() async throws {

        let mockNetworking = MockNetworking()
        mockNetworking.result = Result<Data, Error>.success(allBreedsJsonData)

        let defaultBreedRepository: BreedRepository = DefaultBreedRepository(networking: mockNetworking)
        let allBreeds = try await defaultBreedRepository.allBreeds()

        XCTAssertEqual(67, allBreeds.count)

        let firstBreed = try XCTUnwrap(allBreeds.first)
        XCTAssertEqual(firstBreed.id, "abys")
        XCTAssertEqual(firstBreed.name, "Abyssinian")
        XCTAssertEqual(firstBreed.description, "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.")
        XCTAssertEqual(firstBreed.lifeSpan, "14 - 15")

        let expectedWikipediaURL = try XCTUnwrap(URL(string: "https://en.wikipedia.org/wiki/Abyssinian_(cat)"))
        XCTAssertEqual(firstBreed.wikipediaURL, expectedWikipediaURL)

        let expectedImageURL = try XCTUnwrap(URL(string: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"))
        XCTAssertEqual(firstBreed.imageURL, expectedImageURL)

    }
}

