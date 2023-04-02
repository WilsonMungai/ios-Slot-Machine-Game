
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
            .previewLayout(.fixed(width: 300, height: 300))

    }
}
