//
//  ContentView.swift
//  CodeAdvent
//
//  Created by Eugene Mokeiev on 03.12.2025.
//

import SwiftUI

struct ContentView: View {
    let viewModel = ContentViewModel()
    @State var calculatedPassword: Int?
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("ADVENT OF CODING 2025")
            Button {
                calculatedPassword = viewModel.calculateDialPassword()
            } label: {
                HStack {
                    Text("DAY 1")
                    Spacer()
                    calculatedPassword != nil ? Text("Calculated password: \( calculatedPassword ?? 0)") : Text("Calculate password")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
