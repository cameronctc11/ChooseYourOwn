//
//  DinoBadEnding.swift
//  ChooseYourOwn
//
//  Created by McKenzie, Cameron - Student on 10/7/25.
//

import SwiftUI

struct DinoBadEnding: View {
    @Binding var currentScreen: Screen
    @State private var animatedText = ""
    let fullText = "You wander into the thick jungle, hoping to find a way out... but the ground shakes. A massive T-Rex roars and everything fades to black. You never made it out.                     (BAD ENDING)"
    
    var body: some View {
        ZStack {
            Image("DinoJungleBad")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text(animatedText)
                    .font(.system(size: 22, weight: .medium, design: .monospaced))
                    .frame(maxWidth: .infinity)
                    .background(Color.red.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 8)
                    .multilineTextAlignment(.center)
                    .padding()
                    .onAppear {
                        typeWriter()
                    }
                
                Spacer()
                
                Button(action: {
                    currentScreen = .home
                }) {
                    Text("Restart")
                        .font(.headline)
                        .padding()
                        .frame(width: 180)
                        .background(Color.red.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                .padding(.bottom, 60)
            }
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

struct DinoBadEnding_Previews: PreviewProvider {
    @State static var screen: Screen = .dinoBadEnding
    static var previews: some View {
        DinoBadEnding(currentScreen: $screen)
    }
}

