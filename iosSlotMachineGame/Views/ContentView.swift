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
    @State private var playerCoins: Int = 1000
    // Payer highscore
    // player high score is determined by the amount of coins they have won. So the game starts at 1000 high score the same as the amount of coins but it will increase if the player wins more than 1,000
    @State private var playerHighScore: Int = 1000
    // Player's bet amout
    // Game starts off at bet amount 10
    @State private var betAmount: Int = 10
    
    // Get the selected bet amount
    @State private var selecteBetAmout1: Bool = false
    // Game starts off at bet amount 10 selected
    @State private var selecteBetAmout10: Bool = true
    @State private var selecteBetAmout100: Bool = false

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
                wonBet(val: 30)
                highScore()
            }
        }
//        else if reelImage[0] == reelImage[1] && reelImage[1] == reelImage[2] && reelImage[0] == reelImage [2] {
//
//        }
//        print(images[0])
//        print(images[1])
//        print(images[2])

//        if reelImage[0] == reelImage[1] && reelImage[1] == reelImage[2] && reelImage[0] == reelImage [2] {
//            jackpot()
//            // Update the high score
//            if playerCoins > playerHighScore {
//                highScore()
//            }
//
//        } else  if reelImage[0] == reelImage[2] && reelImage[1] == reelImage[2] || reelImage[0] == reelImage [2] {
//            // player wins but not jackpot
//            wonBet(val: 10)
//            highScore()
//        }
//        else {
//            // player loss
//            playerLoss()
//        }
//        (images[reelImage[0]])
//        if reelImage[0] == Int(images[0]) && reelImage[1] == Int(images[0]) && reelImage[2] == Int(images[0]) {
//            wonBet(val: 10);
//         }
//        else if reelImage[0] == Int(images[1]) && reelImage[1] == Int(images[1]) && reelImage[2] == Int(images[1]) {
//            wonBet(val: 10);
//         }
//        else if reelImage[0] == Int(images[2]) && reelImage[2] == Int(images[2]) && reelImage[2] == Int(images[2]) {
//            wonBet(val: 10);
//         }
//        else if reelImage[0] == Int(images[3]) && reelImage[2] == Int(images[3]) && reelImage[2] == Int(images[3]) {
//            wonBet(val: 10);
//         }
//        else if reelImage[0] == Int(images[4]) && reelImage[2] == Int(images[4]) && reelImage[2] == Int(images[4]) {
//            wonBet(val: 10);
//         }
//        else if reelImage[0] == Int(images[5]) && reelImage[2] == Int(images[5]) && reelImage[2] == Int(images[5]) {
//            wonBet(val: 10);
//         }
//        else if(Int(images[1]) == 3) {
//        wonBet(val: 20);
//        }
//        else if(Int(images[2]) == 3) {
//        wonBet(val: 40);
//        }
//        else if(Int(images[3]) == 3) {
//        wonBet(val: 50);
//        }
//        else if(Int(images[4]) == 3) {
//        wonBet(val: 75);
//        }
//        else if(Int(images[5]) == 3) {
//        wonBet(val: 100);
//        }
//        else if (Int(images[0]) == 2) {
//        wonBet(val: 2);
//        }
//        else if(Int(images[1]) == 2) {
//        wonBet(val: 4);
//        }
//        else if(Int(images[2]) == 2) {
//        wonBet(val: 5);
//        }
//        else if(Int(images[3]) == 2) {
//        wonBet(val: 3);
//        }
//        else if(Int(images[4]) == 2) {
//         wonBet(val: 2);
//        }
//        else if(Int(images[5]) == 2) {
//        wonBet(val: 10);
//        }
//        else if(Int(images[5]) == 1) {
//        wonBet(val: 5);
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
        playerHighScore = playerCoins
    }
    
    // when the player coins reach zero
    func gameOver() {
        
    }
    
    // reset the game
    func resetGame() {
        playerCoins = 1000
        playerHighScore = 1000
        betAmout10()
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
                            spinReels()
                            
                            // Update when player wins
                            playerWinning()
                            
                            // Game is over
                            
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
//                                     Change button foreground color if it is selected or not
                                    .foregroundColor(selecteBetAmout1 ? Color.white : Color.black)
                                BetCoinView()
                            }
                        }
                        
                        .padding(.leading)
                        
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
                                BetCoinView()
                                
                            }
                        }
                        .padding(.leading)
                        
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
                    resetGame()
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
