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
    
    // Array of images shown in reel
    let images = ["bell", "cherry", "coin", "grape", "strawberry", "seven"]
    
    // MARK: - Variables
    // Array of reel images
    @State private var reelImage: Array = [0,1,2]
    //  Number of coins player has
    @State private var playerCoins: Int = 100
    // Payer highscore
    @State private var playerHighScore: Int = 0
    // Player's bet amout
    @State private var betAmount: Int = 1

    // MARK: - Functions
    // Spin reels and get random images according to index
    func spinReels() {
        reelImage[0] = Int.random(in: 0...images.count - 1)
        reelImage[1] = Int.random(in: 0...images.count - 1)
        reelImage[2] = Int.random(in: 0...images.count - 1)
        
        print(reelImage)
    }
    
    
    // MARK: - Body
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(colors: [Color("black"), Color("gold")], startPoint: .top,
                           endPoint: .bottom)
            // Extend gradient outside the safe area
            .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 5) {
                // MARK: - Game logo
                gameLogo()
                
                // MARK: - Game coins and jackpot
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
                        // Get the at index image and show at the reel index
                        Image(images[reelImage[0]])
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    HStack() {
                        // MARK: - Reel 2
                        ZStack {
                            ReelView()
                            // Get the at index image and show at the reel index
                            Image(images[reelImage[1]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        //                        Spacer()
                        
                        // MARK: - Reel 3
                        ZStack {
                            ReelView()
                            // Get the at index image and show at the reel index
                            Image(images[reelImage[2]])
                                .resizable()
                                .scaledToFit()
                                .modifier(ImageModifier())
                        }
                    }
                    .frame(maxWidth: 500)
                    
                    // MARK: - Spinner Button
                    HStack {
                        Button(action: {
                            spinReels()
                            print("Spiner button pressed")
                        }){
                            Image("spinner")
                                .renderingMode(.original)
                                .resizable()
                                .modifier(SpinnerModifier())
                        }
                    }
                }
                .layoutPriority(2)
                    
                    Spacer ()
                    
                    // MARK: - Bet Amount Buttons
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
                    
                    .scaledToFit()
                }
//                .layoutPriority(2)
//            }
            
            // MARK: - Overlay Cancel/Quit Buttons
            .overlay(
                Button(action:{
                    print("Reset game button pressed")
                }){
                    Image(systemName: "arrow.counterclockwise")
                }
                    .modifier(ResetbuttonModifier()),
                    alignment: .topLeading
            )
//            .padding()
            .overlay(
                Button(action:{
                    print("Leave game button pressed")
                }){
                    Image(systemName: "xmark.circle")
                }
                    .modifier(ResetbuttonModifier()),
                    alignment: .topTrailing
            )
//            .padding(.trailing, 5)
        }
    }
    
    // MARK: - Preview
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
