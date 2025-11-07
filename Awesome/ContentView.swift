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
    
    var body: some View {
        VStack {
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
            Spacer()
            
            Button("Press Me!") {
                let message1 = "You Are Awesome!"
                let message2 = "You Are Great!"
                let image1 = "image1"
                let image2 = "image0"
                
                message = (message == message1 ? message2 : message1)
                
                imageName = (message == message1 ? image2 : image1)
                
//                if message == message1 {
//                    message = message2
//                    imageName = "hand.thumbsup"
//                } else {
//                    message = message1
//                    imageName = "sun.max.fill"
//                }
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
