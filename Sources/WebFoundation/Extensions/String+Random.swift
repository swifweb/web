//
//  String+Random.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 15.11.2020.
//

import Foundation

extension String {
    public static func shuffledAlphabet(_ length: Int, letters: String? = nil) -> String {
        let letters = letters ?? "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString = ""
        for _ in 0...length-1 {
            let random = [UInt32].random(count: 1)[0]
            let rand = random % UInt32(letters.count)
            let ind = Int(rand)
            let character = letters[letters.index(letters.startIndex, offsetBy: ind)]
            randomString.append(character)
        }
        return randomString
    }
}
