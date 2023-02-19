//
//  HapticManager.swift
//  iosSlotMachineGame
//
//  Created by Wilson Mungai on 2023-02-17.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager() // singleton
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
