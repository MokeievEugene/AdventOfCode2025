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
    
    @Test func testSimpleRotations() {
        var dial = Dial(position: 50)
        let fileURL = Bundle.main.url(forResource: "testInput", withExtension: "txt")!
        let fileContents = try? String(contentsOf: fileURL, encoding: .utf8)
        let commandArray = fileContents?.split(separator: "\n").map { String($0) } ?? []
        let numberOfZeros = dial.rotate(with: commandArray)
        #expect(dial.position == 32)
        #expect(numberOfZeros == 3)
    }
    
    @Test func testCommandSetRotations1() {
        var dial = Dial(position: 5)
        dial.rotate(rotation: .left, number: 10)
        #expect(dial.position == 95)
        dial.rotate(rotation: .right, number: 5)
        #expect(dial.position == 0)
    }
    
    @Test func testCommandSetRotations2() {
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
}
