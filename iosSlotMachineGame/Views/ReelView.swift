//
//  ReelView.swift
//  iosSlotMachineGame
//
//  Created by Wilson Mungai on 2023-01-21.
//

import SwiftUI

struct ReelView: View {
    var body: some View {
        Image("reel-container")
            .resizable()
            .modifier(ReelImageModifier())
    }
}

struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ReelView()
            .previewLayout(.fixed(width: 200, height: 200))

    }
}
