//
//  DialTests.swift
//  CodeAdventTests
//
//  Created by Eugene Mokeiev on 03.12.2025.
//

import Testing
@testable import CodeAdvent
import Foundation

struct DialTests {
    
    @Test func testCommandSetRotations() {
        var dial = Dial(position: 50)
        let fileURL = Bundle.main.url(forResource: "testCommandInput", withExtension: "txt")!
        let fileContents = try? String(contentsOf: fileURL, encoding: .utf8)
        let commandArray = fileContents?.split(separator: "\n").map { String($0) } ?? []
        let numberOfZeros = dial.rotate(with: commandArray)
        #expect(dial.position == 32)
        #expect(numberOfZeros == 3)
    }
    
    @Test func testCommandSetRotationsHard() {
        var dial = Dial(position: 50)
        let fileURL = Bundle.main.url(forResource: "testCommandInput", withExtension: "txt")!
        let fileContents = try? String(contentsOf: fileURL, encoding: .utf8)
        let commandArray = fileContents?.split(separator: "\n").map { String($0) } ?? []
        let numberOfZeros = dial.rotate(with: commandArray, hardMode: true)
        #expect(dial.position == 32)
        #expect(numberOfZeros == 6)
    }
    
    @Test func testRotations() {
        var dial = Dial(position: 50)
        dial.rotate(direction: .left, rotation: 68)
        #expect(dial.position == 82)
        dial.rotate(direction: .left, rotation: 30)
        #expect(dial.position == 52)
        dial.rotate(direction: .right, rotation: 48)
        #expect(dial.position == 0)
        dial.rotate(direction: .left, rotation: 5)
        #expect(dial.position == 95)
        dial.rotate(direction: .right, rotation: 60)
        #expect(dial.position == 55)
        dial.rotate(direction: .left, rotation: 55)
        #expect(dial.position == 0)
        dial.rotate(direction: .left, rotation: 896)
        #expect(dial.position == 4)
    }
    
    @Test func testBigRotations1() {
        var dial = Dial(position: 5)
        var numberOfZeros = dial.rotate(direction: .left, rotation: 346)
        #expect(dial.position == 59)
        #expect(numberOfZeros == 4)
        numberOfZeros = dial.rotate(direction: .right, rotation: 746)
        #expect(dial.position == 5)
        #expect(numberOfZeros == 8)
        numberOfZeros = dial.rotate(direction: .right, rotation: 45)
        #expect(dial.position == 50)
        #expect(numberOfZeros == 0)
        numberOfZeros = dial.rotate(direction: .right, rotation: 1000)
        #expect(dial.position == 50)
        #expect(numberOfZeros == 10)
    }
}
