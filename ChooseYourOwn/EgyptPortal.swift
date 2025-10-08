//
//  EgyptPortal.swift
//  ChooseYourOwn
//
//  Created by McKenzie, Cameron - Student on 10/6/25.
//
import SwiftUI
import SwiftUI

struct EgyptPortal: View {
    @Binding var currentScreen: Screen
    @State private var animatedText: String = ""
    
    let fullText = "You step through the portal and find yourself in Ancient Egypt — the sun blazes above and pyramids rise in the distance. You must decide your next move carefully."
    
    var body: some View {
        ZStack {
            Image("EgyptBackground")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Spacer()
                
                Text(animatedText)
                    .font(.system(size: 22, weight: .medium, design: .monospaced))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.yellow.opacity(0.6))
                    .cornerRadius(15)
                    .onAppear { typeWriter() }
                    .shadow(radius: 8)
                
                Spacer()
                
                VStack(spacing: 25) {
                    Button(action: {
                        currentScreen = .egpytGoodEnding
                    }) {
                        Text("Approach the pyramid — maybe treasure awaits.")
                            .padding()
                            .font(.system(size: 18, weight: .medium, design: .monospaced))
                            .frame(width: 350)
                            .background(Color.teal.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    
                    Button(action: {
                        currentScreen = .egpytBadEnding
                    }) {
                        Text("Follow the shadowy figure disappearing into the dunes.")
                            .padding()
                            .font(.system(size: 18, weight: .medium, design: .monospaced))
                            .frame(width: 350)
                            .background(Color.teal.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
    
    func typeWriter(at position: Int = 0) {
        if position < fullText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                animatedText.append(fullText[fullText.index(fullText.startIndex, offsetBy: position)])
                typeWriter(at: position + 1)
            }
        }
    }
}

struct EgyptPortal_Previews: PreviewProvider {
    static var previews: some View {
        EgyptPortal(currentScreen: .constant(.egyptPortal))
    }
}

