
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
