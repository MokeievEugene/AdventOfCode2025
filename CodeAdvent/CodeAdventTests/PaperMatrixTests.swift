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
        let matrix = PaperMatrix(
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
        #expect(matrix.adjacentIndices(for: 0) == [1, 10, 11])
        #expect(matrix.adjacentIndices(for: 1) == [0, 2, 10, 11, 12])
        #expect(matrix.adjacentIndices(for: 9) == [8, 18, 19])
        #expect(matrix.adjacentIndices(for: 11) == [0, 1, 2, 10, 12, 20, 21 ,22])
        #expect(matrix.adjacentIndices(for: 89) == [78, 79, 88, 98, 99])
        #expect(matrix.adjacentIndices(for: 98) == [87, 88, 89, 97, 99])
        #expect(matrix.adjacentIndices(for: 99) == [88, 89, 98])
    }
    
    @Test func testAccessibleRolls() {
        let matrix = PaperMatrix(
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
        #expect(matrix.totalAccessibleRollsOfPaper == 13)
    }
}
