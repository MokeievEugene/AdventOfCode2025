//
//  Dial.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 03.12.2025.
//

enum Rotation: String {
    case left = "L"
    case right = "R"
}

struct Dial {
    var position = 50
    
    mutating func rotate(with commandArray: [String]) -> Int {
        var numberOfZeros = 0
        commandArray.forEach { command in
            let rawRotation = String(command.prefix(1))
            guard let rotation = Rotation(rawValue: rawRotation) else {
                return
            }
            let number = Int(command.dropFirst()) ?? 0
            rotate(rotation: rotation, number: number)
            if position == 0 {
                numberOfZeros += 1
            }
        }
        return numberOfZeros
    }
    
    mutating func rotate(rotation: Rotation, number: Int) {
        switch rotation {
        case .left:
            position = position - number > 0 ? position - number : (position - number + 100) % 100
        case .right:
            position = position + number < 100 ? position + number : (position + number - 100) % 100
        }
    }
}


