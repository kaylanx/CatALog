//
//  PreviewBreedRepository.swift
//  CatALog
//
//  Created by Andy Kayley on 14/03/2023.
//

import Foundation

final class PreviewBreedRepository: BreedRepository {
    
    func allBreeds() async throws -> [Breed] {
        Breed.allBreeds
    }
}
