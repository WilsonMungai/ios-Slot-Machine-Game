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
            
           
            VStack(alignment: .center, spacing: 5) {
                // MARK: -Header
                gameLogo()
                
                // MARK: - Game icons
                HStack {
                    // MARK: - Score Label
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .playerScoreLabel()
                        Text("1000")
                            .playerScore()
                            .modifier(BetAmountShadow())
                        
                    }
                    .padding(.leading)
                    Spacer()
                    
                    // MARK: - Jackpot Label
                    HStack {
                        Text("Current\nJackpot".uppercased())
                            .playerScoreLabel()
                        Text("1000")
                            .playerScore()
                            .modifier(BetAmountShadow())
                        
                    }
                    .padding(.trailing)
                }
                
                // MARK: - Slot Machine
                VStack() {
                    // MARK: - Reel 1
                    ZStack {
                        ReelView()
                        Image("bell")
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    HStack() {
                        // MARK: - Reel 2
                        ZStack {
                            ReelView()
                            Image("cherry")
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        //                        Spacer()
                        
                        // MARK: - Reel 3
                        ZStack {
                            ReelView()
                            Image("grape")
                                .resizable()
                                .scaledToFit()
                                .modifier(ImageModifier())
                        }
                        
                    }
                    .frame(maxWidth: 500)
                    
                    // MARK: - Spinner Button
                    HStack {
                        Button(action: {
                            print("Spiner button pressed")
                        }){
                            Image("spinner")
                                .renderingMode(.original)
                                .resizable()
                                .modifier(SpinnerModifier())
                        }
                    }
                    
                    Spacer ()
                    
                    // MARK: - Bet Amounts
                    // 1 dollar bet amount
                    HStack {
                        HStack {
                            Button(action: {
                                print("$1 button pressed")
                            }){
                                Text("1")
                                    .betAmountLabel()
                                    .modifier(BetAmountShadow())
                                BetCoinView()
                            }
                        }
                        .padding(.leading)
                        
                        HStack {
                            Button(action: {
                                print("$10 button pressed")
                            }){
                                Text("10")
                                    .betAmountLabel()
                                    .modifier(BetAmountShadow())
                                BetCoinView()
                            }
                        }
                        .padding(.leading)
                        
                        HStack {
                            Button(action: {
                                print("$100 button pressed")
                            }){
                                Text("100")
                                    .betAmountLabel()
                                    .modifier(BetAmountShadow())
                                BetCoinView()
                            }
                        }
                        .padding(.leading)
                    }
                    .padding()
                    
//                    .scaledToFill()
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
