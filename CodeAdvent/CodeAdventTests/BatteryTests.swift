//
//  BatteryTests.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 04.12.2025.
//

import Testing
@testable import CodeAdvent
import Foundation

struct BatteryTests {
    
    @Test func testBatteriesLimit2() {
        let battery1 = Battery(bank: "987654321111111", joltageLimit: 2)
        #expect(battery1.maximumJoltage == 98)
        let battery2 = Battery(bank: "811111111111119", joltageLimit: 2)
        #expect(battery2.maximumJoltage == 89)
        let battery3 = Battery(bank: "234234234234278", joltageLimit: 2)
        #expect(battery3.maximumJoltage == 78)
        let battery4 = Battery(bank: "818181911112111", joltageLimit: 2)
        #expect(battery4.maximumJoltage == 92)
    }
    
    @Test func testBatteriesLimit12() {
        let battery1 = Battery(bank: "987654321111111", joltageLimit: 12)
        #expect(battery1.maximumJoltage == 987654321111)
        let battery2 = Battery(bank: "811111111111119", joltageLimit: 12)
        #expect(battery2.maximumJoltage == 811111111119)
        let battery3 = Battery(bank: "234234234234278", joltageLimit: 12)
        #expect(battery3.maximumJoltage == 434234234278)
        let battery4 = Battery(bank: "818181911112111", joltageLimit: 12)
        #expect(battery4.maximumJoltage == 888911112111)
    }
}
