//
//  MathProblemMatrix.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 08.12.2025.
//

struct MathProblemMatrix {
    
    let columns: [[Int]]
    let mathOperators: [String]
    
    init(rawString: String) {
        let rows = rawString.split(separator: "\n").map { String($0) }
        let matrixContent = rows.map { $0.split(separator: " ").map { String($0) } }
        let numberOfRows = rows.count - 1
        let numberOfColumns = matrixContent[0].count
        
        var filledColumns = Array(repeating: [Int](), count: numberOfColumns)
        for columnIndex in 0..<numberOfColumns {
            for rowIndex in 0..<numberOfRows {
                let number = Int(matrixContent[rowIndex][columnIndex]) ?? 0
                filledColumns[columnIndex].append(number)
            }
        }
        
        var filledMathOperators = Array(repeating: "", count: numberOfColumns)
        for columnIndex in 0..<numberOfColumns {
            let mathOperator = matrixContent[rows.count - 1][columnIndex]
            filledMathOperators[columnIndex] = mathOperator
        }
        
        self.columns = filledColumns
        self.mathOperators = filledMathOperators
    }
    
    func problemsSolutionSum(hardMathMode: Bool = false) -> Int {
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

