//
//  Dial.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 03.12.2025.
//

enum Direction: String {
    case left = "L"
    case right = "R"
}

struct Dial {
    var position = 50
    
    mutating func rotate(with commandArray: [String], hardMode: Bool = false) -> Int {
        var totalNumberOfZeroClicks = 0
        var totalNumberOfZeroStops = 0
        commandArray.forEach { command in
            let rawDirection = String(command.prefix(1))
            guard let direction = Direction(rawValue: rawDirection) else { return }
            let rotation = Int(command.dropFirst()) ?? 0
            let numberOfZeroClicks = rotate(direction: direction, rotation: rotation)
            totalNumberOfZeroClicks += numberOfZeroClicks
            if position == 0 {
                totalNumberOfZeroStops += 1
            }
        }
        return hardMode ? totalNumberOfZeroClicks: totalNumberOfZeroStops
    }
    
    @discardableResult
    mutating func rotate(direction: Direction, rotation: Int) -> Int {
        var numberOfZeroClicks = rotation / 100
        let adjustedRotation = rotation % 100
        print("LOG position \(position), direction:\(direction.rawValue), rotation: \(rotation)")
        switch direction {
        case .left:
            let newPosition = position - adjustedRotation
            if newPosition > 0 {
                position = newPosition
            } else {
                if position != 0 {
                    numberOfZeroClicks += 1
                }
                position = (newPosition + 100) % 100
            }
        case .right:
            let newPosition = position + adjustedRotation
            if newPosition < 100 {
                position = newPosition
            } else {
                if position != 0 {
                    numberOfZeroClicks += 1
                }
                position = (newPosition - 100) % 100
            }
        }
        print("LOG new Position: \(position), clicks: \(numberOfZeroClicks)")
        return numberOfZeroClicks
    }
}


