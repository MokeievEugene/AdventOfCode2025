//
//  ManifoldRayCounter.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 09.12.2025.
//

struct ManifoldRayCounter {
    
    let rows: [String]
    
    init(rawString: String) {
        rows = rawString.split(separator: "\n").map { String($0) }
    }
    
    var numberOfBeamSplits: Int {
        var totalNumberOfSplits = 0
        let startingPoint = Array(rows[0]).firstIndex(of: "S") ?? 0
        var rayIndices: [Int] = [startingPoint]
        for rowIndex in 1..<rows.count {
            let rowArray = Array(rows[rowIndex])
            for rayIndex in rayIndices {
                if rowArray[rayIndex] == "^" {
                    totalNumberOfSplits += 1
                    rayIndices.removeAll { $0 == rayIndex }
                    if rayIndex - 1 > 0, !rayIndices.contains(rayIndex - 1) {
                        rayIndices.append(rayIndex - 1)
                    }
                    if rayIndex + 1 < rows.count, !rayIndices.contains(rayIndex + 1) {
                        rayIndices.append(rayIndex + 1)
                    }
                }
            }
        }
        return totalNumberOfSplits
    }
}

