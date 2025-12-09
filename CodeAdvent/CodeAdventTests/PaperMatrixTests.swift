//
//  PaperMatrixTests.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 04.12.2025.
//

import Testing
@testable import CodeAdvent
import Foundation

struct PaperMatrixTests {
    
    @Test func testAdjacentIndices() {
        let sut = PaperMatrix(
            rawString: """
                     ..@@.@@@@.
                     @@@.@.@.@@
                     @@@@@.@.@@
                     @.@@@@..@.
                     @@.@@@@.@@
                     .@@@@@@@.@
                     .@.@.@.@@@
                     @.@@@.@@@@
                     .@@@@@@@@.
                     @.@.@@@.@.
                     """
        )
        #expect(sut.adjacentIndices(for: 0) == [1, 10, 11])
        #expect(sut.adjacentIndices(for: 1) == [0, 2, 10, 11, 12])
        #expect(sut.adjacentIndices(for: 9) == [8, 18, 19])
        #expect(sut.adjacentIndices(for: 11) == [0, 1, 2, 10, 12, 20, 21 ,22])
        #expect(sut.adjacentIndices(for: 89) == [78, 79, 88, 98, 99])
        #expect(sut.adjacentIndices(for: 98) == [87, 88, 89, 97, 99])
        #expect(sut.adjacentIndices(for: 99) == [88, 89, 98])
    }
    
    @Test func testAccessibleRolls() {
        var sut = PaperMatrix(
            rawString: """
                     ..@@.@@@@.
                     @@@.@.@.@@
                     @@@@@.@.@@
                     @.@@@@..@.
                     @@.@@@@.@@
                     .@@@@@@@.@
                     .@.@.@.@@@
                     @.@@@.@@@@
                     .@@@@@@@@.
                     @.@.@@@.@.
                     """
        )
        #expect(sut.totalAccessibleRollsOfPaper() == 13)
    }
    
    @Test func testAccessibleRolls2() {
        var sut = PaperMatrix(
            rawString: """
                     ...@@@@@@@@@@@@.@@@@@@@
                     @@@@@.@.@@@@@@@@.@@@@..
                     .@@.@.@@@@@.@.....@@.@@
                     """
        )
        #expect(sut.totalAccessibleRollsOfPaper() == 11)
    }
}
