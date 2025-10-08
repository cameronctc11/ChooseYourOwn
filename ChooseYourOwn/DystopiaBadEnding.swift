//
//  DystopiaBadEnding.swift
//  ChooseYourOwn
//
//  Created by McKenzie, Cameron - Student on 10/8/25.
//

import SwiftUI

struct DystopiaBadEnding: View {
    @Binding var currentScreen: Screen
    @State private var animatedText: String = ""
    @State private var showText = false
    let fullText = "You follow the voice into the alley. Too late, you realize it was a trap. The shadows close in — mechanical drones drag you into the darkness. The city claims another soul. (BAD ENDING)"
    
    var body: some View {
        ZStack {
            Image("DystopiaBad")
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
                        .background(Color.orange.opacity(0.8))
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
                        .padding()
                        .font(.system(size: 22, weight: .medium, design: .monospaced))
                        .frame(maxWidth: .infinity)
                        .background(Color.purple.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 8)
                        .multilineTextAlignment(.center)
                        .padding()
                        .transition(.opacity)
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

struct DystopiaBadEnding_Previews: PreviewProvider {
    static var previews: some View {
        DystopiaBadEnding(currentScreen: .constant(.dystopiaBadEnding))
    }
}
