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
        var sut = IngredientChecker(freshRanges: [1...20, 15...30], ingredientIDS: [])
        #expect(sut.amountOfFreshIngredientIDS == 30)
        
        sut = IngredientChecker(freshRanges: [1...20, 22...30], ingredientIDS: [])
        #expect(sut.amountOfFreshIngredientIDS == 29)
        
        sut = IngredientChecker(freshRanges: [1...20, 25...32, 22...30], ingredientIDS: [])
        #expect(sut.amountOfFreshIngredientIDS == 31)
        
        sut = IngredientChecker(freshRanges: [3...5, 10...14, 16...20, 12...18], ingredientIDS: [])
        #expect(sut.amountOfFreshIngredientIDS == 14)
        
        sut = IngredientChecker(freshRanges: [10...11, 11...14, 11...20, 12...18], ingredientIDS: [])
        #expect(sut.amountOfFreshIngredientIDS == 11)
        
        sut = IngredientChecker(freshRanges: [10...11, 13...15, 14...16, 11...14, 11...20, 12...18], ingredientIDS: [])
        #expect(sut.amountOfFreshIngredientIDS == 11)
    }
}
