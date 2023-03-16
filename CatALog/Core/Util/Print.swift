//
//  Print.swift
//  CatALog
//
//  Created by Andy Kayley on 16/03/2023.
//

import Foundation

public func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
    Swift.print(items, separator: separator, terminator: terminator)
    #endif
}
