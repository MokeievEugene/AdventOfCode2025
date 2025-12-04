//
//  ContentViewModel.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 03.12.2025.
//

import Foundation

struct ContentViewModel {
    
    func calculateDialPassword() -> Int {
        guard let fileContents = loadFile(name: "commandInput", fileExtension: "txt") else { return 0 }
        let commandArray = fileContents.split(separator: "\n").map { String($0) }
        var dial = Dial(position: 50)
        return dial.rotate(with: commandArray)
    }
    
    func calculateInvalidIDSum() -> Int {
        guard var fileContents = loadFile(name: "giftProductIDs", fileExtension: "txt") else { return 0 }
        fileContents = String(fileContents.dropLast(1))
        let rangeArray = fileContents.split(separator: ",").map { String($0) }
        var invalidIDSum = 0
        rangeArray.forEach { rawRange in
            let range = ProductIDRange(rawString: rawRange)
            invalidIDSum += range.invalidIDSum
        }
        
        return invalidIDSum
    }
    
    func calculateTotalJoltageMax2() -> Int {
        guard let fileContents = loadFile(name: "batteries", fileExtension: "txt") else { return 0 }
        let batteriesArray = fileContents.split(separator: "\n").map { String($0) }
        var totalJoltage = 0
        
        batteriesArray.forEach { bank in
            let battery = Battery(bank: bank, joltageLimit: 2)
            totalJoltage += battery.maximumJoltage
        }
        
        return totalJoltage
    }
    
    func calculateTotalJoltageMax12() -> Int {
        guard let fileContents = loadFile(name: "batteries", fileExtension: "txt") else { return 0 }
        let batteriesArray = fileContents.split(separator: "\n").map { String($0) }
        var totalJoltage = 0
        
        batteriesArray.forEach { bank in
            let battery = Battery(bank: bank, joltageLimit: 12)
            totalJoltage += battery.maximumJoltage
        }
        
        return totalJoltage
    }
    
    func calculateAccessibleRollsOfPaper() -> Int {
        guard let fileContents = loadFile(name: "rolls", fileExtension: "txt") else { return 0 }
        let matrix = PaperMatrix(rawString: fileContents)
        return matrix.totalAccessibleRollsOfPaper
    }
    
    // MARK: - Private
    private func loadFile(name: String, fileExtension: String) -> String? {
        let fileURL = Bundle.main.url(forResource: name, withExtension: fileExtension)!
        return try? String(contentsOf: fileURL, encoding: .utf8)
    }
}
