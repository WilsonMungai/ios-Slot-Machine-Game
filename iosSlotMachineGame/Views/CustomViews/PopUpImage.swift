
import SwiftUI

struct PopUpImage: View {
    // MARK: - Logo Body
    var body: some View {
        Image("dealer")
            .resizable()
            .scaledToFit()
            .frame(maxHeight: 172)
    }
}

struct PopUpImage_Previews: PreviewProvider {
    static var previews: some View {
        PopUpImage()
    }
}
