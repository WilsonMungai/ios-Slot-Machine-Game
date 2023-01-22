//
//  ContentView.swift
//  iosSlotMachineGame
//
//  Created by Wilson Mungai on 2023-01-21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Body
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(colors: [Color("black"), Color("gold")], startPoint: .top,
                           endPoint: .bottom)
            // Extend gradient outside the safe area
            .edgesIgnoringSafeArea(.all)
            
            // MARK: - Icons
            VStack(alignment: .center, spacing: 5) {
                // MARK: -Header
                gameLogo()
                Spacer()
                
                HStack {
                    // MARK: - Score
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .playerScoreLabel()
                        Text("1000")
                            .playerScore()
                            .modifier(Shadow())
                        
                    }
                        .modifier(playerScoreContainerModifier())
                    
                    Spacer()
                    
                    // MARK: - Jackpot Label
                    HStack {
                        Text("Current\nJackpot".uppercased())
                            .playerScoreLabel()
                        Text("1000")
                            .playerScore()
                            .modifier(Shadow())
                        
                    }
                        .modifier(playerScoreContainerModifier())
                }
                
                // MARK: - Slot Machine
                VStack(alignment: .center, spacing: 0) {
                    // MARK: - Reel 1
                    ZStack {
                        ReelView()
                        Image("bell")
                            .resizable()
                              .modifier(ReelImageModifier())
                        
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        // MARK: - Reel 2
                        ZStack {
                            ReelView()
                            Image("cherry")
                                .resizable()
                                .modifier(ReelImageModifier())
                        }
                        Spacer()
                        
                        // MARK: - Reel 3
                        ZStack {
                            ReelView()
                            Image("grape")
                                .resizable()
                                .scaledToFit()
                                .modifier(ReelImageModifier())
                        }
                     
                    }
                    .frame(maxWidth: 500)
                    
                    // MARK: - Spinner Button
                    ZStack {
                        Button(action: {
                            print("Spin the reel")
                        }){
                            Image("spin")
                                .renderingMode(.original)
                                .resizable()
                                .modifier(ReelImageModifier())
                        }
                    }
                }
             
            }
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
