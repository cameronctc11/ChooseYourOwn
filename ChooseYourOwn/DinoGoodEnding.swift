//
//  DinoGoodEnding.swift
//  ChooseYourOwn
//
//  Created by McKenzie, Cameron - Student on 10/7/25.
//
import SwiftUI
struct DinoGoodEnding: View {
    @Binding var currentScreen: Screen
    @State private var dinoOffset: CGFloat = -300
    @State private var showText = false
    @State private var animatedText = ""
    
    let fullText = "A friendly dinosaur swoops down and carries you safely to DinoVille, a lively civilization of harmless dinosaurs and humans living in harmony. You live there happily ever after, and safe.     (GOOD ENDING)"
    
    var body: some View {
        ZStack {
            Image("DinoVille")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image("CuteDino")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .offset(x: dinoOffset, y: -40)
                    .onAppear { flyDino() }
                
                Spacer()
                
                VStack(spacing: 30) {
                    if showText {
                        Text(animatedText)
                            .font(.system(size: 22, weight: .medium, design: .monospaced))
                            .frame(maxWidth: .infinity)
                            .background(Color.green.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(radius: 8)
                            .multilineTextAlignment(.center)
                            .padding()
                            .transition(.opacity)
                    }
                    
                    Button("Restart") {
                        currentScreen = .home
                    }
                    .font(.headline)
                    .padding()
                    .frame(width: 180)
                    .background(Color.green.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                }
                .padding(.bottom, 80)
                
                Spacer()
            }
        }
    }
    
    func flyDino() {
        withAnimation(.easeInOut(duration: 3)) {
            dinoOffset = 300
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            showText = true
            typeWriter()
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

struct DinoGoodEnding_Previews: PreviewProvider {
    static var previews: some View {
        DinoGoodEnding(currentScreen: .constant(.home))
    }
}
