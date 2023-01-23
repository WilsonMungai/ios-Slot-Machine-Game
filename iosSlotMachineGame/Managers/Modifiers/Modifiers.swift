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

// MARK: - Shadow modifier
struct Shadow: ViewModifier {
    func body(content: Content) -> some View {
        content .shadow(color: Color("transparent"), radius: 0, x: 0, y: 6)
    }
}

// MARK: - Player score modifier
struct playerScoreModifier: ViewModifier {
    func body(content: Content) -> some View {
        content .shadow(color: Color("transparent"), radius: 0, x: 0, y: 3)
                .layoutPriority(1)
    }
}

// MARK: - Player score container modifier
struct playerScoreContainerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content .background(Capsule() .foregroundColor(Color("transparent")))
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
            .frame(minWidth: 200)
    }
}

// MARK: - Reel Modifier
struct ReelImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(minWidth: 140, idealWidth: 200, maxWidth: 220, minHeight: 130,
                   idealHeight: 190, maxHeight: 200, alignment: .center)
            .modifier(Shadow())
    }
}

// MARK: - Image Modifier
struct ImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(minWidth: 90, idealWidth: 120, maxWidth: 140, minHeight: 85,
                   idealHeight: 105, maxHeight: 120, alignment: .center)
            .modifier(Shadow())
    }
}

// MARK: - Spinner Modifier
struct SpinnerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(minWidth: 100, idealWidth: 140, maxWidth: 160, minHeight: 105,
                   idealHeight: 125, maxHeight: 140, alignment: .center)
            .modifier(Shadow())
    }
}

// MARK: - Spinner Modifier
struct BetAmountModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(minWidth: 50, idealWidth: 70, maxWidth: 80, minHeight: 50,
                   idealHeight: 60, maxHeight: 70, alignment: .center)
            .modifier(Shadow())
    }
}

// MARK: - Shadow modifier
struct BetAmountShadow: ViewModifier {
    func body(content: Content) -> some View {
        content .shadow(color: Color("transparent"), radius: 0, x: 0, y: 3)
    }
}

// MARK: - Reset button modifier
struct ResetbuttonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
        .accentColor(.white)
    }
}
