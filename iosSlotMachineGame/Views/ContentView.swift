/*
 
 MAPD 724 Slot Machine
 
 Group 10 Members
 
 Nyarko, Betrand / Student Number: 301293794
 Muguthi, Wilson Mungai / Student Number: 301287641
 Du, Pengfei / Student Number: 301276081
 
 This is a simple slot machine game that has three reel images, a spin button that changes the images in the reels. The user can see the amount of coins they have in the player coins label, and also see the jackpot amount in  the jackpot label. There are different bet amounts which the user can select. The player has the permission to reset the game which will reset everything in the game. There is also an option to quit the game.
 
 Version 2
 
 Last modified: 5/February/2023
 
 */

import SwiftUI

struct ContentView: View {
    
    // Array of images shown in reel
    let images = ["bell", "cherry", "grape", "coin", "strawberry", "seven"]
    
    // MARK: - Variables
    // Array of reel images
    @State private var reelImage: Array = [0,1,2]
    //  Number of coins player has
    @State private var playerCoins: Int = 1000
    // Payer highscore
    // player high score is determined by the amount of coins they have won. So the game starts at 1000 high score the same as the amount of coins but it will increase if the player wins more than 1,000
    @State private var playerHighScore: Int = 1000
    // Player's bet amout
    // Game starts off at bet amount 10
    @State private var betAmount: Int = 0
    
    // Get the selected bet amount
    @State private var selecteBetAmout1: Bool = false
    @State private var selecteBetAmout10: Bool = false
    @State private var selecteBetAmout100: Bool = false
    
    @State private var spinButton: Bool = false
    
    @State private var popUp: Bool = false
    
    // MARK: - Methods
    // Spin reels and get random images according to index
    func spinReels() {
        reelImage[0] = Int.random(in: 0...images.count - 1)
        reelImage[1] = Int.random(in: 0...images.count - 1)
        reelImage[2] = Int.random(in: 0...images.count - 1)
        
        print(reelImage)
    }
    
    // 1 bet amount
    func betAmout1() {
        betAmount = 1
        selecteBetAmout1 = true
        selecteBetAmout10 = false
        selecteBetAmout100 = false
    }
    
    // 10 bet amount
    func betAmout10() {
        betAmount = 10
        selecteBetAmout10 = true
        selecteBetAmout1 = false
        selecteBetAmout100 = false
    }
    
    // 100 bet amount
    func betAmout100() {
        betAmount = 100
        selecteBetAmout100 = true
        selecteBetAmout1 = false
        selecteBetAmout10 = false
    }
    
    // MARK: - check player winnings
    func playerWinning() {
        // Three similar images
        if reelImage[0] == reelImage[1] && reelImage[1] == reelImage[2] && reelImage[0] == reelImage [2] {
            if reelImage == [0,0,0] {
                wonBet(val: 10)
                highScore()
            } else if reelImage == [1,1,1] {
                wonBet(val: 20)
                highScore()
            } else if reelImage == [2,2,2] {
                wonBet(val: 20)
                highScore()
            } else if reelImage == [3,3,3] {
                wonBet(val: 30)
                highScore()
            } else if reelImage == [4,4,4] {
                wonBet(val: 40)
                highScore()
            } else if reelImage == [5,5,5] {
                // Player wins jackpot
                // Winner, winner, chicken dinner!
                wonBet(val: 30)
                highScore()
            }
        }
        //        else if reelImage[0] == reelImage[1] || reelImage[0] == reelImage[2] || reelImage[1] == reelImage [2] {
        //            if reelImage == [0,0,0] {
        //                wonBet(val: 10)
        //                highScore()
        //            } else if reelImage == [1,1,1] {
        //                wonBet(val: 20)
        //                highScore()
        //            } else if reelImage == [2,2,2] {
        //                wonBet(val: 20)
        //                highScore()
        //            } else if reelImage == [3,3,3] {
        //                wonBet(val: 30)
        //                highScore()
        //            } else if reelImage == [4,4,4] {
        //                wonBet(val: 40)
        //                highScore()
        //            } else if reelImage == [5,5,5] {
        //                wonBet(val: 30)
        //                highScore()
        //            }
        //        }
        else {
            playerLoss()
        }
    }
    
    // player win
    func wonBet(val: Int) {
        // Calculate what player has won by multiplying the bet amount
        playerCoins += betAmount * val
    }
    
    func jackpot() {
        playerCoins += betAmount + 200
        print("!!!!!!Jackpot")
    }
    
    // Player loss
    func playerLoss() {
        playerCoins -= betAmount
    }
    
    // player high score
    func highScore() {
        if playerCoins > playerHighScore {
            playerHighScore = playerCoins
        }
    }
    
    // when the player coins reach zero
    func gameOver() {
        if playerCoins == 0 {
            popUp = true
        }
    }
    
