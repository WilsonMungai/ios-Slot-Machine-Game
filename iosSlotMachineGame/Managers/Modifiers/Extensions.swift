//
//  Extensions.swift
//  iosSlotMachineGame
//
//  Created by Wilson Mungai on 2023-01-21.
//

import SwiftUI

// MARK: - Text extension
extension Text {
    func playerScoreLabel() -> Text {
        self .foregroundColor(Color("gold"))
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
    
    // MARK: playerScore extension
    func playerScore() -> Text {
        self .foregroundColor(Color("gold"))
            .fontWeight(.heavy)
            .font(.system(.title, design: .rounded))
    }
}
