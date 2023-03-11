//
//  BreedParser.swift
//  CatALog
//
//  Created by Andy Kayley on 07/03/2023.
//

import Foundation

protocol Parser {
    associatedtype T: Decodable
    func parse(json: String) throws -> T
}

struct BreedParser: Parser {
    func parse(json: String) throws -> Breed {
        // Force unwrapping is safe here as
        // String.data(using: .utf8) will never return nil
        // https://stackoverflow.com/a/65774285/3332876
        let data = json.data(using: .utf8)!
        let breed = try JSONDecoder().decode(Breed.self, from: data)
        return breed
    }
}

struct Breed: Decodable {

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case lifeSpan = "life_span"
        case wikipediaURL = "wikipedia_url"
        case image
    }

    let id: String
    let name: String
    let description: String
    let lifeSpan: String
    let wikipediaURL: URL
    var imageURL: URL {
        image.url
    }
    let image: Image

    struct Image: Decodable {
        let url: URL
    }
}
