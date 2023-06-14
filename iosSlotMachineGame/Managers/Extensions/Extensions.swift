
import SwiftUI

// MARK: - Text extension
extension Text {
    func playerScoreLabel() -> Text {
            self.foregroundColor(Color("gold"))
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
    
    // MARK: - playerScore text extension
    func playerScore() -> Text {
            self.foregroundColor(Color("gold"))
            .fontWeight(.heavy)
            .font(.system(.title, design: .rounded))
    }
    
    // MARK: - pop up title
    func betAmountLabel() -> Text {
            self.font(.system(size: 30, weight: .bold, design: .rounded))
            .fontWeight(.heavy)
            .font(.system(.title, design: .rounded))
    }
    
    // MARK: - pop up message
    func popUpMessage() -> Text {
            self.font(.system(size: 20, weight: .bold, design: .rounded))
            .fontWeight(.semibold)
            .font(.system(.title, design: .rounded))
    }
    
    func rewardDetails() -> Text {
        self.font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(Color(.systemGray2))
            .fontWeight(.bold)
            
    }
}
