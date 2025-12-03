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
        VStack {
            Button {
                calculatedPassword = viewModel.calculatePassword()
            } label: {
                calculatedPassword != nil ? Text("Calculated password:\( calculatedPassword ?? 0)") : Text("Calculate password")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
