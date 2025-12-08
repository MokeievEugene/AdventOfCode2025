//
//  MathProblemMatrix.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 08.12.2025.
//

import Foundation
struct MathProblemMatrix {
    
    let columns: [[Int]]
    let mathOperators: [String]
    
    init(columns: [[Int]], mathOperators: [String]) {
        self.columns = columns
        self.mathOperators = mathOperators
    }
    
    init(rawString: String, hardMathMode: Bool = false) {
        let rows = rawString.split(separator: "\n").map { String($0) }
        let numberOfRows = rows.count - 1

        // Extract math operators
        let lastRow = rows[rows.count - 1]
        let rowContent = lastRow.split(separator: " ").map { String($0) }
        let numberOfColumns = rowContent.count
        var filledMathOperators = Array(repeating: "", count: numberOfColumns)
        for columnIndex in 0..<numberOfColumns {
            let mathOperator = rowContent[columnIndex]
            filledMathOperators[columnIndex] = mathOperator
        }
        self.mathOperators = filledMathOperators
        
        // Extract column indexes
        var columnIndexes = [Int]()
        let lastRowArray = Array(lastRow).map { String($0) }
        for index in 0..<lastRow.count {
            if lastRowArray[index] != " " {
                columnIndexes.append(index)
            }
        }
        columnIndexes.append(lastRowArray.count)
        
        // Extract matrix content
        var matrixContent = Array(repeating: [String](), count: numberOfColumns)
        for rowIndex in 0..<numberOfRows {
            let rowContent = rows[rowIndex]
            for index in 1..<columnIndexes.count {
                let previousColumnIndex = columnIndexes[index - 1]
                let columnIndex = index == columnIndexes.count - 1 ? columnIndexes[index] : columnIndexes[index] - 1
                let startStringIndex = rowContent.index(rowContent.startIndex, offsetBy: previousColumnIndex)
                let endStringIndex = rowContent.index(rowContent.startIndex, offsetBy: columnIndex)
                let rowPortion = rowContent[startStringIndex..<endStringIndex]
                matrixContent[index - 1].append(String(rowPortion))
            }
        }
                
        var filledColumns = Array(repeating: [Int](), count: numberOfColumns)
        if hardMathMode {
            for columnIndex in 0..<numberOfColumns {
                let content = matrixContent[columnIndex]
                let contentLength = content[0].count
                for innerColumnIndex in (0..<contentLength).reversed() {
                    var stringNumber = ""
                    for rowIndex in 0..<numberOfRows {
                        let stringArray = Array(content[rowIndex])
                        stringNumber += String(stringArray[innerColumnIndex])
                    }
                    let trimmedNumber = stringNumber.trimmingCharacters(in: .whitespaces)
                    filledColumns[columnIndex].append(Int(trimmedNumber) ?? 0)
                }
            }
        } else {
            for columnIndex in 0..<numberOfColumns {
                for rowIndex in 0..<numberOfRows {
                    let number = Int(matrixContent[rowIndex][columnIndex]) ?? 0
                    filledColumns[columnIndex].append(number)
                }
            }
        }
        self.columns = filledColumns
    }
    
    var problemsSolutionSum: Int {
        var totalProblemsSolutionSum = 0
        for columnIndex in 0..<columns.count {
            let mathOperator = mathOperators[columnIndex]
            let numbers = columns[columnIndex]
            totalProblemsSolutionSum += performOperation(mathOperator: mathOperator, numbers: numbers)
        }
        
        return totalProblemsSolutionSum
    }
    
    private func performOperation(mathOperator: String, numbers: [Int]) -> Int {
        switch mathOperator {
        case "+":
            return numbers.reduce(0) { partialResult, total in
                total + partialResult
            }
        case "*":
            return numbers.reduce(1) { partialResult, total in
                total * partialResult
            }
        default:
            return 0
        }
    }
}

