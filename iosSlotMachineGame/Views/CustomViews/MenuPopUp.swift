//
//  MenuPopUp.swift
//  iosSlotMachineGame
//
//  Created by Wilson Mungai on 2023-02-17.
//

import SwiftUI

struct MenuPopUp: View {
    @State private var showingInfoView = false
    
    @StateObject var slotBrain = SlotBrain()
    // Pop up
    @State private var popUp = false
    // Menu pop up
    @State private var menuPop = false
    // Quit alert
    @State var showAlert = false
    // Spinner animation
    @State private var isAnimated = false
    // Reel animation
    @State private var animatingSymbol = false
    // Menu popup animation
    @State private var animatingModal = false
    // Reset alert
    @State var resetAlert = false
    
    var body: some View {
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
                    .alert("You will lose your coins.\nThis action can't be reversed", isPresented: $resetAlert) {
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
//    var gamePopUps: some View {
//        ZStack {
//            Color("transparent")
//                .edgesIgnoringSafeArea(.all)
//            // Model  view
//            // Game Over pop up
//            if slotBrain.playerCoins == 0 {
//                VStack {
//                    Text("Game Over")
//                        .betAmountLabel()
//                        .modifier(GameOverLabel())
//
//                    Spacer()
//
//                    VStack(alignment: .center, spacing: 16) {
//                        // Image
//                        PopUpImage()
//                        Text("The House Always Wins!!!\n Better Luck Next Time 😉")
//                            .popUpMessage()
//                            .modifier(PopUpMessageModifier())
//                        // Button
//                        Button(action: {
//                            SoundManager.instance.playSound(sound: .reset)
//                            popUp = false
//                            slotBrain.selecteBetAmout1 = false
//                            slotBrain.selecteBetAmout10 = false
//                            slotBrain.selecteBetAmout100 = false
//                            // Reset coins
//                            slotBrain.playerCoins = 1000
//                        }) {
//                            Text("New Game".uppercased())
//                                .popUpMessage()
//                                .modifier(PopUpButton())
//                        }
//                    }
//                    Spacer()
//                }.modifier(PopUpView())
//
//                // JackPot Popup
//            } else if slotBrain.reelImage == [7,7,7] {
//                VStack {
//                    Text("Congratulations!!!")
//                        .betAmountLabel()
//                        .modifier(GameOverLabel())
//
//                    Spacer()
//
//                    VStack(alignment: .center, spacing: 16) {
//                        // Image
//                        JackpotImage()
//                        Text("Winner, winner chicken dinner!!!")
//                            .popUpMessage()
//                            .modifier(PopUpMessageModifier())
//                        // Button
//                        Button(action: {
//                            popUp = false
//                        }) {
//                            Text("Continue Winning".uppercased())
//                                .popUpMessage()
//                                .modifier(PopUpButton())
//                        }
//                    }
//                    Spacer()
//                }.modifier(PopUpView())
//
//                // Prompt for player to choose bet amount
//            } else {
//                VStack {
//                    Text("Choose \n Bet Amount")
//                        .betAmountLabel()
//                        .modifier(GameOverLabel())
//
//                    Spacer()
//
//                    VStack(alignment: .center, spacing: 16) {
//                        // Image
//                        PlaceBetImage()
//                        Text("Don't Be Afraid To Place Your Bet")
//                            .popUpMessage()
//                            .modifier(PopUpMessageModifier())
//
//                        // Button
//                        Button(action: {
//                            popUp = false
//                        }) {
//                            Text("Select Amount".uppercased())
//                                .popUpMessage()
//                                .modifier(PopUpButton())
//                        }
//                    }
//                    Spacer()
//                }.modifier(PopUpView())
//            }
//        }
//    }
    
    struct MenuPopUp_Previews: PreviewProvider {
        static var previews: some View {
            MenuPopUp()
        }
    }
}
