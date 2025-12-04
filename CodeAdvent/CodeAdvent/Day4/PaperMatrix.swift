//
//  PaperMatrix.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 04.12.2025.
//

struct PaperMatrix {
    let content: [String]
    let rowLength: Int
    
    init(rawString: String) {
        let rowsArray = rawString.split(separator: "\n").map { String($0) }
        self.content = rowsArray.joined().map { String($0) }
        self.rowLength = rowsArray[0].count
    }
    
    var totalAccessibleRollsOfPaper: Int {
        var totalAccessibleRolls = 0
        for index in 0..<content.count {
            let cellContent = content[index]
            if cellContent == "@" {
                if adjacentRollsOfPaper(for: index) < 4 {
                    totalAccessibleRolls += 1
                }
            }
        }
        return totalAccessibleRolls
    }
    
    func adjacentRollsOfPaper(for index: Int) -> Int {
        let adjacentIndices = adjacentIndices(for: index)
        var totalRolls = 0
        adjacentIndices.forEach { rollIndex in
            let cellContent = content[rollIndex]
            if cellContent == "@" {
                totalRolls += 1
            }
        }
        return totalRolls
    }
    
    func adjacentIndices(for index: Int) -> [Int] {
        var indices = [Int]()
        
        if index - rowLength >= 0 {
            let topRowIndex = index - rowLength
            let topRowBoundaries = rowBoundaries(for: topRowIndex)
            if topRowIndex - 1 >= topRowBoundaries.left {
                indices.append(topRowIndex - 1)
            }
            indices.append(topRowIndex)
            if topRowIndex + 1 <= topRowBoundaries.right {
                indices.append(topRowIndex + 1)
            }
        }
        let currentRowBoundaries = rowBoundaries(for: index)
        if index - 1 >= currentRowBoundaries.left {
            indices.append(index - 1)
        }
        if index + 1 <= currentRowBoundaries.right {
            indices.append(index + 1)
        }
        if index + rowLength <= content.count - 1 {
            let bottomRowIndex = index + rowLength
            let bottomRowBoundaries = rowBoundaries(for: bottomRowIndex)
            if bottomRowIndex - 1 >= bottomRowBoundaries.left {
                indices.append(bottomRowIndex - 1)
            }
            indices.append(bottomRowIndex)
            if bottomRowIndex + 1 <= bottomRowBoundaries.right {
                indices.append(bottomRowIndex + 1)
            }

        }
        return indices
    }
    
    func rowBoundaries(for index: Int) -> (left: Int, right: Int) {
        let row = index / rowLength
        let leftIndex = row * 10
        let rightIndex = leftIndex + 9
        return (leftIndex, rightIndex)
    }
}

