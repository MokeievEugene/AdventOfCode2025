//
//  CircuitConnector.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 10.12.2025.
//

import Foundation

class Circuit: Equatable, Comparable, CustomStringConvertible {
    
    var connectedBoxes: [JunctionBox]
    
    init(connectedBoxes: [JunctionBox]) {
        self.connectedBoxes = connectedBoxes
    }
    
    func merge(_ otherCircuit: Circuit){
        connectedBoxes.append(contentsOf: otherCircuit.connectedBoxes)
        let uniqueBoxes = Set(connectedBoxes)
        connectedBoxes = Array(uniqueBoxes)
    }
    
    var description: String {
        connectedBoxes.reduce(into: "") { $0 = $0 + " Box " + String($1.coordinates.map {String($0)}.joined(separator: ",")) }
    }
    
    static func == (lhs: Circuit, rhs: Circuit) -> Bool {
        lhs.connectedBoxes == rhs.connectedBoxes
    }
    
    static func < (lhs: Circuit, rhs: Circuit) -> Bool {
        lhs.connectedBoxes.count < rhs.connectedBoxes.count
    }
}

struct JunctionBox: Hashable {
    let coordinates: [Int]
}

struct JunctionBoxesPair: Equatable, Hashable {
    let box1: JunctionBox
    let box2: JunctionBox
    
    static func == (lhs: JunctionBoxesPair, rhs: JunctionBoxesPair) -> Bool {
        lhs.box1 == rhs.box1 && lhs.box2 == rhs.box2 ||
        lhs.box1 == rhs.box2 && lhs.box2 == rhs.box1
    }
}

struct CircuitConnector {
    
    let junctionBoxes: [JunctionBox]
    let numberOfConnections: Int
    
    init(rawString: String, numberOfConnections: Int) {
        self.numberOfConnections = numberOfConnections
        let stringsArray = rawString.split(separator: "\n")
        let coordinatesArray = stringsArray.map { $0.split(separator: ",").map { Int($0) ?? 0 } }
        junctionBoxes = coordinatesArray.map { JunctionBox(coordinates: $0) }
    }
    
    var threeLargestCircuitsMultiplied: Int {
        let distancesMap = populateDistances()
        var sortedDictionaries = distancesMap.sorted { $0.value < $1.value }
        var circuits: [Circuit] = junctionBoxes.map { Circuit(connectedBoxes: [$0]) }
        
        var allowedConnections = numberOfConnections
        
        while allowedConnections > 0 {
            let nextDictionary = sortedDictionaries.first
            sortedDictionaries.removeAll { $0.key == nextDictionary?.key }
            
            guard let box1 = nextDictionary?.key.box1,
                  let box2 = nextDictionary?.key.box2 else {
                continue
            }
            
            guard let firstBoxCircuit = circuits.first(where: { $0.connectedBoxes.contains(box1) }),
                  let secondBoxCircuit = circuits.first(where: { $0.connectedBoxes.contains(box2) }) else {
                continue
            }
            
            if firstBoxCircuit != secondBoxCircuit {
                print("LOG: merged \(firstBoxCircuit) with the circuit \(secondBoxCircuit)")
                firstBoxCircuit.merge(secondBoxCircuit)
                circuits.removeAll { $0 == secondBoxCircuit }
                print("LOG: connections remaining: \(allowedConnections)")
            } else {
                print("LOG: boxes \(box1) and \(box2) are in the same circuit")
            }
            allowedConnections -= 1
        }
        
        let firstThreeSortedCircuits = circuits.sorted().suffix(3)
        let multiplication = firstThreeSortedCircuits
            .map { $0.connectedBoxes.count }
            .reduce(1, *)
        return multiplication
    }
    
    private func populateDistances() -> [JunctionBoxesPair: Double] {
        var map: [JunctionBoxesPair: Double] = [:]
        for index1 in 0..<junctionBoxes.count {
            for index2 in index1+1..<junctionBoxes.count {
                let box1 = junctionBoxes[index1]
                let box2 = junctionBoxes[index2]
                if map[JunctionBoxesPair(box1: box1, box2: box2)] == nil {
                    map[JunctionBoxesPair(box1: box1, box2: box2)] = distance(box1: box1, box2: box2)
                }
            }
        }
        return map
    }
    
    private func distance(box1: JunctionBox, box2: JunctionBox) -> Double {
        let dx = box1.coordinates[0] - box2.coordinates[0]
        let dy = box1.coordinates[1] - box2.coordinates[1]
        let dz = box1.coordinates[2] - box2.coordinates[2]
        let distanceSquared = dx * dx + dy * dy + dz * dz
        return sqrt(Double(distanceSquared))
    }
}

