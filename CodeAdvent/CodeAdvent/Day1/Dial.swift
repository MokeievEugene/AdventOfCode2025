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
    
    mutating func rotate(with commandArray: [String], hardMode: Bool = false) -> Int {
        var totalNumberOfZeros = 0
        var totalNumberOfZeroStops = 0
        commandArray.forEach { command in
            let rawRotation = String(command.prefix(1))
            guard let rotation = Rotation(rawValue: rawRotation) else { return }
            let number = Int(command.dropFirst()) ?? 0
            let numberOfZeroClicks = rotate(rotation: rotation, number: number)
            totalNumberOfZeros += numberOfZeroClicks
            if position == 0 {
                totalNumberOfZeroStops += 1
            }
        }
        return hardMode ? totalNumberOfZeros: totalNumberOfZeroStops
    }
    
    @discardableResult
    mutating func rotate(rotation: Rotation, number: Int) -> Int {
        var numberOfZeroClicks = 0
        switch rotation {
        case .left:
            let newPosition = position - number
            if newPosition > 0 {
                position = newPosition
            } else {
                if position != 0 {
                    numberOfZeroClicks = max(1, abs(newPosition + 100) / 100)
                }
                print("position \(position), rotation left: \(number), clicks: \(numberOfZeroClicks)")
                position = abs(newPosition + 100) % 100
            }
        case .right:
            let newPosition = position + number
            if newPosition < 100 {
                position = newPosition
            } else {
                if position != 0 {
                    numberOfZeroClicks = max(1, abs(newPosition - 100) / 100)
                }
                print("position \(position), rotation right: \(number), clicks: \(numberOfZeroClicks)")
                position = abs(newPosition - 100) % 100
            }
        }
        return numberOfZeroClicks
    }
}


