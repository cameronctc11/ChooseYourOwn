//
//  PortalSelectionScreen.swift
//  ChooseYourOwn
//
//  Created by McKenzie, Cameron - Student on 10/6/25.
//

import SwiftUI

struct PortalSelectionScreen: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                VStack(spacing: 50) {
                    Text("Choose a Portal")
                        .font(Font.custom("Menlo-BoldItalic", size: 40))
                        .foregroundColor(.black)
                        .shadow(radius: 5)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 40) {
                        
                        NavigationLink(destination: DinoPortal()) {
                            VStack {
                                Text("Dino Portal")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Image("DinoPortal")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .shadow(radius: 5)
                            }
                        }
                        
                        NavigationLink(destination: EuropePortal()) {
                            VStack {
                                Text("Europe Portal")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Image("EuropePortal")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .shadow(radius: 5)
                            }
                        }
                        
                        NavigationLink(destination: EgyptPortal()) {
                            VStack {
                                Text("Egypt Portal")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Image("EgyptPortal")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .shadow(radius: 5)
                            }
                        }
                        
                        NavigationLink(destination: DystopiaPortal()) {
                            VStack {
                                Text("Dystopia Portal")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Image("DystopiaPortal")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .shadow(radius: 5)
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct PortalSelectionScreen_Previews: PreviewProvider {
    static var previews: some View {
        PortalSelectionScreen()
    }
}
