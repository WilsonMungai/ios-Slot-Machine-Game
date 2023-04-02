
import SwiftUI

struct gameLogo: View {
    // MARK: - Logo Body
    var body: some View {
        Image("casino-logo")
            .resizable()
            .scaledToFit()
            .layoutPriority(1)
            .frame(minWidth: 256, idealWidth: 300, maxWidth: 320, minHeight: 112, idealHeight: 130, maxHeight: 140, alignment: .center)
            .modifier(Shadow())
            .padding(.horizontal)
        
            
        
    }
}

struct gameLogo_Previews: PreviewProvider {
    static var previews: some View {
        gameLogo()
    }
}
