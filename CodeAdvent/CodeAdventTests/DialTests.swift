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
        var sut = Dial(position: 50)
        let fileURL = Bundle.main.url(forResource: "testCommandInput", withExtension: "txt")!
        let fileContents = try? String(contentsOf: fileURL, encoding: .utf8)
        let commandArray = fileContents?.split(separator: "\n").map { String($0) } ?? []
        let numberOfZeros = sut.rotate(with: commandArray)
        #expect(sut.position == 32)
        #expect(numberOfZeros == 3)
    }
    
    @Test func testCommandSetRotationsHard() {
        var sut = Dial(position: 50)
        let fileURL = Bundle.main.url(forResource: "testCommandInput", withExtension: "txt")!
        let fileContents = try? String(contentsOf: fileURL, encoding: .utf8)
        let commandArray = fileContents?.split(separator: "\n").map { String($0) } ?? []
        let numberOfZeros = sut.rotate(with: commandArray, hardMode: true)
        #expect(sut.position == 32)
        #expect(numberOfZeros == 6)
    }
    
    @Test func testRotations() {
        var sut = Dial(position: 50)
        sut.rotate(direction: .left, rotation: 68)
        #expect(sut.position == 82)
        sut.rotate(direction: .left, rotation: 30)
        #expect(sut.position == 52)
        sut.rotate(direction: .right, rotation: 48)
        #expect(sut.position == 0)
        sut.rotate(direction: .left, rotation: 5)
        #expect(sut.position == 95)
        sut.rotate(direction: .right, rotation: 60)
        #expect(sut.position == 55)
        sut.rotate(direction: .left, rotation: 55)
        #expect(sut.position == 0)
        sut.rotate(direction: .left, rotation: 896)
        #expect(sut.position == 4)
    }
    
    @Test func testBigRotations1() {
        var sut = Dial(position: 5)
        var numberOfZeros = sut.rotate(direction: .left, rotation: 346)
        #expect(sut.position == 59)
        #expect(numberOfZeros == 4)
        numberOfZeros = sut.rotate(direction: .right, rotation: 746)
        #expect(sut.position == 5)
        #expect(numberOfZeros == 8)
        numberOfZeros = sut.rotate(direction: .right, rotation: 45)
        #expect(sut.position == 50)
        #expect(numberOfZeros == 0)
        numberOfZeros = sut.rotate(direction: .right, rotation: 1000)
        #expect(sut.position == 50)
        #expect(numberOfZeros == 10)
    }
}
