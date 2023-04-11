
import SwiftUI

struct ContentView: View {
    // Pop up
    @State private var popUp = false
    // Menu pop up
    @State private var menuPop = false
    // Show info screen
    @State private var showingInfoView = false
    // Quit alert
    @State var showAlert = false
    // Reset alert
    @State var resetAlert = false
    // Reset alert
    @State var noCoinsAlert = false
    // Spinner animation
    @State private var isAnimated = false
    // Reel animation
    @State private var animatingSymbol = false
    // Menu popup animation
    @State private var animatingModal = false
    // Animation duration
    let timing = 1.0
    
    // instance of slot logic
    @ObservedObject var slotBrain = SlotBrain()
    
    // when the player coins reach zero
    func gameOver() {
        if slotBrain.playerCoins <= 0 {
            SoundManager.instance.playSound(sound: .gameOver)
            popUp = true
        }
    }
    
        // Player jackpot
    func jackpot() {
        if slotBrain.reelImage == [7,7,7] {
            // Sound
            SoundManager.instance.playSound(sound: .jackpot)
            // Haptics type
            HapticManager.instance.notification(type: .success)
            // Haptic style
            HapticManager.instance.impact(style: .light)
    
            popUp = true
            slotBrain.playerCoins += slotBrain.betAmount + 1000
            slotBrain.playerHighScore = slotBrain.playerCoins
            print("!!!!!!Jackpot")
        }
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
                            .opacity(animatingSymbol ? 1 : 0)
                            .offset(y: animatingSymbol ? 0 : -50)
                            .animation(Animation.easeOut(duration: Double.random(in: 0.5...0.7)), value: animatingSymbol)
                            .onAppear(perform: {
                                self.animatingSymbol.toggle()
                            })
                    }
                    HStack() {
                        // MARK: - Reel 2
                        ZStack {
                            ReelView()
                            // Get the at index image and show at the reel index
                            Image(slotBrain.images[slotBrain.reelImage[1]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -50)
                                .animation(Animation.easeOut(duration: Double.random(in: 0.7...0.9)), value: animatingSymbol)
                                .onAppear(perform: {
                                    self.animatingSymbol.toggle()
                                })
                        }
                        // MARK: - Reel 3
                        ZStack {
                            ReelView()
                            // Get the at index image and show at the reel index
                            Image(slotBrain.images[slotBrain.reelImage[2]])
                                .resizable()
                                .scaledToFit()
                                .modifier(ImageModifier())
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -50)
                                .animation(Animation.easeOut(duration: Double.random(in: 0.9...1.1)), value: animatingSymbol)
                                .onAppear(perform: {
                                    self.animatingSymbol.toggle()
                                })
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
//                                slotBrain.spinReels()
                            }
                            
                            withAnimation(Animation.linear(duration: timing)) {
                                // Disable animation when no button is selected
                                if slotBrain.selecteBetAmout1 == true || slotBrain.selecteBetAmout10 == true || slotBrain.selecteBetAmout100 == true {
                                    isAnimated.toggle()
                                    slotBrain.spinReels()
                                }
                                else {
                                    
                                    isAnimated = false
                                }
                            }
                            // Set default animation to false
                            withAnimation {
                                self.animatingSymbol = false
                            }
                            // trigger animation after changing symbols
                            withAnimation {
                                self.animatingSymbol = true
                            }
                            // Update when player wins
                            slotBrain.playerWinning()
                        
                            slotBrain.checkPlayerAmount()
                            slotBrain.checkPlayerAmount2()
                            slotBrain.checkPlayerAmount3()
                            
                            // three similar slots
                            slotBrain.threeSlots()
                            
                            // jackpot
                            jackpot()
                            
                            // Game is over
                            gameOver()
                        }){
                            Image("spinner")
                                .renderingMode(.original)
                                .resizable()
                                .modifier(SpinnerModifier())
                                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                        }
                        // disable button when pop up appears
                        .disabled(popUp == true)

                    }
                }
                .layoutPriority(2)
                
                Spacer ()
                
                // MARK: - Bet Amount Buttons
                // 1 bet amount
                HStack {
                    HStack {
                        Button(action: {
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
                    
                    // 10 bet amount
                    HStack {
                        Button(action: {
                            slotBrain.betAmout10()
                            if slotBrain.playerCoins < 10 {
                                noCoinsAlert = true
                            }
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
                        // alert when coins are less than 10
                        .alert("You don't have enough coins", isPresented: $noCoinsAlert) {
                            Button("OK", role: .cancel) {}
                        }
                        .disabled(popUp == true)
                    }
                    
                    // 100 bet amount
                    HStack {
                        Button(action: {
                            slotBrain.betAmout100()
                            if slotBrain.playerCoins < 100 {
                                noCoinsAlert = true
                            }
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
                        // alert when coins are less than 100
                        .alert("You don't have enough coins", isPresented: $noCoinsAlert) {
                            Button("OK", role: .cancel) {}
                        }
                        // disbale when there is a pop up
                        .disabled(popUp == true)
                    }
                }
                .scaledToFit()
            }
            // Show Info screen
            .fullScreenCover(isPresented: $showingInfoView) { Menu() }
            
            // MARK: - Overlay Cancel/Quit Buttons
            .overlay(
                Button(action:{
                    slotBrain.resetGame()
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
                    SoundManager.instance.playSound(sound: .menu)
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
            
            // MARK: - Menu Pop Up
            if $menuPop.wrappedValue { menuPopUp }
            
            // MARK: - In Game Pop Ups
            if $popUp.wrappedValue { gamePopUps }
        }
    }
    
    // MARK: - Views
    // Coins & HighScore labels
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
    
    // Menu Pop up view
    var menuPopUp: some View {
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
                    // Button
                    // Resume
                    Button(action: {
                        menuPop = false
                        animatingModal = false
                        SoundManager.instance.playSound(sound: .menu)
                    }) {
                        Text("Resume".uppercased())
                            .popUpMessage()
                            .modifier(PopUpButton())
                    }
                    // Rewards
                    Button(action: {
                        showingInfoView = true
                    }) {
                        Text("Rewards".uppercased())
                            .popUpMessage()
                            .modifier(PopUpButton())
                    }
                    // Reset
                    Button(action: {
                        resetAlert = true
                    }) {
                        Text("Reset".uppercased())
                            .popUpMessage()
                            .modifier(PopUpButton())
                    }
                    .alert("You will lose your coins.\nThis action can't be reversed!", isPresented: $resetAlert) {
                        Button("Yes", role: .none) {
                            menuPop = false
                            slotBrain.restartGame()
                        }
                        Button("No", role: .cancel) {}
                    }
                    // Quit
                    Button(action: {
                        showAlert = true
                    }) {
                        Text("Quit".uppercased())
                            .popUpMessage()
                            .modifier(PopUpButton())
                    }
                    .alert("Do you want to quit?", isPresented: $showAlert) {
                        Button("Yes", role: .destructive) {
                            exit(0)
                        }
                        Button("No", role: .cancel) {}
                    }
                }
                Spacer()
            }
            .opacity($animatingModal.wrappedValue ? 1 : 0)
            .offset(y: $animatingModal.wrappedValue ? 0 : -100)
            .animation(Animation.spring(response: 0.8, dampingFraction: 0.75, blendDuration: 1.0), value: animatingModal)
            .onAppear {
                self.animatingModal = true
            }
            .modifier(PopUpView())
        }
    }
    
    // In game pop ups
    var gamePopUps: some View {
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
//                        JackpotImage()
                        Text("The House Always Wins!!!\n Better Luck Next Time 😉")
                            .popUpMessage()
                            .modifier(PopUpMessageModifier())
                        // Button
                        Button(action: {
                            SoundManager.instance.playSound(sound: .reset)
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
    // MARK: - Preview
    struct ContentView_Previews: PreviewProvider {
        static let slotBrain = SlotBrain()
        static var previews: some View {
            ContentView(slotBrain: slotBrain)
        }
    }
}
