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
    
    @State private var showingInfoView = false
    
    // Array of images shown in reel
//    let images = ["bell", "cherry", "grape", "coin", "strawberry", "orange", "banana", "seven", "bar"]
    
//    @StateObject var dice = DiceSet()
    @StateObject var slotBrain = SlotBrain()
    
    // MARK: - Variables
    // Array of reel images
//    @State private var reelImage: Array = [0,1,2]
    //  Number of coins player has
//    @State private var playerCoins: Int = 1000
//    // Payer highscore
//    // player high score is determined by the amount of coins they have won. So the game starts at 1000 high score the same as the amount of coins but it will increase if the player wins more than 1,000
//    @State private var playerHighScore: Int = 1000
//    // Player's bet amout
//    // Game starts off at bet amount 10
//    @State private var betAmount: Int = 0
//
//    // Get the selected bet amount
//    @State private var selecteBetAmout1: Bool = false
//    @State private var selecteBetAmout10: Bool = false
//    @State private var selecteBetAmout100: Bool = false
    
    // Pop up
    @State private var popUp = false
    
    // Menu pop up
    @State private var menuPop = false
    
    @State private var quitApp = false
    
//    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    @State var showAlert = false
    
    // MARK: - Methods
    private func terminateApp() {
////            NSApplication.shared.terminate(self)
//        NSApp.terminate(self)
        }
    
    // MARK: - Body
    var body: some View {
        .onDisappear {
                            terminateApp()
                        }
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
                // Labels views
                labelsContentLayer
                // MARK: - Slot Machine
                VStack() {
                    // MARK: - Reel 1
                    ZStack {
                        ReelView()
                        // Get the at index image and show at the reel index
                        Image(slotBrain.images[slotBrain.reelImage[0]])
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    HStack() {
                        // MARK: - Reel 2
                        ZStack {
                            ReelView()
                            // Get the at index image and show at the reel index
                            Image(slotBrain.images[slotBrain.reelImage[1]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        // MARK: - Reel 3
                        ZStack {
                            ReelView()
                            // Get the at index image and show at the reel index
                            Image(slotBrain.images[slotBrain.reelImage[2]])
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
                            if slotBrain.selecteBetAmout1 == false && slotBrain.selecteBetAmout10 == false && slotBrain.selecteBetAmout100 == false {
                                // return modalToPlaceBet
                                popUp = true
                            } else {
                                slotBrain.spinReels()
                            }
                            // Update when player wins
//                            playerWinning()
                            slotBrain.playerWinning()
                            // Game is over
                            slotBrain.gameOver()
                            
                            // Chekcks the amount of coins the player has
//                            checkPlayerAmount()
//                            checkPlayerAmount2()
                            slotBrain.checkPlayerAmount()
                            slotBrain.checkPlayerAmount2()
                            slotBrain.checkPlayerAmount3()
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
//                        betAmout1()
                            slotBrain.betAmout1()
                        }){
                            Text("1")
                                .betAmountLabel()
                                .modifier(BetAmountShadow())
                                .padding(.leading,2)
                            // Change button foreground color if it is selected or not
                                .foregroundColor(slotBrain.selecteBetAmout1 ? Color.white : Color.black)
                                .background( slotBrain.selecteBetAmout1 ? Capsule()
                                    .strokeBorder(lineWidth: 2)
                                    .foregroundColor(Color("gold")) : Capsule()
                                    .strokeBorder(lineWidth: 0)
                                    .foregroundColor(Color("transparent")))
                            BetCoinView()
                        }
                        .disabled(popUp == true)
                    }
                    
                    HStack {
                        Button(action: {
                            slotBrain.betAmout10()
                        }){
                            Text("10")
                                .betAmountLabel()
                                .modifier(BetAmountShadow())
                            // Change button foreground color if it is selected or not
                                .foregroundColor(slotBrain.selecteBetAmout10 ? Color.white : Color.black)
                                .background( slotBrain.selecteBetAmout10 ? Capsule()
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
//                            betAmout100()
                            slotBrain.betAmout100()
                        }){
                            Text("100")
                                .betAmountLabel()
                                .modifier(BetAmountShadow())
                                .padding(.trailing, 2)
                            // Change button foreground color if it is selected or not
                                .foregroundColor(slotBrain.selecteBetAmout100 ? Color.white : Color.black)
                                .background( slotBrain.selecteBetAmout100 ? Capsule()
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
            // Show Info screen
            .fullScreenCover(isPresented: $showingInfoView) {
                Menu()
            }
            // MARK: - Overlay Cancel/Quit Buttons
            .overlay(
                Button(action:{
//                    resetGame()
                    slotBrain.resetGame()
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
                    menuPop = true
                }){
                    Image(systemName: "questionmark.circle")
                }
                    .disabled(popUp == true)
                    .modifier(ResetbuttonModifier()),
                alignment: .topTrailing
            )
            .padding(.all, 1)
            .frame(maxWidth: 720)
            
            // Blur background when pop up appears
            .blur(radius: $popUp.wrappedValue ? 3 : 0, opaque: false)
            .blur(radius: $menuPop.wrappedValue ? 3 : 0, opaque: false)
            
            
            if $menuPop.wrappedValue {
                ZStack {
                    Color("transparent")
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Text("Menu")
                            .betAmountLabel()
                        .modifier(GameOverLabel())
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 16) {
                            // Image
                            gameLogo()
//                            Text("The House Always Wins!!!\n Better Luck Next Time 😉")
//                                .popUpMessage()
//                                .modifier(PopUpMessageModifier())
                            // Button
                            Button(action: {
                                showingInfoView = true
                            }) {
                                Text("Rewards".uppercased())
                                    .popUpMessage()
                                    .modifier(PopUpButton())
                            }
                            Button(action: {
                                menuPop = false
                            }) {
                                Text("Resume".uppercased())
                                    .popUpMessage()
                                    .modifier(PopUpButton())
                            }
                            Button(action: {
                                showAlert = true
                            })
                            {
                                Text("Quit".uppercased())
                                    .popUpMessage()
                                    .modifier(PopUpButton())
                            }
                            .alert("Do you want to quit?", isPresented: $showAlert) {
                                Button("Yes", role: .destructive) {
                                    exit(0)
                                }
                                Button("No", role: .cancel) {
//                                    menuPop = false
                                }
                            }
                        }
                        Spacer()
                    }.modifier(PopUpView())
                    
                }
            }
            
            // MARK: - Pop Up
            if $popUp.wrappedValue {
                ZStack {
                    Color("transparent")
                        .edgesIgnoringSafeArea(.all)
                    
                    // Model  view
                    // Game Over pop up
                    if slotBrain.playerCoins == 0 {
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
                                    slotBrain.selecteBetAmout1 = false
                                    slotBrain.selecteBetAmout10 = false
                                    slotBrain.selecteBetAmout100 = false
                                    // Reset coins
                                    slotBrain.playerCoins = 1000
                                }) {
                                    Text("New Game".uppercased())
                                        .popUpMessage()
                                        .modifier(PopUpButton())
                                }
                            }
                            Spacer()
                        }.modifier(PopUpView())
                        
                        // JackPot Popup
                    } else if slotBrain.reelImage == [7,7,7] {
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
    
    var labelsContentLayer: some View {
        HStack {
            // MARK: - Score Label
            HStack {
                Text("Your\nCoins".uppercased())
                    .playerScoreLabel()
                Text("\(slotBrain.playerCoins)")
                    .playerScore()
                    .modifier(BetAmountShadow())
            }
            .padding(.leading)
            Spacer()
            
            // MARK: - Jackpot Label
            HStack {
                Text("\(slotBrain.playerHighScore)")
                    .playerScore()
                    .modifier(BetAmountShadow())
                Text("Your\nHighScore".uppercased())
                    .playerScoreLabel()
            }
            .padding(.trailing)
        }
    }
    
//    var alertbody: some View {
//      Button(action: {
//        self.showAlert = true
//      }) {
//        Text("Show Alert")
//      }
//      .alert(isPresented: $showAlert) {
//          Alert(title: Text("Title"), message: Text("Message..."),
//              primaryButton: .default (Text("OK")) {
//                print("OK button tapped")
//              },
//              secondaryButton: .cancel()
//          )
//      }
//    }
    
    // MARK: - Preview
    struct ContentView_Previews: PreviewProvider {
        static let slotBrain = SlotBrain()
        static var previews: some View {
            ContentView(slotBrain: slotBrain)
        }
    }
}
