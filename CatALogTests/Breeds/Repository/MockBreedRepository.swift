//
//  MockBreedRepository.swift
//  CatALogTests
//
//  Created by Andy Kayley on 13/03/2023.
//

import Foundation

@testable import CatALog

final class MockBreedRepository: BreedRepository {

    private var breeds: [Breed]

    init(breeds: [Breed] = Breed.allBreeds) {
        self.breeds = breeds
    }

    func allBreeds() async throws -> [Breed] {
        breeds
    }
}
