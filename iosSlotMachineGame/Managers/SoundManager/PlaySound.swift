//
//  PlaySound.swift
//  iosSlotMachineGame
//
//  Created by Wilson Mungai on 2023-02-15.
//

import AVFoundation
import AVKit

class SoundManager {
    
    // create class instance
    static let instance = SoundManager()
    
    enum SoundOptions: String {
        case chips = "chips"
        case reset = "reset"
        case jackpot = "tada"
        case highscore = "highsocre"
        case spin = "spin"
        case menu = "menu"
        case gameOver = "gameover"
        case three = "three"
    }
    
    var player: AVAudioPlayer?
    
    func playSound(sound: SoundOptions) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
       
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }  catch let error {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
