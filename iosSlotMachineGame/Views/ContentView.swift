/*
 
MAPD 724 Slot Machine
 
Group 10 Members
 
Nyarko, Betrand / Student Number: 301293794
Muguthi, Wilson Mungai / Student Number: 301287641
Du, Pengfei / Student Number: 301276081
 
This is a simple slot machine game that has three reel images, a spin button that changes the images in the reels. The user can see the amount of coins they have in the player coins label, and also see the jackpot amount in  the jackpot label. There are different bet amounts which the user can select. The player has the permission to reset the game which will reset everything in the game. There is also an option to quit the game.
 
 Version 1
 
 Last modified: 22/January/2023
 
 */

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
                                    .padding(.leading,2)
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
                                    .padding(.trailing, 2)
                                BetCoinView()
                            }
                        }
                        .padding(.leading)
                    }
                    .padding()
                    
//                    .scaledToFill()
                }
            }
            
            .overlay(
                Button(action:{
                    print("Reset game button pressed")
                }){
                    Image(systemName: "arrow.counterclockwise")
                }
                    .modifier(ResetbuttonModifier()),
                    alignment: .topLeading
            )
//            .padding(.leading)
            .overlay(
                Button(action:{
                    print("Leave game button pressed")
                }){
                    Image(systemName: "xmark.circle")
                }
                    .modifier(ResetbuttonModifier()),
                    alignment: .topTrailing
            )
//            .padding(.trailing)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
