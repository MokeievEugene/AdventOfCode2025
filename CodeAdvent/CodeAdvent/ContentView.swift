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
    @State var invalidIDSum: Int?
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("ADVENT OF CODING 2025")
            Button {
                dialPassword = viewModel.calculateDialPassword()
            } label: {
                HStack {
                    Text("DAY 1")
                    Spacer()
                    dialPassword != nil ? Text("Calculated password: \( dialPassword ?? 0)") : Text("Calculate password")
                }
            }
            Button {
                invalidIDSum = viewModel.calculateInvalidIDSum()
            } label: {
                HStack {
                    Text("DAY 2")
                    Spacer()
                    invalidIDSum != nil ? Text("Calculated invalid id sum: \( invalidIDSum ?? 0)") : Text("Calculate invalid id sum")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
