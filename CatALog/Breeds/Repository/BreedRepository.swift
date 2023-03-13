//
//  BreedRepository.swift
//  CatALog
//
//  Created by Andy Kayley on 11/03/2023.
//

import Foundation

protocol BreedRepository {
    func allBreeds() async throws -> [Breed]
}

