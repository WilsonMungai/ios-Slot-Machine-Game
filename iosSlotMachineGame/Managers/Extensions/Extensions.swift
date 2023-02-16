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

// MARK: - Text extension
extension Text {
    func playerScoreLabel() -> Text {
            self.foregroundColor(Color("gold"))
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
    
    // MARK: - playerScore text extension
    func playerScore() -> Text {
            self.foregroundColor(Color("gold"))
            .fontWeight(.heavy)
            .font(.system(.title, design: .rounded))
    }
    
    // MARK: - pop up title
    func betAmountLabel() -> Text {
            self.font(.system(size: 30, weight: .bold, design: .rounded))
            .fontWeight(.heavy)
            .font(.system(.title, design: .rounded))
    }
    
    // MARK: - pop up message
    func popUpMessage() -> Text {
            self.font(.system(size: 20, weight: .bold, design: .rounded))
            .fontWeight(.semibold)
            .font(.system(.title, design: .rounded))
    }
    
    func rewardDetails() -> Text {
        self.font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(Color(.systemGray2))
//            .foregroundColor(Color("gold"))
            .fontWeight(.bold)
            
    }
}