    // reset the game
    func resetGame() {
        playerCoins = 1000
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
                        Text("\(playerCoins)")
                            .playerScore()
                            .modifier(BetAmountShadow())
                        
                    }
                    .padding(.leading)
                    Spacer()
                    
                    // MARK: - Jackpot Label
                    HStack {
                        Text("\(playerHighScore)")
                            .playerScore()
                            .modifier(BetAmountShadow())
                        Text("Your\nHighScore".uppercased())
                            .playerScoreLabel()
                        //                            .multilineTextAlignment(.trailing)
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
                            // Spin the reels
                            if selecteBetAmout1 == false && selecteBetAmout10 == false && selecteBetAmout100 == false {
                                // return modalToPlaceBet
                                print("please select amout")
                            } else if popUp == true {
                                print("you have lost")
                            } else {
                                spinReels()
                            }
                            
                            // Update when player wins
                            playerWinning()
                            
                            // Game is over
                            gameOver()
                            
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
                            betAmout1()
                            print("$1 button pressed")
                        }){
                            Text("1")
                                .betAmountLabel()
                                .modifier(BetAmountShadow())
                                .padding(.leading,2)
                            // Change button foreground color if it is selected or not
                                .foregroundColor(selecteBetAmout1 ? Color.white : Color.black)
                                .background( selecteBetAmout1 ? Capsule()
                                    .strokeBorder(lineWidth: 2)
                                    .foregroundColor(Color("gold")) : Capsule()
                                    .strokeBorder(lineWidth: 0)
                                    .foregroundColor(Color("transparent")) )
                            BetCoinView()
                        }
                    }
                    
                    HStack {
                        Button(action: {
                            betAmout10()
                            print("$10 button pressed")
                        }){
                            Text("10")
                                .betAmountLabel()
                                .modifier(BetAmountShadow())
                            // Change button foreground color if it is selected or not
                                .foregroundColor(selecteBetAmout10 ? Color.white : Color.black)
                                .background( selecteBetAmout10 ? Capsule()
                                    .strokeBorder(lineWidth: 2)
                                    .foregroundColor(Color("gold")): Capsule()
                                    .strokeBorder(lineWidth: 0)
                                    .foregroundColor(Color("transparent")))
                            BetCoinView()
                            
                        }
                    }
                    
                    HStack {
                        Button(action: {
                            betAmout100()
                            print("$100 button pressed")
                        }){
                            Text("100")
                                .betAmountLabel()
                                .modifier(BetAmountShadow())
                                .padding(.trailing, 2)
                            // Change button foreground color if it is selected or not
                                .foregroundColor(selecteBetAmout100 ? Color.white : Color.black)
                                .background( selecteBetAmout100 ? Capsule()
                                    .strokeBorder(lineWidth: 2)
                                    .foregroundColor(Color("gold")) : Capsule()
                                    .strokeBorder(lineWidth: 0)
                                    .foregroundColor(Color("transparent")) )
                            BetCoinView()
                            
                        }
                    }
                }
                
                Spacer()
                .scaledToFit()
            }
            // MARK: - Overlay Cancel/Quit Buttons
            .overlay(
                Button(action:{
                    resetGame()
                    print("Reset game button pressed")
                }){
                    Image(systemName: "arrow.counterclockwise")
                }
                    .modifier(ResetbuttonModifier()),
                alignment: .topLeading
            )
            .padding(.all, 1)
            .frame(maxWidth: 720)
            .overlay(
                Button(action:{
                    print("Leave game button pressed")
                }){
                    Image(systemName: "xmark.circle")
                }
                    .modifier(ResetbuttonModifier()),
                alignment: .topTrailing
            )
            .padding(.all, 1)
            .frame(maxWidth: 720)
            
            // Blur background when pop up appears
            .blur(radius: $popUp.wrappedValue ? 2 : 0, opaque: false)
            
            // MARK: - Pop Up
            if $popUp.wrappedValue {
                ZStack {
                    Color("transparet")
                        .edgesIgnoringSafeArea(.all)
                    
                    // Model  view
                    VStack {
                        Text("Game Over")
                            .betAmountLabel()
                            .modifier(GameOverLabel())
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 16) {
                            // Image
                            popUpImage()
                            Text("The House Always Wins!!!\n Better Luck Next Time 😉")
                                .popUpMessage()
                                .modifier(PopUpMessageModifier())
                            
                            // Button
                            Button(action: {
                                popUp = false
                                playerCoins = 1000
                            }) {
                                Text("New Game".uppercased())
                                    .popUpMessage()
                                    .modifier(PopUpButton())
                            }
                        }
                        Spacer()
                    }.frame(minWidth: 200, idealWidth: 280, maxWidth: 320, minHeight: 290, idealHeight: 400, maxHeight: 350, alignment: .center)
                        .background(Color("gold"))
                        .cornerRadius(20)
                        .shadow(color: Color("transparent"), radius: 6, x: 0, y: 8)
                }
            }
        }
    }
    // MARK: - Preview
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
