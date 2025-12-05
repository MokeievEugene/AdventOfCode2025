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
    
    func invalidIDSum(isComplexPattern: Bool = false) -> Int {
        var result = 0
        for id in start...finish {
            let stringID = String(id)
            if isComplexPattern {
                if stringID.hasRepeatingComplexPattern {
                    result += id
                }
            } else {
                if stringID.hasRepeatingPattern {
                    result += id
                }
            }
        }
        return result
    }
}

extension String {
    
    var hasRepeatingPattern: Bool {
        guard let regex = try? Regex("^(.+)(?:\\1){1}$") else { return false }
        return ranges(of: regex).count > 0
    }
    
    var hasRepeatingComplexPattern: Bool {
        guard let regex = try? Regex("^(.+)(?:\\1)+$") else { return false }
        return ranges(of: regex).count > 0
    }
}

