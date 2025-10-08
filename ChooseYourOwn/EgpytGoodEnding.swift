//
//  EgpytGoodEnding.swift
//  ChooseYourOwn
//
//  Created by McKenzie, Cameron - Student on 10/8/25.
//

import SwiftUI
import SwiftUI

struct EgpytGoodEnding: View {
    @Binding var currentScreen: Screen
    @State private var animatedText = ""
    let fullText = "You step into the temple, the air cool and heavy with history. Ancient torches flicker to life as you walk. Suddenly, the hieroglyphs on the wall begin to glow — revealing a hidden chamber. Inside lies a golden sarcophagus filled with jewels. You’ve discovered the lost treasure of Egypt! (GOOD ENDING)"
    
    var body: some View {
        ZStack {
            Image("Temple")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                
                Text(animatedText)
                    .font(.system(size: 22, weight: .medium, design: .monospaced))
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(20)
                    .onAppear { typeWriter() }
                    .shadow(radius: 10)
                
                Spacer()
                
                Button(action: {
                    currentScreen = .home
                }) {
                    Text("Return to Main Menu")
                        .font(.system(size: 22, weight: .medium, design: .monospaced))                        .padding()
                        .frame(width: 260)
                        .background(Color.yellow.opacity(0.9))
                        .foregroundColor(.black)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                
                Spacer()
            }
            .padding()
        }
    }
    
    func typeWriter(at position: Int = 0) {
        if position < fullText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.04) {
                animatedText.append(fullText[fullText.index(fullText.startIndex, offsetBy: position)])
                typeWriter(at: position + 1)
            }
        }
    }
}

struct EgyptGoodEnding_Previews: PreviewProvider {
    static var previews: some View {
        EgpytGoodEnding(currentScreen: .constant(.egpytGoodEnding))
    }
}
