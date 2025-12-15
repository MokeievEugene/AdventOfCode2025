//
//  MachineConfigurator.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 15.12.2025.
//

import Foundation

struct Machine {
    let lightDiagram: String
    let buttonSchematics: [String]
}

struct MachineConfigurator {
    
    let machines: [Machine]
    
    init(rawString: String) {
        let stringsArray = rawString.split(separator: "\n").map { String($0) }
        let machinesArray = stringsArray.map { machineString in
            let components = machineString.split(separator: " ").map { String($0) }
            let lightDiagram = components[0]
                .replacingOccurrences(of: "[", with: "")
                .replacingOccurrences(of: "]", with: "")
            var buttonSchematics = [String]()
            for index in 1..<components.count - 1 {
                let schematic = components[index]
                    .replacingOccurrences(of: "(", with: "")
                    .replacingOccurrences(of: ")", with: "")
                buttonSchematics.append(schematic)
            }
            return Machine(lightDiagram: lightDiagram, buttonSchematics: buttonSchematics)
        }
        self.machines = machinesArray
    }
    
    var minButtonPresses: Int {
        machines.reduce(0) { $0 + minPressesToActivate(for: $1) }
    }
    
    private func minPressesToActivate(for machine: Machine) -> Int {
        0
    }
}

