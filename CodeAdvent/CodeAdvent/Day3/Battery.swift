//
//  Battery.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 04.12.2025.
//

struct Battery {
    
    let bank: String
    let joltageLimit: Int
    
    var maximumJoltage: Int {
        let digits = bank.compactMap { Int(String($0)) }
        var joltages = [Int]()
        var currentDigits = digits
        
        for joltage in 1...joltageLimit {
            let (joltage, newCurrentDigits) = currentDigits.getNextMaxDigit(remainingDigits: joltageLimit - joltage)
            currentDigits = newCurrentDigits
            joltages.append(joltage)
        }
        return Int(joltages.map { String($0) }.joined()) ?? 0
    }
}

extension Array where Element == Int {
    
    func getNextMaxDigit(remainingDigits: Int) -> (Int, [Int]) {
        let maxScannedIndex = count - 1 - remainingDigits
        let scannedArray = Array(self[...maxScannedIndex])
        let maxDigit = scannedArray.max() ?? 0
        let index = firstIndex(of: maxDigit) ?? 0
        let newLeftIndex = index + 1
        return (maxDigit, Array(self[newLeftIndex...]))
    }
}
