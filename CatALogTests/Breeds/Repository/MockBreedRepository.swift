//
//  MockBreedRepository.swift
//  CatALogTests
//
//  Created by Andy Kayley on 13/03/2023.
//

import Foundation

@testable import CatALog

enum MockError: Error {
    case repositoryError
}

final class MockBreedRepository: BreedRepository {

    private var breeds: [Breed]
    var error: Error?

    init(breeds: [Breed] = Breed.allBreeds) {
        self.breeds = breeds
    }

    func allBreeds() async throws -> [Breed] {
        if let error {
            throw error
        }
        return breeds
    }
}
