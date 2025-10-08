//
//  DinoPortal.swift
//  ChooseYourOwn
//
//  Created by McKenzie, Cameron - Student on 10/6/25.
//

        import SwiftUI
        
struct DinoPortal: View {
    @Binding var currentScreen: Screen
    
    var body: some View {
        ZStack {
            Image("DinoBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Color.green.opacity(0.2).ignoresSafeArea()
            
            VStack(spacing: 40) {
                
                Text("The portal has taken you to prehistoric times. You end up in a damp foggy jungle, screeches in the background. What do you do?")

                    .multilineTextAlignment(.center)
                    .padding()
                    .font(.system(size: 22, weight: .medium, design: .monospaced))
                    .frame(maxWidth: .infinity)
                    .background(Color.green.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 8)
                    .multilineTextAlignment(.center)
                    .padding()
                    .transition(.opacity)
                
                Button("Go explore jungle and try to find a way out") {
                    currentScreen = .dinoBadEnding
                }
                
                .padding()
                .font(.system(size: 18, weight: .medium, design: .monospaced))
                .frame(width: 350)
                .background(Color.green.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(15)
                
                Button("Explore a noise you just heard") {
                    currentScreen = .dinoGoodEnding
                }
                .padding()
                .font(.system(size: 18, weight: .medium, design: .monospaced))
                .frame(width: 350)
                .background(Color.green.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(15)
                
                Button("Restart") { currentScreen = .home }
                    .padding()
                    .frame(width: 180)
                    .background(Color.gray.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            .padding()
        }
    }
}
struct DinoPortal_Previews: PreviewProvider {
    @State static var screen: Screen = .dinoPortal
    static var previews: some View {
        DinoPortal(currentScreen: $screen)
    }
}
