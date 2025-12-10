//
//  CircuitConnector.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 10.12.2025.
//

import Foundation

class Circuit: Equatable, Comparable {
    var connectedBoxes: [JunctionBox]
    
    init(connectedBoxes: [JunctionBox]) {
        self.connectedBoxes = connectedBoxes
    }
    
    func addBox(_ box: JunctionBox){
        connectedBoxes.append(box)
    }
    
    func removeBox(_ box: JunctionBox){
        connectedBoxes.removeAll { $0 == box }
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

struct JunctionBoxesPair: Hashable {
    let box1: JunctionBox
    let box2: JunctionBox
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
        let circuits: [Circuit] = junctionBoxes.map { Circuit(connectedBoxes: [$0]) }
        
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
                if firstBoxCircuit >= secondBoxCircuit {
                    firstBoxCircuit.addBox(box2)
                    secondBoxCircuit.removeBox(box2)
                    print("LOG: added \(box2) to the circuit of \(box1)")
                } else if secondBoxCircuit >= firstBoxCircuit {
                    secondBoxCircuit.addBox(box1)
                    firstBoxCircuit.removeBox(box1)
                    print("LOG: added \(box1) to the circuit of \(box2)")
                }
                allowedConnections -= 1
                print("LOG: connections remaining: \(allowedConnections)")
            } else {
                print("LOG: boxes \(box1) and \(box2) in the same circuit")
            }
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

