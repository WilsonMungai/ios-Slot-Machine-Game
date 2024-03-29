
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
            .frame(minWidth: 200)
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

// MARK: - Bet Amount modifier
struct BetAmountModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(minWidth: 50, idealWidth: 70, maxWidth: 80, minHeight: 50,
                   idealHeight: 60, maxHeight: 70, alignment: .center)
            .modifier(Shadow())
    }
}

// MARK: - Bet Amount Shadow modifier
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
            .accentColor(Color("gold"))
    }
}

// MARK: - Pop Up Modifiers
// MARK: - Game Over Label modifier
struct GameOverLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color(.white))
            .foregroundColor(Color("gold"))
            .multilineTextAlignment(.center)
    }
}

// MARK: - Pop Up Message Modifier
struct PopUpMessageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .foregroundColor(Color.white)
            .layoutPriority(1)
    }
}

// MARK: - Pop Up Message Modifier
struct PopUpButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .accentColor(Color(.white))
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .frame(minWidth: 128)
            .background(Capsule()
                .strokeBorder(lineWidth: 1.75)
                .foregroundColor(Color(.white)))
    }
}

// MARK: - Pop Up Message Modifier
struct PopUpView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 220, idealWidth: 300, maxWidth: 340, minHeight: 360, idealHeight: 460, maxHeight: 420, alignment: .center)
                .background(Color("gold"))
                .cornerRadius(20)
                .shadow(color: Color("transparent"), radius: 6, x: 0, y: 8)
                
                
    }
}

// MARK: - Pop Up Message Modifier
struct RewardImages: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .layoutPriority(1)
            .frame(minWidth: 20, idealWidth: 50, maxWidth: 60, minHeight: 20, idealHeight: 50, maxHeight: 60, alignment: .center)
            .modifier(Shadow())
    }
}
    


   




   

    


