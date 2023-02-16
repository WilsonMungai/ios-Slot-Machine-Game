//
//  SlotBrain.swift
//  iosSlotMachineGame
//
//  Created by Wilson Mungai on 2023-02-13.
//

import Foundation

class SlotBrain: ObservableObject {
    
    let images = ["bell", "cherry", "grape", "coin", "strawberry", "orange", "banana", "seven", "bar"]
    // MARK: - Variables
    // Array of reel images
    var reelImage: Array = [0,1,2]
    //  Number of coins player has
    var playerCoins: Int = 1000
    // Payer highscore
    // player high score is determined by the amount of coins they have won. So the game starts at 1000 high score the same as the amount of coins but it will increase if the player wins more than 1,000
    var playerHighScore: Int = UserDefaults.standard.integer(forKey: "HighScore")
    // Player's bet amout
    // Game starts off at bet amount 10
    var betAmount: Int = 0
    
    // Get the selected bet amount
    var selecteBetAmout1: Bool = false
    var selecteBetAmout10: Bool = false
    var selecteBetAmout100: Bool = false
    
    private var popUp: Bool = false
    
    // MARK: - check player winnings
    // Spin reels and get random images according to index
    func spinReels() {
        reelImage[0] = Int.random(in: 0...images.count - 1)
        reelImage[1] = Int.random(in: 0...images.count - 1)
        reelImage[2] = Int.random(in: 0...images.count - 1)
        
//        SoundManager.instance.playSound(sound: .spinner)
        
//        playSound(sound: "spin", type: "mp3")
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
                        wonBet(val: 60)
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
        // Calculate what player has won by multiplying the bet amount
        playerCoins += betAmount + val
        print(playerCoins)
        self.objectWillChange.send()
    }
    
    // Player jackpot
    func jackpot() {
        SoundManager.instance.playSound(sound: .jackpot)
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
        SoundManager.instance.playSound(sound: .highscore)
        if playerCoins > playerHighScore {
            playerHighScore = playerCoins
        }
        UserDefaults.standard.set(playerHighScore, forKey: "HighScore")
//        playSound(sound: "high-score", type: "mp3")
        self.objectWillChange.send()
    }
    
    // 1 bet amount
    func betAmout1() {
        SoundManager.instance.playSound(sound: .chips)
        betAmount = 1
        selecteBetAmout1 = true
        selecteBetAmout10 = false
        selecteBetAmout100 = false
        
        if playerCoins < 1 {
            selecteBetAmout1 = false
            popUp = true
        }
        self.objectWillChange.send()
    }
    
    // 10 bet amount
    func betAmout10() {
        SoundManager.instance.playSound(sound: .chips)
        betAmount = 10
        selecteBetAmout10 = true
        selecteBetAmout1 = false
        selecteBetAmout100 = false
        
        if playerCoins < 10 {
            selecteBetAmout10 = false
            popUp = true
        }
        self.objectWillChange.send()
    }
    
    // 100 bet amount
    func betAmout100() {
        SoundManager.instance.playSound(sound: .chips)
        betAmount = 100
        selecteBetAmout100 = true
        selecteBetAmout1 = false
        selecteBetAmout10 = false
        
        if playerCoins < 100 {
            selecteBetAmout100 = false
            popUp = true
        }
        self.objectWillChange.send()
    }
    // when the player coins reach zero
    func gameOver() {
        if playerCoins <= 0 {
            popUp = true
        }
        print("Game over function called")
        self.objectWillChange.send()
    }
    
    func checkPlayerAmount() {
        if playerCoins < 100 {
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
        SoundManager.instance.playSound(sound: .reset)
//        UserDefaults.standard.set(0, forKey: "HighScore")
//        playerHighScore = 0
        playerCoins = 1000
        selecteBetAmout1 = false
        selecteBetAmout10 = false
        selecteBetAmout100 = false
        self.objectWillChange.send()
    }
}
