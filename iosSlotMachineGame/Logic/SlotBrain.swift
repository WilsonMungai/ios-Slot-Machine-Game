/*
 
 MAPD 724 Slot Machine
 
 Group 10 Members
 
 Nyarko, Betrand / Student Number: 301293794
 Muguthi, Wilson Mungai / Student Number: 301287641
 Du, Pengfei / Student Number: 301276081
 
 This is a simple slot machine game that has three reel images, a spin button that changes the images in the reels. The user can see the amount of coins they have in the player coins label, and also see the jackpot amount in  the jackpot label. There are different bet amounts which the user can select. The player has the permission to reset the game which will reset everything in the game. There is also an option to quit the game.
 
 Version 3
 
 Last modified: 19/February/2023
 
 */

import Foundation
import SwiftUI

class SlotBrain: ObservableObject {
    
    let images = ["bell", "cherry", "grape", "coin", "strawberry", "orange", "banana", "seven", "bar"]
    // MARK: - Variables
    // Array of reel images
    @Published var reelImage: Array = [0,1,2]
    //  Number of coins player has
    @Published var playerCoins: Int = 10
    // Payer highscore
    // player high score is determined by the amount of coins they have won.
    @Published var playerHighScore: Int = UserDefaults.standard.integer(forKey: "HighScore")
    // Player's bet amout
    // Game starts off at bet amount 0
    @Published var betAmount: Int = 0
    
    // Get the selected bet amount
    @Published var selecteBetAmout1: Bool = false
    @Published var selecteBetAmout10: Bool = false
    @Published var selecteBetAmout100: Bool = false
    
    @Published var popUp: Bool = false
    
    // MARK: - check player winnings
    // Spin reels and get random images according to index
    func spinReels() {
        reelImage[0] = Int.random(in: 0...images.count - 1)
        reelImage[1] = Int.random(in: 0...images.count - 1)
        reelImage[2] = Int.random(in: 0...images.count - 1)
        SoundManager.instance.playSound(sound: .spin)
    }
    
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
                        wonBet(val: 200)
                        highScore()
                    } else if value == 3 {
                        jackpot()
                        wonBet(val: 180)
                        highScore()
                    }
                } else if key == 8 {
                    if value == 2 {
                        playerCoins -= betAmount * 2
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
        self.objectWillChange.send()
    }
    
    // player win
    func wonBet(val: Int) {
        // player wins only when one of the buttons is selected
        if selecteBetAmout1 == true || selecteBetAmout10 == true || selecteBetAmout100 == true {
            // Calculate what player has won by multiplying the bet amount
            playerCoins += betAmount + val
            print(playerCoins)
            self.objectWillChange.send()
        }
      
    }
    
    // Player jackpot
    func jackpot() {
        // Sound
        SoundManager.instance.playSound(sound: .jackpot)
        // Haptics type
        HapticManager.instance.notification(type: .success)
        // Haptic style
        HapticManager.instance.impact(style: .light)
        
        popUp = true
        playerCoins += betAmount + 1000
        print("!!!!!!Jackpot")
        self.objectWillChange.send()
    }
    
    // Player loss
    func playerLoss() {
        // Dont deduct if nothing is selected
        if selecteBetAmout1 == false && selecteBetAmout10 == false && selecteBetAmout100 == false {
            popUp = true
        } else {
            playerCoins -= betAmount
        }
        print(playerCoins)
        self.objectWillChange.send()
    }
    
    // player high score
    func highScore() {
        if selecteBetAmout1 == true || selecteBetAmout10 == true || selecteBetAmout100 == true {
            if playerCoins > playerHighScore {
                playerHighScore = playerCoins
                SoundManager.instance.playSound(sound: .highscore)
            }
        }
        UserDefaults.standard.set(playerHighScore, forKey: "HighScore")
        self.objectWillChange.send()
    }
    
    // 1 bet amount
    func betAmout1() {
        if playerCoins >= 1 {
            SoundManager.instance.playSound(sound: .chips)
        }
        betAmount = 1
        selecteBetAmout1 = true
        selecteBetAmout10 = false
        selecteBetAmout100 = false
        
        if playerCoins < 1 {
            selecteBetAmout1 = false
            popUp = true
            // Haptics type
            HapticManager.instance.notification(type: .warning)
            // Haptic style
            HapticManager.instance.impact(style: .light)
        }
        self.objectWillChange.send()
    }
    
    // 10 bet amount
    func betAmout10() {
        if playerCoins >= 10 {
            SoundManager.instance.playSound(sound: .chips)
        }
        betAmount = 10
        selecteBetAmout10 = true
        selecteBetAmout1 = false
        selecteBetAmout100 = false
        
        if playerCoins < 10 {
            selecteBetAmout10 = false
            popUp = true
            // Haptics type
            HapticManager.instance.notification(type: .warning)
            // Haptic style
            HapticManager.instance.impact(style: .light)
        }
        self.objectWillChange.send()
    }
    
    // 100 bet amount
    func betAmout100() {
        if playerCoins >= 100 {
            SoundManager.instance.playSound(sound: .chips)
        }
        betAmount = 100
        selecteBetAmout100 = true
        selecteBetAmout1 = false
        selecteBetAmout10 = false
        
        if playerCoins < 100 {
            selecteBetAmout100 = false
            popUp = true
            // Haptics type
            HapticManager.instance.notification(type: .warning)
            // Haptic style
            HapticManager.instance.impact(style: .light)
        }
        self.objectWillChange.send()
    }
    // when the player coins reach zero
    func gameOver() {
        if playerCoins <= 0 {
            SoundManager.instance.playSound(sound: .gameOver)
            popUp = true
        }
        self.objectWillChange.send()
    }
    
    func checkPlayerAmount() {
        if playerCoins < 100 {
            selecteBetAmout100 = false
        }
        if playerCoins < 10 {
            selecteBetAmout100 = false
        }
        if playerCoins < 10{
            selecteBetAmout100 = false
        }
        self.objectWillChange.send()
    }
    
    func checkPlayerAmount2() {
        if playerCoins < 10 {
            selecteBetAmout10 = false
        }
        self.objectWillChange.send()
    }
    
    func checkPlayerAmount3() {
         if playerCoins < 1 {
            selecteBetAmout1 = false
        }
        self.objectWillChange.send()
    }

    // reset the game
    func resetGame() {
        // no sound when coins == 1000
        if playerCoins != 1000 {
            SoundManager.instance.playSound(sound: .reset)
        }
        UserDefaults.standard.set(0, forKey: "HighScore")
        playerCoins = 1000
        selecteBetAmout1 = false
        selecteBetAmout10 = false
        selecteBetAmout100 = false
        self.objectWillChange.send()
    }
    
    func restartGame() {
        SoundManager.instance.playSound(sound: .reset)
        UserDefaults.standard.set(0, forKey: "HighScore")
        playerHighScore = 0
        playerCoins = 1000
        selecteBetAmout1 = false
        selecteBetAmout10 = false
        selecteBetAmout100 = false
        self.objectWillChange.send()
    }
}
