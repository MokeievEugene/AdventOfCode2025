//
//  MatrixCleaner.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 04.12.2025.
//

struct MatrixCleaner {
    
    let matrix: PaperMatrix
    
    func cleanAllRemovableRollsOfPaper() -> Int {
        var totalCleanedRolls = 0
        var currentMatrix = matrix
        var hasRollsToClean = true
        
        while hasRollsToClean {
            let (cleanedMatrix, cleanedRolls) = cleanRemovableRollsOfPaper(from: currentMatrix)
            currentMatrix = cleanedMatrix
            totalCleanedRolls += cleanedRolls
            hasRollsToClean = cleanedRolls > 0
        }
        
        return totalCleanedRolls
    }
    
    private func cleanRemovableRollsOfPaper(from matrix: PaperMatrix) -> (PaperMatrix, Int) {
        var resultMatrixContent = matrix.content
        var totalCleanedRolls = 0
        for index in 0..<matrix.content.count {
            let cellContent = matrix.content[index]
            if cellContent == "@", matrix.adjacentRollsOfPaper(for: index) < 4 {
                resultMatrixContent[index] = "."
                totalCleanedRolls += 1
            }
        }
        let resultMatrix = PaperMatrix(content: resultMatrixContent, rowLength: matrix.rowLength)
        return (resultMatrix, totalCleanedRolls)
    }
}

