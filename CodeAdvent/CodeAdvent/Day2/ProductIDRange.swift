//
//  ProductIDRange.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 03.12.2025.
//

struct ProductIDRange {
    let start: Int
    let finish: Int
    
    init(rawString: String) {
        let components = rawString.split(separator: "-")
        start = Int(components[0]) ?? 0
        finish = Int(components[1]) ?? 0
    }
    
    var invalidIDSum: Int {
        var result = 0
        for id in start...finish {
            let stringID = String(id)
            if stringID.count % 2 == 0 {
                let firstString = String(stringID.prefix(stringID.count / 2))
                let secondString = String(stringID.suffix(stringID.count / 2))
                if firstString == secondString {
                    result += id
                }
            }
        }
        return result
    }
}

