//
//  ContentView.swift
//  ChooseYourOwn
//
//  Created by McKenzie, Cameron - Student on 10/6/25.
//
import SwiftUI

struct ContentView: View {
    @State private var animatedText: String = ""
    let fullText = "Portals through time have appeared. Step through, make your choices, and protect the timeline!"
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
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
                    .onAppear {
                        typeWriter()
                    }
                Spacer()

                NavigationLink(destination: PortalSelectionScreen()) {
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
        NavigationStack {
            ContentView()
        }
    }
}
