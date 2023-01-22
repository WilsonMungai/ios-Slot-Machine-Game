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
