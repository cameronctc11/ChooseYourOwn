//
//  EuropeBadEnding.swift
//  ChooseYourOwn
//
//  Created by McKenzie, Cameron - Student on 10/8/25.
//

import SwiftUI

struct EuropeBadEnding: View {
    @Binding var currentScreen: Screen
    @State private var animatedText: String = ""
    
    let fullText = """
You sneak through the castle’s stone halls, trying to find the royal treasure room.
But before you can grab even a single coin, guards surround you.
The clang of armor and shouts echo as you’re dragged into the dungeon below.
Maybe next time… choose your path more wisely.
"""
    
    var body: some View {
        ZStack {
            Image("EuropeBadEnding")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text(animatedText)
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(.system(size: 22, weight: .medium, design: .monospaced))
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 8)
                    .multilineTextAlignment(.center)
                    .padding()
                    .transition(.opacity)
                    .onAppear {
                        typeWriter()
                    }
                
                Spacer()
                
                Button(action: {
                    currentScreen = .home
                }) {
                    Text("Restart")
                        .padding()
                        .font(.system(size: 22, weight: .medium, design: .monospaced))
                        .frame(maxWidth: .infinity)
                        .background(Color.red.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 8)
                        .multilineTextAlignment(.center)
                        .padding()
                        .transition(.opacity)
                }
                
                Spacer()
            }
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

struct EuropeBadEnding_Previews: PreviewProvider {
    static var previews: some View {
        EuropeBadEnding(currentScreen: .constant(.home))
    }
}
