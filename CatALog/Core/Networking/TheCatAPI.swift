//
//  TheCatAPI.swift
//  CatALog
//
//  Created by Andy Kayley on 13/03/2023.
//

import Foundation

enum TheCatApi {

    // Force unwrapping here because it's a developer error if the string isn't
    // an actual url.
    static let allBreedsUrl = URL(string: "https://api.thecatapi.com/v1/breeds")!

    static var theCatApiKey: String {
        guard let apiKey = Bundle.main.infoDictionary?["THE_CAT_API_KEY"] as? String,
              apiKey.isEmpty == false else {
            fatalError("Ensure THE_CAT_API_KEY is configured in Config.xcconfig")
        }
        print("apiKey=\(apiKey)")
        return apiKey
    }
}
