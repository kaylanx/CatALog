//
//  BreedParser.swift
//  CatALog
//
//  Created by Andy Kayley on 07/03/2023.
//

import Foundation

struct BreedParser: Parser {
    func parse(jsonData: Data) throws -> Breed {
        let breed = try JSONDecoder().decode(Breed.self, from: jsonData)
        return breed
    }
}

struct BreedsParser: Parser {
    func parse(jsonData: Data) throws -> [Breed] {
        let breed = try JSONDecoder().decode([Breed].self, from: jsonData)
        return breed
    }
}