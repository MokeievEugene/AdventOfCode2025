//
//  MachineConfiguratorTests.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 15.12.2025.
//

import Testing
@testable import CodeAdvent
import Foundation

struct MachineConfiguratorTests {
    
    @Test func testMinButtonPresses() {
        let sut = MachineConfigurator(
            rawString: """
                [.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}
                [...#.] (0,2,3,4) (2,3) (0,4) (0,1,2) (1,2,3,4) {7,5,12,7,2}
                [.###.#] (0,1,2,3,4) (0,3,4) (0,1,2,4,5) (1,2) {10,11,11,5,10,5}
                """
        )
        #expect(sut.minButtonPresses == 7)
    }
}
