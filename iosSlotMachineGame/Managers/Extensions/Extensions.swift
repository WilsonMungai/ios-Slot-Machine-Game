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

// MARK: - Text extension
extension Text {
    func playerScoreLabel() -> Text {
        self .foregroundColor(Color("gold"))
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
    
    // MARK: - playerScore text extension
    func playerScore() -> Text {
        self .foregroundColor(Color("gold"))
            .fontWeight(.heavy)
            .font(.system(.title, design: .rounded))
    }
    
    // MARK: - bet amount text extension
    func betAmountLabel() -> Text {
        self .foregroundColor(Color("black"))
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .fontWeight(.heavy)
            .font(.system(.title, design: .rounded))
    }
}
