//
//  UUID+Pseudo.swift
//  Web
//
//  Created by Mihael Isaev on 18.11.2020.
//

import Foundation
import WebFoundation

extension UUID {
    static func new() -> UUID? {
        let letters = "ABCDEF0123456789"
        var result = ""
        for i in 0...35 {
            guard ![8, 13, 18, 23].contains(i) else {
                result.append("-")
                continue
            }
            if i == 14 {
                result.append("4")
                continue
            }
            let random = [UInt32].random(count: 1)[0]
            let rand = random % UInt32(letters.count)
            let ind = Int(rand)
            let character = letters[letters.index(letters.startIndex, offsetBy: ind)]
            result.append(character)
        }
        return UUID(uuidString: result)
    }
}
