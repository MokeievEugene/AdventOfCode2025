//
//  ContentViewModel.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 03.12.2025.
//

import Foundation

struct ContentViewModel {
    
    func calculateDialPassword(hardMode: Bool = false) -> Int {
        guard let fileContents = loadFile(name: "commandInput", fileExtension: "txt") else { return 0 }
        let commandArray = fileContents.split(separator: "\n").map { String($0) }
        var dial = Dial(position: 50)
        return dial.rotate(with: commandArray, hardMode: hardMode)
    }
    
    func calculateInvalidIDSum(isComplexPattern: Bool = false) -> Int {
        guard var fileContents = loadFile(name: "giftProductIDs", fileExtension: "txt") else { return 0 }
        fileContents = String(fileContents.dropLast(1))
        let rangeArray = fileContents.split(separator: ",").map { String($0) }
        var invalidIDSum = 0
        rangeArray.forEach { rawRange in
            let range = IDRange(rawString: rawRange)
            invalidIDSum += range.invalidIDSum(isComplexPattern: isComplexPattern)
        }
        
        return invalidIDSum
    }
    
    func calculateTotalJoltage(joltageLimit: Int) -> Int {
        guard let fileContents = loadFile(name: "batteries", fileExtension: "txt") else { return 0 }
        let batteriesArray = fileContents.split(separator: "\n").map { String($0) }
        var totalJoltage = 0
        
        batteriesArray.forEach { bank in
            let battery = Battery(bank: bank, joltageLimit: joltageLimit)
            totalJoltage += battery.maximumJoltage
        }
        
        return totalJoltage
    }
    
    func calculateAccessibleRollsOfPaper() -> Int {
        guard let fileContents = loadFile(name: "rolls", fileExtension: "txt") else { return 0 }
        var matrix = PaperMatrix(rawString: fileContents)
        let result = matrix.totalAccessibleRollsOfPaper()
        writeOutput(content: matrix.visualizedContent)
        return result
    }
    
    func calculateRemovableRollsOfPaper() -> Int {
        guard let fileContents = loadFile(name: "rolls", fileExtension: "txt") else { return 0 }
        let matrix = PaperMatrix(rawString: fileContents)
        let cleaner = MatrixCleaner(matrix: matrix)
        return cleaner.cleanAllRemovableRollsOfPaper()
    }
    
    func calculateFreshIngredientsCount() -> Int {
        guard var fileContents = loadFile(name: "ingredientIDs", fileExtension: "txt") else { return 0 }
        fileContents = String(fileContents)
        let split = fileContents.split(separator: "\n\n")
        let rawRanges = split[0].split(separator: "\n").map { String($0) }
        let ingredientIDS = split[1].split(separator: "\n").map { Int($0) ?? 0 }
        let ranges = rawRanges
            .map { IDRange(rawString: $0) }
            .map { $0.start...$0.finish }
        let ingredientChecker = IngredientChecker(freshRanges: ranges, ingredientIDS: ingredientIDS)
        
        return ingredientChecker.amountOfFreshIngredients
    }
    
    func calculateAllFreshIngredientsIDsCount() -> Int {
        guard var fileContents = loadFile(name: "ingredientIDs", fileExtension: "txt") else { return 0 }
        fileContents = String(fileContents)
        let split = fileContents.split(separator: "\n\n")
        let rawRanges = split[0].split(separator: "\n").map { String($0) }
        let ingredientIDS = split[1].split(separator: "\n").map { Int($0) ?? 0 }
        let ranges = rawRanges
            .map { IDRange(rawString: $0) }
            .map { $0.start...$0.finish }
        let ingredientChecker = IngredientChecker(freshRanges: ranges, ingredientIDS: ingredientIDS)
        
        return ingredientChecker.amountOfFreshIngredientIDS
    }
    
    func calculateMathProblemsSolutionSum(hardMathMode: Bool = false) -> Int {
        guard var fileContents = loadFile(name: "mathProblems", fileExtension: "txt") else { return 0 }
        fileContents = String(fileContents)
        let matrix = MathProblemMatrix(rawString: fileContents, hardMathMode: hardMathMode)
        return matrix.problemsSolutionSum
    }
    
    func calculateTeleporterBeamsCount()-> Int {
        guard var fileContents = loadFile(name: "manifold", fileExtension: "txt") else { return 0 }
        fileContents = String(fileContents)
        let manifoldRayCounter = ManifoldRayCounter(rawString: fileContents)
        return manifoldRayCounter.numberOfBeamSplits
    }
    
    func calculateTeleporterTimelinesCount()-> Int {
        guard var fileContents = loadFile(name: "manifold", fileExtension: "txt") else { return 0 }
        fileContents = String(fileContents)
        let manifoldRayCounter = ManifoldRayCounter(rawString: fileContents)
        return manifoldRayCounter.numberOfTimelines
    }
    
    func calculateCircuitSizes()-> Int {
        guard var fileContents = loadFile(name: "junctionBoxes", fileExtension: "txt") else { return 0 }
        fileContents = String(fileContents)
        let circuitConnector = CircuitConnector(rawString: fileContents, numberOfConnections: 1000)
        return circuitConnector.threeLargestCircuitsMultiplied
    }
    
    // MARK: - Private
    private func loadFile(name: String, fileExtension: String) -> String? {
        let fileURL = Bundle.main.url(forResource: name, withExtension: fileExtension)!
        return try? String(contentsOf: fileURL, encoding: .utf8)
    }
    
    private func writeOutput(content: String) {
        let filename = getDocumentsDirectory().appendingPathComponent("output.txt")
        try? content.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
