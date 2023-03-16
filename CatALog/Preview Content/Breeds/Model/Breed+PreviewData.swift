//
//  Breed+PreviewData.swift
//  CatALog
//
//  Created by Andy Kayley on 14/03/2023.
//

import Foundation

extension Breed {
    static let allBreeds: [Breed] = [
        .init(
            id: "brd1",
            name: "Breed 1 Name",
            description: "Breed 1 Description",
            lifeSpan: "Breed 1 lifespan",
            wikipediaURL: nil,
            image: nil
        ),
        .init(
            id: "brd2",
            name: "Breed 2 Name",
            description: "Breed 2 Description",
            lifeSpan: "Breed 2 lifespan",
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Turkish_Van"),
            image: Image(
                id: "sxIXJax6h",
                url: URL(string: "https://cdn2.thecatapi.com/images/sxIXJax6h.jpg")!
            )
        )
    ]
}
