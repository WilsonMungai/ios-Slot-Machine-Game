//
//  PlaceBetImage.swift
//  iosSlotMachineGame
//
//  Created by Wilson Mungai on 2023-02-05.
//

import SwiftUI

struct PlaceBetImage: View {
    var body: some View {
        Image("bet")
            .resizable()
            .scaledToFit()
            .frame(maxHeight: 172)
    }
}

struct PlaceBetImage_Previews: PreviewProvider {
    static var previews: some View {
        PlaceBetImage()
    }
}
