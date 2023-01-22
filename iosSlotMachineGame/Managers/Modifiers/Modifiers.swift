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
            .padding(.horizontal, 16)
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

// MARK: - Image Modifier
struct ImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(minWidth: 90, idealWidth: 120, maxWidth: 140, minHeight: 85,
                   idealHeight: 105, maxHeight: 120, alignment: .center)
            .modifier(Shadow())
    }
}

// MARK: - Spinner Modifier
struct SpinnerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(minWidth: 100, idealWidth: 140, maxWidth: 160, minHeight: 105,
                   idealHeight: 125, maxHeight: 140, alignment: .center)
            .modifier(Shadow())
    }
}

// MARK: - Spinner Modifier
struct BetAmountModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(minWidth: 50, idealWidth: 70, maxWidth: 80, minHeight: 50,
                   idealHeight: 60, maxHeight: 70, alignment: .center)
            .modifier(Shadow())
    }
}

// MARK: - Shadow modifier
struct BetAmountShadow: ViewModifier {
    func body(content: Content) -> some View {
        content .shadow(color: Color("transparent"), radius: 0, x: 0, y: 3)
    }
}

// MARK: - Reset button modifier
struct ResetbuttonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
        .accentColor(.white)
    }
}
