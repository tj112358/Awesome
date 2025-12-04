//
//  ContentView.swift
//  Awesome
//
//  Created by Thea Yocum on 11/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var oldNumber = 0
    @State private var oldMessage = ""
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)

            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .animation(.default, value: imageName)
            
            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You're awesome",
                                "bellisima the genius bar is calling for you and im astonished at houw magnificient you are",
                                "Hey there",
                                "You're great",
                                "fabulous? thats u",
                                "hey gorjus"]
                
                var newMessage = ""
                repeat {
                    newMessage = messages.randomElement() ?? "Error: message not found"
                } while newMessage == oldMessage
                
                message = newMessage
                oldMessage = newMessage
                
                var newNumber = 0
                repeat {
                    newNumber = Int.random(in: 0...9)
                } while newNumber == oldNumber
                
                imageName = "image\(newNumber)"
                oldNumber = newNumber
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.pink)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
