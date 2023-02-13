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
    let images = ["bell", "cherry", "grape", "coin", "strawberry", "orange", "banana", "seven", "bar"]
    
    // MARK: - Variables
    // Array of reel images
    @State private var reelImage: Array = [0,1,2]
    //  Number of coins player has
    @State private var playerCoins: Int = 20
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
    
    // Pop up
    @State private var popUp: Bool = false
    
    // MARK: - Methods
    // Spin reels and get random images according to index
    func spinReels() {
        reelImage[0] = Int.random(in: 0...images.count - 1)
        reelImage[1] = Int.random(in: 0...images.count - 1)
        reelImage[2] = Int.random(in: 0...images.count - 1)
    }
        
    // MARK: - check player winnings
    func playerWinning() {
        var counts: [Int: Int] = [:]
        for image in reelImage {
            counts[image] = (counts[image] ?? 0) + 1
        }
        print(counts)
        
        if reelImage[0] != reelImage[1] && reelImage[1] != reelImage[2] && reelImage[0] != reelImage[2] {
            playerLoss()
        } else {
            for (key, value) in counts {
                if key == 0 {
                    if value == 2 {
                        wonBet(val: 100)
                        highScore()
                    } else if value == 3 {
                        wonBet(val: 150)
                        highScore()
                    }
                } else if key == 1 {
                    if value == 2 {
                        wonBet(val: 80)
                        highScore()
                    } else if value == 3 {
                        wonBet(val: 120)
                        highScore()
                    }
                } else if key == 2 {
                    if value == 2 {
                        wonBet(val: 70)
                        highScore()
                    } else if value == 3 {
                        wonBet(val: 105)
                        highScore()
                    }
                } else if key == 3 {
                    if value == 2 {
                        wonBet(val: 90)
                        highScore()
                    } else if value == 3 {
                        wonBet(val: 135)
                        highScore()
                    }
                } else if key == 4 {
                    if value == 2 {
                        wonBet(val: 60)
                        highScore()
                    } else if value == 3 {
                        wonBet(val: 90)
                        highScore()
                    }
                } else if key == 5 {
                    if value == 2 {
                        wonBet(val: 50)
                        highScore()
                    } else if value == 3 {
                        wonBet(val: 80)
                        highScore()
                    }
                } else if key == 6 {
                    if value == 2 {
                        wonBet(val: 40)
                        highScore()
                    } else if value == 3 {
                        wonBet(val: 60)
                        highScore()
                    }
                } else if key == 7 {
                    if value == 2 {
                        wonBet(val: 60)
                        highScore()
                    } else if value == 3 {
                        jackpot()
                        wonBet(val: 180)
                        highScore()
                    }
                } else if key == 8 {
                    if value == 2 {
                        playerLoss()
                    } else if value == 3 {
                        if playerCoins > 500 {
                            playerCoins -= 500
                        } else {
                            playerLoss()
                        }
                    }
                }
            }
        }
    }
    
    // 1 bet amount
    func betAmout1() {
        betAmount = 1
        selecteBetAmout1 = true
        selecteBetAmout10 = false
        selecteBetAmout100 = false
        
        if playerCoins < 1 {
            selecteBetAmout1 = false
            popUp = true
        }
    }
    
    // 10 bet amount
    func betAmout10() {
        betAmount = 10
        selecteBetAmout10 = true
        selecteBetAmout1 = false
        selecteBetAmout100 = false
        
        if playerCoins < 10 {
            selecteBetAmout10 = false
            popUp = true
        }
    }
    
    // 100 bet amount
    func betAmout100() {
        betAmount = 100
        selecteBetAmout100 = true
        selecteBetAmout1 = false
        selecteBetAmout10 = false
        
        if playerCoins < 100 {
            selecteBetAmout100 = false
            popUp = true
        }
    }
    
    // player win
    func wonBet(val: Int) {
        // Calculate what player has won by multiplying the bet amount
        playerCoins += betAmount + val
        print(playerCoins)
    }
    
    // Player jackpot
    func jackpot() {
        popUp = true
        playerCoins += betAmount + 1000
        print("!!!!!!Jackpot")
    }
    
    // Player loss
    func playerLoss() {
        // Dont deduct if nothing is selected
        if selecteBetAmout1 == false && selecteBetAmout10 == false && selecteBetAmout100 == false {
            popUp = true
        } else {
            playerCoins -= betAmount
        }
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
    
    func checkPlayerAmount() {
        if playerCoins < 100 {
            selecteBetAmout100 = false
        } else if playerCoins < 10 {
            selecteBetAmout10 = false
        } else if playerCoins < 1 {
            selecteBetAmout1 = false
            gameOver()
        }
    }
    
    func checkPlayerAmount2() {
        if playerCoins < 10 {
            selecteBetAmout10 = false
        } else if playerCoins < 1 {
            selecteBetAmout1 = false
            gameOver()
        }
    }

    // reset the game
    func resetGame() {
        playerCoins = 1000
        selecteBetAmout1 = false
        selecteBetAmout10 = false
        selecteBetAmout100 = false
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
                                popUp = true
                            } else {
                                spinReels()
                            }
                            // Update when player wins
                            playerWinning()
                            
                            // Game is over
                            gameOver()
                            
                            // Chekcks the amount of coins the player has
                            checkPlayerAmount()
                            checkPlayerAmount2()
                        }){
                            Image("spinner")
                                .renderingMode(.original)
                                .resizable()
                                .modifier(SpinnerModifier())
                        }
                        // disable button when pop up appears
                        .disabled(popUp == true)
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
                        .disabled(popUp == true)
                    }
                    
                    HStack {
                        Button(action: {
                            betAmout10()
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
                        .disabled(popUp == true)
                    }
                    
                    HStack {
                        Button(action: {
                            betAmout100()
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
                        .disabled(popUp == true)
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
                    .disabled(popUp == true)
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
                    .disabled(popUp == true)
                    .modifier(ResetbuttonModifier()),
                alignment: .topTrailing
            )
            .padding(.all, 1)
            .frame(maxWidth: 720)
            
            // Blur background when pop up appears
            .blur(radius: $popUp.wrappedValue ? 3 : 0, opaque: false)
            
            // MARK: - Pop Up
            if $popUp.wrappedValue {
                ZStack {
                    Color("transparet")
                        .edgesIgnoringSafeArea(.all)
                    
                    // Model  view
                    // Game Over pop up
                    if playerCoins == 0 {
                        VStack {
                            Text("Game Over")
                                .betAmountLabel()
                                .modifier(GameOverLabel())
                            
                            Spacer()
                            
                            VStack(alignment: .center, spacing: 16) {
                                // Image
                                PopUpImage()
                                Text("The House Always Wins!!!\n Better Luck Next Time 😉")
                                    .popUpMessage()
                                    .modifier(PopUpMessageModifier())
                                // Button
                                Button(action: {
                                    popUp = false
                                    selecteBetAmout1 = false
                                    selecteBetAmout10 = false
                                    selecteBetAmout100 = false
                                    // Reset coins
                                    playerCoins = 1000
                                }) {
                                    Text("New Game".uppercased())
                                        .popUpMessage()
                                        .modifier(PopUpButton())
                                }
                            }
                            Spacer()
                        }.modifier(PopUpView())
                        
                        // JackPot Popup
                    } else if reelImage == [7,7,7] {
                        VStack {
                            Text("Congratulations!!!")
                                .betAmountLabel()
                                .modifier(GameOverLabel())
                            
                            Spacer()
                            
                            VStack(alignment: .center, spacing: 16) {
                                // Image
                                JackpotImage()
                                Text("Winner, winner chicken dinner!!!")
                                    .popUpMessage()
                                    .modifier(PopUpMessageModifier())
                                // Button
                                Button(action: {
                                    popUp = false
                                }) {
                                    Text("Continue Winning".uppercased())
                                        .popUpMessage()
                                        .modifier(PopUpButton())
                                }
                            }
                            Spacer()
                        }.modifier(PopUpView())
                        
                        // Prompt for player to choose bet amount
                    } else {
                        VStack {
                            Text("Choose \n Bet Amount")
                                .betAmountLabel()
                                .modifier(GameOverLabel())
                            
                            Spacer()
                            
                            VStack(alignment: .center, spacing: 16) {
                                // Image
                                PlaceBetImage()
                                Text("Don't Be Afraid To Place Your Bet")
                                    .popUpMessage()
                                    .modifier(PopUpMessageModifier())
                                
                                // Button
                                Button(action: {
                                    popUp = false
                                }) {
                                    Text("Select Amount".uppercased())
                                        .popUpMessage()
                                        .modifier(PopUpButton())
                                }
                            }
                            Spacer()
                        }.modifier(PopUpView())
                    }
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
