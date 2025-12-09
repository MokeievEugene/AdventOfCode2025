//
//  IDRangeTests.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 05.12.2025.
//

import Testing
@testable import CodeAdvent
import Foundation

struct IDRangeTests {
    
    @Test func testRepeatingPattern() {
        let sut = IDRange(rawString: "95-115")
        #expect(sut.invalidIDSum() == 99)
    }
    
    @Test func testComplexRepeatingPattern() {
        let sut = IDRange(rawString: "824824821-824824827")
        #expect(sut.invalidIDSum(isComplexPattern: true) == 824824824)
    }
}

