//
//  ContentView.swift
//  Awesome
//
//  Created by Thea Yocum on 11/6/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var oldNumber = 0
    @State private var oldMessage = 0
    @State private var oldSound = 0
    @State private var soundName = ""
    @State private var audioPlayer: AVAudioPlayer!
    @State private var soundIsOn = true
    let numberOfImages = 10
    let numberOfSounds = 6
    
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
            
            Spacer()

            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .animation(.default, value: imageName)
            
            
            Spacer()
            
            HStack {
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                    .labelsHidden()
                Spacer()
                Button("Show Message") {
                    let messages = ["You're awesome",
                                    "bellisima the genius bar is calling for you and im astonished at houw magnificient you are",
                                    "Hey there",
                                    "You're great",
                                    "fabulous? thats u",
                                    "hey gorjus"]
                    
                    //For messages
                    oldMessage = nonRepeatingRandom(lastNumber: oldMessage, upperBounds: messages.count-1)
                    message = messages[oldMessage]
                    
                    //For images
                    oldNumber = nonRepeatingRandom(lastNumber: oldNumber, upperBounds: numberOfImages-1)
                    imageName = "image\(oldNumber)"
                    
                    //For sounds
                    oldSound = nonRepeatingRandom(lastNumber: oldSound, upperBounds: numberOfSounds-1)
                    soundName = "sound\(oldSound)"
                    
                    if soundIsOn {
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                        guard let soundFile = NSDataAsset(name: soundName) else{
                            print("😡 Could not read file named \(soundName)")
                            return
                        }
                        
                        do {
                            audioPlayer = try AVAudioPlayer(data: soundFile.data)
                            audioPlayer.play()
                        } catch {
                            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
            .tint(.accentColor)
        }
        .padding()
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
        var newNumber = 0
        repeat {
            newNumber = Int.random(in: 0...upperBounds)
        } while newNumber == lastNumber
        return newNumber
    }
}

#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}
#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
