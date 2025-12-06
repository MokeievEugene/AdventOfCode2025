//
//  IngredientCheckerTests.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 05.12.2025.
//

import Testing
@testable import CodeAdvent
import Foundation

struct IngredientCheckerTests {
    
    @Test func testAmountOfFreshIngredientIDS() {
        var checker = IngredientChecker(freshRanges: [1...20, 15...30], ingredientIDS: [])
        #expect(checker.amountOfFreshIngredientIDS == 30)
        
        checker = IngredientChecker(freshRanges: [1...20, 22...30], ingredientIDS: [])
        #expect(checker.amountOfFreshIngredientIDS == 29)
        
        checker = IngredientChecker(freshRanges: [1...20, 25...32, 22...30], ingredientIDS: [])
        #expect(checker.amountOfFreshIngredientIDS == 31)
        
        checker = IngredientChecker(freshRanges: [3...5, 10...14, 16...20, 12...18], ingredientIDS: [])
        #expect(checker.amountOfFreshIngredientIDS == 14)
        
        checker = IngredientChecker(freshRanges: [10...11, 11...14, 11...20, 12...18], ingredientIDS: [])
        #expect(checker.amountOfFreshIngredientIDS == 11)
        
        checker = IngredientChecker(freshRanges: [10...11, 13...15, 14...16, 11...14, 11...20, 12...18], ingredientIDS: [])
        #expect(checker.amountOfFreshIngredientIDS == 11)
    }
}
