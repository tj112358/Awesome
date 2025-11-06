//
//  ContentView.swift
//  Awesome
//
//  Created by Thea Yocum on 11/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "Skibidi Sigma"
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
            HStack {
                Button("Awesome") {
                    message = "Awesome!"
                }
                Button("Great") {
                    message = "Great!"
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
