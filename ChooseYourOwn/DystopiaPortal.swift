//
//  DystopiaPortal.swift
//  ChooseYourOwn
//
//  Created by McKenzie, Cameron - Student on 10/6/25.
//
import SwiftUI

struct DystopiaPortal: View {
    @Binding var currentScreen: Screen
    
    var body: some View {
        ZStack {
            Image("Dystopia1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 25) {
                Text("The air smells of metal and smoke. Neon lights flicker through the fog. You hear a faint voice calling for help nearby.")
                    .multilineTextAlignment(.center)
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
                
                Spacer()
                
                VStack(spacing: 20) {
                    Button(action: {
                        currentScreen = .dystopiaBadEnding
                    }) {
                        Text("Follow the voice into the alley")
                            .multilineTextAlignment(.center)
                            .padding()
                            .font(.system(size: 22, weight: .medium, design: .monospaced))
                            .frame(maxWidth: .infinity)
                            .background(Color.orange.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(radius: 8)
                            .multilineTextAlignment(.center)
                            .padding()
                            .transition(.opacity)
                    }
                    
                    Button(action: {
                        currentScreen = .dystopiaGoodEnding
                    }) {
                        Text("Climb to the rooftop for a better view")
                            .multilineTextAlignment(.center)
                            .padding()
                            .font(.system(size: 22, weight: .medium, design: .monospaced))
                            .frame(maxWidth: .infinity)
                            .background(Color.orange.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(radius: 8)
                            .multilineTextAlignment(.center)
                            .padding()
                            .transition(.opacity)
                    }
                    
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
                }
                .padding(.bottom, 60)
            }
            .padding(.top, 100)
        }
    }
}

struct DystopiaPortal_Previews: PreviewProvider {
    static var previews: some View {
        DystopiaPortal(currentScreen: .constant(.dystopiaPortal))
    }
}
