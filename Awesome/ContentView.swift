//
//  ContentView.swift
//  Awesome
//
//  Created by Thea Yocum on 11/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var messageNumber = 0
    @State private var imageName = ""
    @State private var imageNumber = 0
    
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
                
                message = messages[messageNumber]
                messageNumber += 1
                if messageNumber == messages.count {
                    messageNumber = 0
                }
                
//                let message1 = "You Are Awesome!"
//                let message2 = "You Are Great!"
//                message = (message == message1 ? message2 : message1)
                
                imageName = "image\(imageNumber)"

                imageNumber += 1
                
                if imageNumber > 9 {
                    imageNumber = 0
                }
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
