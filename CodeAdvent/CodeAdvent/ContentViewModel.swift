//
//  ContentViewModel.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 03.12.2025.
//

import Foundation

struct ContentViewModel {
    
    func calculateDialPassword() -> Int {
        let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")!
        let fileContents = try? String(contentsOf: fileURL, encoding: .utf8)
        let commandArray = fileContents?.split(separator: "\n").map { String($0) } ?? []
        var dial = Dial(position: 50)
        return dial.rotate(with: commandArray)
    }
}
