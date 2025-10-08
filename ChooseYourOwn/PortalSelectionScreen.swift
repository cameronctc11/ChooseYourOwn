//
//  PortalSelectionScreen.swift
//  ChooseYourOwn
//
//  Created by McKenzie, Cameron - Student on 10/6/25.
//
import SwiftUI
struct PortalSelectionScreen: View {
    @Binding var currentScreen: Screen
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 50) {
                Text("Choose a Portal")
                    .font(Font.custom("Menlo-BoldItalic", size: 40))
                    .foregroundColor(.black)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 40) {
                    // Dino Portal
                    Button(action: { currentScreen = .dinoPortal }) {
                        VStack {
                            Image("DinoPortal")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                            Text("Dino Portal")
                        }
                    }
                    
                    // Europe Portal
                    Button(action: { currentScreen = .europePortal }) {
                        VStack {
                            Image("EuropePortal")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                            Text("Europe Portal")
                        }
                    }
                    
                    // Egypt Portal
                    Button(action: { currentScreen = .egyptPortal }) {
                        VStack {
                            Image("EgyptPortal")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                            Text("Egypt Portal")
                        }
                    }
                    
                    // Dystopia Portal
                    Button(action: { currentScreen = .dystopiaPortal }) {
                        VStack {
                            Image("DystopiaPortal")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                            Text("Dystopia Portal")
                        }
                    }
                }
                
                // Restart button
                Button("Restart") { currentScreen = .home }
                    .font(.headline)
                    .padding()
                    .frame(width: 180)
                    .background(Color.red.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            .padding()
        }
    }
}

struct PortalSelectionScreen_Previews: PreviewProvider {
    @State static var screen: Screen = .portalSelection
    static var previews: some View {
        PortalSelectionScreen(currentScreen: $screen)
    }
}
