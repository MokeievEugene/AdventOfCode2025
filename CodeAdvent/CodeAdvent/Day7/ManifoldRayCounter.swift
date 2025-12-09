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
        for row in 1..<rows.count {
            let rowArray = Array(rows[row])
            for rayIndex in rayIndices {
                if rowArray[rayIndex] == "^" {
                    totalNumberOfSplits += 1
                    if rayIndex - 1 >= 0, !rayIndices.contains(rayIndex - 1) {
                        rayIndices.append(rayIndex - 1)
                    }
                    rayIndices.removeAll { $0 == rayIndex }
                    if rayIndex + 1 < rows.count, !rayIndices.contains(rayIndex + 1) {
                        rayIndices.append(rayIndex + 1)
                    }
                }
            }
        }
        return totalNumberOfSplits
    }
    
    var numberOfTimelines: Int {
        let firstRowArray = Array(rows[0])
        let startingPoint = firstRowArray.firstIndex(of: "S") ?? 0
        var endpoints = Array(repeating: 0, count: firstRowArray.count)
        endpoints[startingPoint] = 1
        for row in 1..<rows.count {
            let rowArray = Array(rows[row])
            
            // Redirect endpoints
            for index in 0..<rowArray.count {
                if rowArray[index] == "^" {
                    print("LOG: Splitting at row \(row), index: \(index)")
                    if index - 1 >= 0 {
                        endpoints[index - 1] += endpoints[index]
                        print("LOG: Incrementing at row \(row), index: \(index - 1)")
                    }
                    if index + 1 < rows.count {
                        endpoints[index + 1] += endpoints[index]
                        print("LOG: Incrementing at row \(row), index: \(index + 1)")
                    }
                }
            }
            
            // Clean dead ends
            for index in 0..<rowArray.count {
                if rowArray[index] == "^" {
                    endpoints[index] = 0
                }
            }
        }
        return endpoints.reduce(0, +)
    }
}

