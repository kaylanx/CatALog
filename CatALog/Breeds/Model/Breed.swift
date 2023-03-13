//
//  Breed.swift
//  CatALog
//
//  Created by Andy Kayley on 11/03/2023.
//

import Foundation

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
    let wikipediaURL: URL?
    let image: Image?

    var imageURL: URL? {
        image?.url
    }

    struct Image: Decodable {
        let url: URL
    }
}
