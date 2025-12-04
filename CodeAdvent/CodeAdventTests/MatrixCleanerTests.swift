//
//  MatrixCleanerTests.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 04.12.2025.
//

import Testing
@testable import CodeAdvent
import Foundation

struct MatrixCleanerTests {
    @Test func testCleaningMatrix() {
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
        let cleaner = MatrixCleaner(matrix: matrix)
        #expect(cleaner.cleanAllRemovableRollsOfPaper() == 43)
    }
}
