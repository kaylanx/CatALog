//
//  BreedsViewModelTest.swift
//  CatALogTests
//
//  Created by Andy Kayley on 13/03/2023.
//

import XCTest

@testable import CatALog

final class BreedViewModelTest: XCTestCase {

    func test_WhenVMFetchesBreeds_ThenAllBreedsReturned() async throws {

        let viewModel = BreedViewModel(
            repository: MockBreedRepository()
        )

        try await viewModel.fetchAllBreeds()
        XCTAssertEqual(2, viewModel.breeds.count)
    }
}
