//
//  AreaCalculator.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 11.12.2025.
//

struct Point: Equatable {
    let x: Int
    let y: Int
}

enum Edge {
    case left
    case right
    case bottom
    case top
}

struct AreaCalculator {
    let coordinates: [Point]
    var greenPoints: [Point]
    let minY: Int
    let maxY: Int
    let minX: Int
    let maxX: Int
    
    init(rawString: String) {
        let stringsArray = rawString.split(separator: "\n")
        let coordinatesArray = stringsArray.map { $0.split(separator: ",").map { String($0) } }.map { Point(x: Int($0[0]) ?? 0, y: Int($0[1]) ?? 0) }
        self.coordinates = coordinatesArray
        self.greenPoints = coordinates
        self.minX = coordinates.map { $0.x }.min() ?? 0
        self.maxX = coordinates.map { $0.x }.max() ?? 0
        self.minY = coordinates.map { $0.y }.min() ?? 0
        self.maxY = coordinates.map { $0.y }.max() ?? 0
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
    
    mutating func largestGreenArea() -> Int {
        print("LOG: Add edge green points...")
        populateEdgeGreenPoints()
        var maximumGreenArea = 0
        for index1 in 0..<coordinates.count {
            for index2 in index1+1..<coordinates.count {
                print("LOG: Checking pair \(index1), \(index2) of count \(coordinates.count)...")
                let area = area(coordinate1: coordinates[index1], coordinate2: coordinates[index2])
                if area > maximumGreenArea && isAreaGreen(coordinate1: coordinates[index1], coordinate2: coordinates[index2]) {
                    maximumGreenArea = max(maximumGreenArea, area)
                }
            }
        }
        return maximumGreenArea
    }
    
    private mutating func isAreaGreen(coordinate1: Point, coordinate2: Point) -> Bool {
        let cornerPoint1 = Point(x: coordinate1.x, y: coordinate2.y)
        let cornerPoint2 = Point(x: coordinate2.x, y: coordinate1.y)
        
        for point in [cornerPoint1, cornerPoint2] {
            if greenPoints.contains(point) {
                continue
            } else {
                var edges = [Edge]()
                if point.x == max(coordinate1.x, coordinate2.x) {
                    edges.append(.right)
                } else {
                    edges.append(.left)
                }
                if point.y == max(coordinate1.y, coordinate2.y) {
                    edges.append(.bottom)
                } else {
                    edges.append(.top)
                }
                if !isInternalGreenPoint(coordinate: point, edges: edges) {
                    return false
                }
            }
        }
        return true
    }
    
    private mutating func populateEdgeGreenPoints() {
        for index1 in 0..<coordinates.count {
            let index2 = {
                if index1 < coordinates.count - 1 {
                    return index1 + 1
                } else {
                    return 0
                }
            }()
            let point1 = coordinates[index1]
            let point2 = coordinates[index2]
            
            if point1.x == point2.x {
                let minY = min(point1.y, point2.y)
                let maxY = max(point1.y, point2.y)
                for yCordinate in minY+1..<maxY {
                    greenPoints.append(Point(x: point1.x, y: yCordinate))
                }
            }
            if point1.y == point2.y {
                let minX = min(point1.x, point2.x)
                let maxX = max(point1.x, point2.x)
                for xCoordinate in minX+1..<maxX {
                    greenPoints.append(Point(x: xCoordinate, y: point1.y))
                }
            }
        }
    }
    
    mutating func isInternalGreenPoint(coordinate: Point, edges: [Edge]) -> Bool {
        if edges.contains(.left) {
            guard greenPoints.contains(where: { point in
                point.y == coordinate.y && (minX...coordinate.x).contains(point.x)
            }) else {
                return false
            }
        }
        if edges.contains(.right) {
            guard greenPoints.contains(where: { point in
                point.y == coordinate.y && (coordinate.x...maxX).contains(point.x)
            }) else {
                return false
            }
        }
        if edges.contains(.top) {
            guard greenPoints.contains(where: { point in
                point.x == coordinate.x && (minY...coordinate.y).contains(point.y)
            }) else {
                return false
            }
        }
        if edges.contains(.bottom) {
            guard greenPoints.contains(where: { point in
                point.x == coordinate.x && (coordinate.y...maxY).contains(point.y)
            }) else {
                return false
            }
        }
        greenPoints.append(coordinate)
        return true
    }
    
    private func area(coordinate1: Point, coordinate2: Point) -> Int {
        return (abs(coordinate1.x - coordinate2.x) + 1) * (abs(coordinate1.y - coordinate2.y) + 1)
    }
}

