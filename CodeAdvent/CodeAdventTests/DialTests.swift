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
        dial.rotate(rotation: .left, number: 68)
        #expect(dial.position == 82)
        dial.rotate(rotation: .left, number: 30)
        #expect(dial.position == 52)
        dial.rotate(rotation: .right, number: 48)
        #expect(dial.position == 0)
        dial.rotate(rotation: .left, number: 5)
        #expect(dial.position == 95)
        dial.rotate(rotation: .right, number: 60)
        #expect(dial.position == 55)
        dial.rotate(rotation: .left, number: 55)
        #expect(dial.position == 0)
    }
    
    @Test func testCrazyRotations1() {
        var dial = Dial(position: 5)
        dial.rotate(rotation: .left, number: 346)
        #expect(dial.position == 41)
        dial.rotate(rotation: .right, number: 746)
        #expect(dial.position == 87)
    }
}
