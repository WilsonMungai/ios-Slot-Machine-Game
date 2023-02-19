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
                    Button(action: {
                        showingInfoView = true
                    }) {
                        Text("Rewards".uppercased())
                            .popUpMessage()
                            .modifier(PopUpButton())
                    }
                    Button(action: {
                        menuPop = false
                        animatingModal = false
                    }) {
                        Text("Resume".uppercased())
                            .popUpMessage()
                            .modifier(PopUpButton())
                    }
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
//            .animation(Animation.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 1.0))
            .onAppear {
                self.animatingModal = true
            }
            .modifier(PopUpView())
        }

    }
}

struct MenuPopUp_Previews: PreviewProvider {
    static var previews: some View {
        MenuPopUp()
    }
}
