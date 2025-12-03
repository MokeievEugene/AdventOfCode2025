//
//  ContentViewModel.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 03.12.2025.
//

import Foundation

struct ContentViewModel {
    
    func calculateDialPassword() -> Int {
        let fileURL = Bundle.main.url(forResource: "commandInput", withExtension: "txt")!
        guard let fileContents = try? String(contentsOf: fileURL, encoding: .utf8) else { return 0 }
        let commandArray = fileContents.split(separator: "\n").map { String($0) }
        var dial = Dial(position: 50)
        return dial.rotate(with: commandArray)
    }
    
    func calculateInvalidIDSum() -> Int {
        let fileURL = Bundle.main.url(forResource: "giftProductIDs", withExtension: "txt")!
        guard var fileContents = try? String(contentsOf: fileURL, encoding: .utf8) else { return 0 }
        fileContents = String(fileContents.dropLast(1))
        let rangeArray = fileContents.split(separator: ",").map { String($0) }
        var invalidIDSum = 0
        rangeArray.forEach { rawRange in
            let range = ProductIDRange(rawString: rawRange)
            invalidIDSum += range.invalidIDSum
        }
        
        return invalidIDSum
    }
}
