//
//  BreedParserTest.swift
//  CatALogTests
//
//  Created by Andy Kayley on 07/03/2023.
//

import XCTest

@testable import CatALog

final class BreedParserTest: XCTestCase {

    func test_WhenJsonNotInCorrectFormat_ThenDecodingErrorThrown() {
        let parser = BreedParser()
        XCTAssertThrowsError(try parser.parse(json: "{}")) { error in
            guard case DecodingError.keyNotFound = error else {
                XCTFail("Error should be DecodingError.keyNotFound not \(error)")
                return
            }
        }
    }

    func test_WhenAbyssinianBreedReturned_ThenJsonConvertedToStructCorrectly() throws {
        let parser = BreedParser()
        let abyssinianBreed = try parser.parse(json: abyssinianBreedJson)

        XCTAssertEqual("abys", abyssinianBreed.id)
        XCTAssertEqual("Abyssinian", abyssinianBreed.name)
        XCTAssertEqual("The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", abyssinianBreed.description)
        XCTAssertEqual("14 - 15", abyssinianBreed.lifeSpan)
        XCTAssertEqual(URL(string: "https://en.wikipedia.org/wiki/Abyssinian_(cat)"), abyssinianBreed.wikipediaURL)
        XCTAssertEqual(URL(string: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"), abyssinianBreed.imageURL)

    }

    private let abyssinianBreedJson = """
        {
            "weight": {
                "imperial": "7  -  10",
                "metric": "3 - 5"
            },
            "id": "abys",
            "name": "Abyssinian",
            "cfa_url": "http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx",
            "vetstreet_url": "http://www.vetstreet.com/cats/abyssinian",
            "vcahospitals_url": "https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian",
            "temperament": "Active, Energetic, Independent, Intelligent, Gentle",
            "origin": "Egypt",
            "country_codes": "EG",
            "country_code": "EG",
            "description": "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
            "life_span": "14 - 15",
            "indoor": 0,
            "lap": 1,
            "alt_names": "",
            "adaptability": 5,
            "affection_level": 5,
            "child_friendly": 3,
            "dog_friendly": 4,
            "energy_level": 5,
            "grooming": 1,
            "health_issues": 2,
            "intelligence": 5,
            "shedding_level": 2,
            "social_needs": 5,
            "stranger_friendly": 5,
            "vocalisation": 1,
            "experimental": 0,
            "hairless": 0,
            "natural": 1,
            "rare": 0,
            "rex": 0,
            "suppressed_tail": 0,
            "short_legs": 0,
            "wikipedia_url": "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
            "hypoallergenic": 0,
            "reference_image_id": "0XYvRd7oD",
            "image": {
                "id": "0XYvRd7oD",
                "width": 1204,
                "height": 1445,
                "url": "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"
            }
        }
    """
}
