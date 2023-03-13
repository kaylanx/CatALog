//
//  DefaultBreedRepository.swift
//  CatALog
//
//  Created by Andy Kayley on 13/03/2023.
//

import Foundation

final class DefaultBreedRepository: BreedRepository {

    private var networking: Networking
    private var parser: BreedsParser

    init(
        networking: Networking = URLSession.shared,
        parser: BreedsParser = BreedsParser()
    ) {
        self.networking = networking
        self.parser = parser
    }

    func allBreeds() async throws -> [Breed] {
        let (data, response) = try await networking.data(from: URL.allBreedsUrl)
        // TODO: response stuff
        return try parser.parse(jsonData: data)
    }
}
