//
//  EuropePortal.swift
//  ChooseYourOwn
//
//  Created by McKenzie, Cameron - Student on 10/6/25.
//
import SwiftUI

struct EuropePortal: View {
    @Binding var currentScreen: Screen
    @State private var animatedText: String = ""
    
    let fullText = "You step into medieval Europe. You can either try to train as a knight in the castle or sneak into the royal treasure room."
    
    var body: some View {
        ZStack {
            
                Image("EuropeBG")
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
                
                VStack(spacing: 20) {
                    Button(action: {
                        currentScreen = .europeGoodEnding
                    }) {
                        Text("Train as a knight")
                            .multilineTextAlignment(.center)
                            .padding()
                            .font(.system(size: 18, weight: .medium, design: .monospaced))
                            .frame(maxWidth: .infinity)
                            .background(Color.red.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(radius: 8)
                            .multilineTextAlignment(.center)
                            .padding()
                            .transition(.opacity)
                    }
                    
                    Button(action: {
                        currentScreen = .europeBadEnding
                    }) {
                        Text("Sneak into the treasure room")
                            .multilineTextAlignment(.center)
                            .padding()
                            .font(.system(size: 18, weight: .medium, design: .monospaced))
                            .frame(maxWidth: .infinity)
                            .background(Color.red.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(radius: 8)
                            .multilineTextAlignment(.center)
                            .padding()
                            .transition(.opacity)
                    }
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

struct EuropePortal_Previews: PreviewProvider {
    static var previews: some View {
        EuropePortal(currentScreen: .constant(.home))
    }
}
