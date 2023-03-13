//
//  BreedViewModel.swift
//  CatALog
//
//  Created by Andy Kayley on 13/03/2023.
//

import Foundation

final class BreedViewModel: ObservableObject {

    @Published var breeds: [Breed] = []

    private let repository: BreedRepository

    init(
        repository: BreedRepository = DefaultBreedRepository()
    ) {
        self.repository = repository
    }

    func fetchAllBreeds() async throws {
        breeds = try await repository.allBreeds()
    }
}
