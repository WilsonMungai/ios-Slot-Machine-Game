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

struct gameLogo: View {
    // MARK: - Logo Body
    var body: some View {
        Image("casino-logo")
            .resizable()
            .scaledToFit()
            .layoutPriority(1)
            .frame(minWidth: 256, idealWidth: 300, maxWidth: 320, minHeight: 112, idealHeight: 130, maxHeight: 140, alignment: .center)
            .modifier(Shadow())
            .padding(.horizontal)
        
            
        
    }
}

struct gameLogo_Previews: PreviewProvider {
    static var previews: some View {
        gameLogo()
    }
}
