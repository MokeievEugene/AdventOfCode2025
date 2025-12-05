//
//  Untitled.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 05.12.2025.
//

import Testing
@testable import CodeAdvent
import Foundation

struct ProductIDRangeTests {
    
    @Test func testRepeatingPattern() {
        let range = ProductIDRange(rawString: "95-115")
        #expect(range.invalidIDSum() == 99)
    }
    
    @Test func testComplexRepeatingPattern() {
        let range = ProductIDRange(rawString: "824824821-824824827")
        #expect(range.invalidIDSum(isComplexPattern: true) == 824824824)
    }
}

