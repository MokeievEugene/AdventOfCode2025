//
//  AreaCalculator.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 11.12.2025.
//

struct Point {
    let x: Int
    let y: Int
}

struct AreaCalculator {
    let coordinates: [Point]
    
    init(rawString: String) {
        let stringsArray = rawString.split(separator: "\n")
        let coordinatesArray = stringsArray.map { $0.split(separator: ",").map { String($0) } }.map { Point(x: Int($0[0]) ?? 0, y: Int($0[1]) ?? 0) }
        self.coordinates = coordinatesArray
    }
    
    var largestArea: Int {
        var maximumArea = 0
        for index1 in 0..<coordinates.count {
            for index2 in index1+1..<coordinates.count {
                let area = area(coordinate1: coordinates[index1], coordinate2: coordinates[index2])
                maximumArea = max(maximumArea, area)
            }
        }
        return maximumArea
    }
    
    private func area(coordinate1: Point, coordinate2: Point) -> Int {
        return (abs(coordinate1.x - coordinate2.x) + 1) * (abs(coordinate1.y - coordinate2.y) + 1)
    }
}

