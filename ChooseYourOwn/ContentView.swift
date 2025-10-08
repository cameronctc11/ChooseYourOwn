//
//  ContentView.swift
//  ChooseYourOwn
//
//  Created by McKenzie, Cameron - Student on 10/6/25.
//
import SwiftUI



enum Screen {
    case home
    case portalSelection
    case dinoPortal
    case dinoGoodEnding
    case dinoBadEnding
    case egyptPortal
    case egpytGoodEnding
    case egpytBadEnding
    case dystopiaPortal
    case dystopiaGoodEnding
    case dystopiaBadEnding
    case europePortal
    case europeGoodEnding
    case europeBadEnding
}

struct ContentView: View {
    @State private var currentScreen: Screen = .home
    @State private var animatedText: String = ""
    
    var body: some View {
        switch currentScreen {
        case .home: homeView
        case .portalSelection: PortalSelectionScreen(currentScreen: $currentScreen)
        case .dinoPortal: DinoPortal(currentScreen: $currentScreen)
        case .dinoGoodEnding: DinoGoodEnding(currentScreen: $currentScreen)
        case .dinoBadEnding: DinoBadEnding(currentScreen: $currentScreen)
        case .egyptPortal: EgyptPortal(currentScreen: $currentScreen)
        case .dystopiaPortal: DystopiaPortal(currentScreen: $currentScreen)
        case .europePortal: EuropePortal(currentScreen: $currentScreen)
        case .europeGoodEnding: EuropeGoodEnding(currentScreen: $currentScreen)
        case .europeBadEnding: EuropeBadEnding(currentScreen: $currentScreen)
        case .egpytGoodEnding: EgpytGoodEnding(currentScreen: $currentScreen)
        case .egpytBadEnding: EgpyttBadEnding(currentScreen: $currentScreen)
        case .dystopiaGoodEnding:DystopiaGoodEnding(currentScreen: $currentScreen)
        case .dystopiaBadEnding:DystopiaBadEnding(currentScreen: $currentScreen)
        }
    }
    
    var homeView: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 30) {
                Image("hourglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 200)
                
                Spacer()
                
                Text("Before Time")
                    .font(Font.custom("Menlo-BoldItalic", size: 55))
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                
                Spacer()
                
                Text(animatedText)
                    .font(Font.custom("Menlo-Italic", size: 23))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)
                    .onAppear { typeWriter() }
                
                Spacer()
                
                Button(action: {
                    animatedText = ""
                    currentScreen = .portalSelection
                }) {
                    Text("PLAY")
                        .font(.title)
                        .bold()
                        .padding()
                        .frame(width: 200)
                        .background(Color.red)
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
        let fullText = "Portals through time have appeared. Step through, make your choices, and protect the timeline!"
        if position < fullText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                animatedText.append(fullText[fullText.index(fullText.startIndex, offsetBy: position)])
                typeWriter(at: position + 1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

