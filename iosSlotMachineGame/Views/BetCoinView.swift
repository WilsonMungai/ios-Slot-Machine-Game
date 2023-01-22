//
//  BetCoinView.swift
//  iosSlotMachineGame
//
//  Created by Wilson Mungai on 2023-01-22.
//

import SwiftUI

struct BetCoinView: View {
    var body: some View {
        Image("casino-chip")
            .resizable()
            .modifier(BetAmountModifier())
    }
}

struct BetCoinView_Previews: PreviewProvider {
    static var previews: some View {
        BetCoinView()
    }
}
