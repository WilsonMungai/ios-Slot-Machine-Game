//
//  JackpotImage.swift
//  iosSlotMachineGame
//
//  Created by Wilson Mungai on 2023-02-05.
//

import SwiftUI

struct JackpotImage: View {
    var body: some View {
        Image("jackpot")
            .resizable()
            .scaledToFit()
            .frame(maxHeight: 172)
    }
}

struct JackpotImage_Previews: PreviewProvider {
    static var previews: some View {
        JackpotImage()
    }
}
