//
//  BreedViewModel.swift
//  CatALog
//
//  Created by Andy Kayley on 13/03/2023.
//

import Foundation

enum LoadingState {
    case pending
    case loading
    case error(Error)
    case complete(breeds: [Breed])
}

final class BreedViewModel: ObservableObject {

    @Published var loadingState = LoadingState.pending

    private let repository: BreedRepository

    init(
        repository: BreedRepository = DefaultBreedRepository()
    ) {
        self.repository = repository
    }

    @MainActor func fetchAllBreeds() async {
        do {
            loadingState = .loading
            let breeds = try await repository.allBreeds()
            loadingState = .complete(breeds: breeds)
        } catch {
            loadingState = .error(error)
        }
    }
}
