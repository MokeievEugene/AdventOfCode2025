//
//  AreaCalculatorTests.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 11.12.2025.
//

import Testing
@testable import CodeAdvent
import Foundation

struct AreaCalculatorTests {
    
    @Test func testLargestArea() {
        let sut = AreaCalculator(
            rawString: """
                7,1
                11,1
                11,7
                9,7
                9,5
                2,5
                2,3
                7,3
                """
        )
        #expect(sut.largestArea == 50)
    }
    
    @Test func testLargestGreenArea() {
        var sut = AreaCalculator(
            rawString: """
                7,1
                11,1
                11,7
                9,7
                9,5
                2,5
                2,3
                7,3
                """
        )
        #expect(sut.largestGreenArea() == 24)
    }
}
