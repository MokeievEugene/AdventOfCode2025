//
//  IngredientChecker.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 05.12.2025.
//

struct IngredientChecker {
    
    let freshRanges: [ClosedRange<Int>]
    let ingredientIDS: [Int]

    var amountOfFreshIngredients: Int {
        var totalFreshProducts = 0
        ingredientIDS.forEach { id in
            if isFreshID(id) {
                totalFreshProducts += 1
            }
        }
        return totalFreshProducts
    }
    
    var amountOfFreshIngredientIDS: Int {
        var sortedRanges = freshRanges.sorted { $0.lowerBound < $1.lowerBound }
        var totalFreshIDs = sortedRanges[0].count
        
        sortedRanges = sortedRanges.filter({ range in
            for otherRange in sortedRanges {
                if otherRange != range, otherRange.contains(range) {
                    print("LOG: range \(range) filtered")
                    return false
                }
            }
            return true
        })
        
        guard sortedRanges.count > 1 else {
            return totalFreshIDs
        }
        
        for index in 1..<sortedRanges.count {
            let previousRange = sortedRanges[index - 1]
            let nextRange = sortedRanges[index]
            if !nextRange.overlaps(previousRange) {
                totalFreshIDs += nextRange.count
                print("LOG: no overlap on previous range \(previousRange), add items from range \(nextRange)")
            } else {
                let overlap = nextRange.clamped(to: previousRange)
                totalFreshIDs += nextRange.count
                totalFreshIDs -= overlap.count
                print("LOG: overlap on \(previousRange), add items from range \(nextRange): \(nextRange.count - overlap.count)")
            }
        }
        return totalFreshIDs
    }
    
    private func isFreshID(_ id: Int) -> Bool {
        for range in freshRanges {
            if range.contains(id) {
                return true
            }
        }
        return false
    }
}

extension ClosedRange where Bound: Comparable {
    func contains(_ otherRange: ClosedRange<Bound>) -> Bool {
        return self.lowerBound <= otherRange.lowerBound && self.upperBound >= otherRange.upperBound
    }
}
