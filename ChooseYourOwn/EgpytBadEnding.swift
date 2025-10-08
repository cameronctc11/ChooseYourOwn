//
//  EgpytBadEnding.swift
//  ChooseYourOwn
//
//  Created by McKenzie, Cameron - Student on 10/8/25.
//

import SwiftUI

import SwiftUI

struct EgpyttBadEnding: View {
    @Binding var currentScreen: Screen
    @State private var animatedText = ""
    let fullText = "You enter the temple’s dark hallway, the air thick with dust and silence. As you take another step, the ground shifts beneath you — a trap! The floor crumbles away and you fall into an ancient pit filled with sand and bones. The hieroglyphs above glow faintly as the portal begins to close... your adventure ends here."
    
    var body: some View {
        ZStack {
            Image("BadEnding")
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
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(20)
                    .onAppear { typeWriter() }
                    .shadow(radius: 10)
                
                Spacer()
                
                Button(action: {
                    currentScreen = .home
                }) {
                    Text("Try Again")
                        .font(.system(size: 22, weight: .medium, design: .monospaced))                        .padding()
                        .frame(width: 260)
                        .background(Color.red.opacity(0.85))
                        .foregroundColor(.white)
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

struct EgyptBadEnding_Previews: PreviewProvider {
    static var previews: some View {
        EgpyttBadEnding(currentScreen:.constant(.egpytBadEnding))
    }
}
