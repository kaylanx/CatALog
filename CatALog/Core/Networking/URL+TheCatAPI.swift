//
//  URL+TheCatAPI.swift
//  CatALog
//
//  Created by Andy Kayley on 13/03/2023.
//

import Foundation

extension URL {

    // Force unwrapping here because it's a developer error if the string isn't
    // an actual url.
    static let allBreedsUrl = URL(string: "https://api.thecatapi.com/v1/breeds?api_key=\(theCatApiKey)")!

    static var theCatApiKey: String {
        Bundle.main.infoDictionary?["THE_CAT_API_KEY"] as? String ?? ""
    }
}
