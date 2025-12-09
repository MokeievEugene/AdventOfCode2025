//
//  MathProblemMatrixTests.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 08.12.2025.
//

import Testing
@testable import CodeAdvent
import Foundation

struct MathProblemMatrixTests {
    
    @Test func testProblemsSolutionSum() {
        let sut = MathProblemMatrix(columns: [[123, 45, 6], [328, 64, 98], [51, 387, 215], [64, 23, 314]], mathOperators: ["*", "+", "*", "+"])
        #expect(sut.problemsSolutionSum == 4277556)
    }
    
    @Test func testProblemsSolutionSumHardMode() {
        let sut = MathProblemMatrix(
            rawString: """
                123 328  51 64 
                 45 64  387 23 
                  6 98  215 314
                *   +   *   +  
                """,
            hardMathMode: true
        )
        #expect(sut.problemsSolutionSum == 3263827)
    }
}
