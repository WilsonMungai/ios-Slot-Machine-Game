//
//  Menu.swift
//  iosSlotMachineGame
//
//  Created by Wilson Mungai on 2023-02-14.
//

import SwiftUI

struct Menu: View {
    
//    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Form{
                Section(header: Text("Rewards")
                    .font(.system(size: 20, weight: .bold, design: .rounded))) {
                        RewardRowView(rewardImage: "banana", rewardPoints: "Banana \n +20pts")
                        RewardRowView(rewardImage: "orange", rewardPoints: "Orange \n +25pts")
                        RewardRowView(rewardImage: "strawberry", rewardPoints: "Strawberry \n +30pts")
                        RewardRowView(rewardImage: "grape", rewardPoints: "Grape \n +35pts")
                        RewardRowView(rewardImage: "cherry", rewardPoints: "Cherry \n +40pts")
                        RewardRowView(rewardImage: "coin", rewardPoints: "Coin \n +45pts")
                        RewardRowView(rewardImage: "bell", rewardPoints: "Bell \n +50pts")
                        RewardRowView(rewardImage: "seven", rewardPoints: "Seven \n +60pts")
                        RewardRowView(rewardImage: "bar", rewardPoints: "Bar \n -50pts")
                    }
            }
        }
        .overlay (
            Button(action: {
                //
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .font(.system(size: 30))
            } .padding(.top, 10)
                .padding(.trailing, 20)
                .accentColor(.secondary), alignment: .topTrailing
        )
    }
}

struct RewardRowView: View {
    var rewardImage: String
    var rewardPoints: String
    var body: some View {
        HStack{
            Image(rewardImage)
                .resizable()
                .modifier(RewardImages())
            Spacer()
            Text(rewardPoints)
                .rewardDetails()
                .multilineTextAlignment(.trailing)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
