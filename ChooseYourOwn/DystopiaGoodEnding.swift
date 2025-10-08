//
//  DystopiaGoodEnding.swift
//  ChooseYourOwn
//
//  Created by McKenzie, Cameron - Student on 10/8/25.
//

import SwiftUI

struct DystopiaGoodEnding: View {
    @Binding var currentScreen: Screen
    @State private var animatedText: String = ""
    @State private var showText = false
    let fullText = "You climb to the rooftop and see a group of survivors signaling with lights. They take you in, and together you help rebuild the broken world with hope and unity. (GOOD ENDING)"
    
    var body: some View {
        ZStack {
            Image("DystopiaGood")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack {
                    Text(animatedText)
                        .font(.system(size: 22, weight: .medium, design: .monospaced))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(15)
                        .multilineTextAlignment(.center)
                        .shadow(radius: 8)
                        .padding()
                        .opacity(showText ? 1 : 0)
                        .animation(.easeIn(duration: 1), value: showText)
                }
                
                Spacer()
                
                Button(action: {
                    currentScreen = .home
                }) {
                    Text("Restart")
                        .font(.headline)
                        .padding()
                        .frame(width: 180)
                        .background(Color.blue.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                .padding(.bottom, 80)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                showText = true
                typeWriter()
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

struct DystopiaGoodEnding_Previews: PreviewProvider {
    static var previews: some View {
        DystopiaGoodEnding(currentScreen: .constant(.dystopiaGoodEnding))
    }
}
