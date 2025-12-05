//
//  ContentView.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 03.12.2025.
//

import SwiftUI

struct ContentView: View {
    let viewModel = ContentViewModel()
    @State var dialPassword: Int?
    @State var dialHardPassword: Int?
    @State var invalidIDSum: Int?
    @State var complexInvalidIDSum: Int?
    @State var totalJoltageMax2: Int?
    @State var totalJoltageMax12: Int?
    @State var accessibleRollsOfPaper: Int?
    @State var removableRollsOfPaper: Int?
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("🎅 ADVENT OF CODING 2025 🎄")
                .foregroundStyle(.green)
            dayView(
                dayNumber: 1,
                partNumber: 1,
                valueName: "dial password",
                value: dialPassword
            ) {
                dialPassword = viewModel.calculateDialPassword()
            }
            dayView(
                dayNumber: 1,
                partNumber: 2,
                valueName: "dial hard password",
                value: dialHardPassword
            ) {
                dialHardPassword = viewModel.calculateDialHardPassword()
            }
            dayView(
                dayNumber: 2,
                partNumber: 1,
                valueName: "invalid id sum",
                value: invalidIDSum
            ) {
                invalidIDSum = viewModel.calculateInvalidIDSum()
            }
            dayView(
                dayNumber: 2,
                partNumber: 2,
                valueName: "invalid id sum",
                value: complexInvalidIDSum
            ) {
                complexInvalidIDSum = viewModel.calculateComplexInvalidIDSum()
            }
            dayView(
                dayNumber: 3,
                partNumber: 1,
                valueName: "total joltage",
                value: totalJoltageMax2
            ) {
                totalJoltageMax2 = viewModel.calculateTotalJoltageMax2()
            }
            dayView(
                dayNumber: 3,
                partNumber: 2,
                valueName: "total joltage",
                value: totalJoltageMax12
            ) {
                totalJoltageMax12 = viewModel.calculateTotalJoltageMax12()
            }
            dayView(
                dayNumber: 4,
                partNumber: 1,
                valueName: "accessible rolls of paper",
                value: accessibleRollsOfPaper
            ) {
                accessibleRollsOfPaper = viewModel.calculateAccessibleRollsOfPaper()
            }
            dayView(
                dayNumber: 4,
                partNumber: 2,
                valueName: "removable rolls of paper",
                value: removableRollsOfPaper
            ) {
                removableRollsOfPaper = viewModel.calculateRemovableRollsOfPaper()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
    
    private func dayView(
        dayNumber: Int,
        partNumber: Int? = nil,
        valueName: String,
        value: Int?,
        action: @escaping () -> Void
    ) -> some View {
        VStack {
            HStack(spacing: 0) {
                Text("DAY \(dayNumber)")
                if let partNumber {
                    Text(", PART \(partNumber)")
                }
            }
            .foregroundStyle(.red)
            Button {
                action()
            } label: {
                Text("Calculate \(valueName)")
            }
            HStack(spacing: 0) {
                Text("Result: ")
                if value != nil {
                    Text("\(value ?? 0)")
                        .textSelection(.enabled)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
