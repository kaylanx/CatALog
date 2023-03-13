//
//  Parser.swift
//  CatALog
//
//  Created by Andy Kayley on 11/03/2023.
//

import Foundation

protocol Parser {
    associatedtype T: Decodable
    func parse(jsonData: Data) throws -> T
}
