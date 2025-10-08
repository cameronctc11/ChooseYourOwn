//
//  EuropeGoodEnding.swift
//  ChooseYourOwn
//
//  Created by McKenzie, Cameron - Student on 10/8/25.
//

import SwiftUI

struct EuropeGoodEnding: View {
    @Binding var currentScreen: Screen
    @State private var animatedText: String = ""
    
    let fullText = """
You train as a knight under the royal guard, proving your courage and skill.
Finally, the princess herself kneels before you, raising you as a knight.
You’ve earned your place in the castle, celebrated by all.
A hero of honor and time. (GOOD ENDING)
"""
    
    var body: some View {
        ZStack {
            Image("EuropeGoodEnding")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text(animatedText)
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(.system(size: 22, weight: .medium, design: .monospaced))
                    .frame(maxWidth: .infinity)
                    .background(Color.brown.opacity(0.8))
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

struct EuropeGoodEnding_Previews: PreviewProvider {
    static var previews: some View {
        EuropeGoodEnding(currentScreen: .constant(.home))
    }
}
