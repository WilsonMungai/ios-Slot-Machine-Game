//
//  Modifiers.swift
//  iosSlotMachineGame
//
//  Created by Wilson Mungai on 2023-01-21.
//

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
            .padding(.horizontal)
            .frame(minWidth: 128)
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
