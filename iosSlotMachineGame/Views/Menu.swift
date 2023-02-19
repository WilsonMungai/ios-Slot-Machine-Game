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
                Section(header: Text("Points")
                    .font(.system(size: 20, weight: .bold, design: .rounded))) {
                        RewardRowView(rewardImage: "banana", rewardPoints: "Banana \n x2 +40pts")
                        RewardRowView(rewardImage: "orange", rewardPoints: "Orange \n x2 +50pts")
                        RewardRowView(rewardImage: "strawberry", rewardPoints: "Strawberry \n x2 +60pts")
                        RewardRowView(rewardImage: "grape", rewardPoints: "Grape \n x2 +70pts")
                        RewardRowView(rewardImage: "cherry", rewardPoints: "Cherry \n x2 +80pts")
                        RewardRowView(rewardImage: "coin", rewardPoints: "Coin \n x2 +90pts")
                        RewardRowView(rewardImage: "bell", rewardPoints: "Bell \n x2 +100pts")
                        RewardRowView(rewardImage: "seven", rewardPoints: "Seven \n x2 +120pts")
                        RewardRowView(rewardImage: "bar", rewardPoints: "Bar \n x2 -100pts")
                        HStack {
                            Image("seven")
                                .resizable()
                                .modifier(RewardImages())
                            Image("seven")
                                .resizable()
                                .modifier(RewardImages())
                            Image("seven")
                                .resizable()
                                .modifier(RewardImages())
                            Spacer()
                            Text ("JackPot!!!")
                                .rewardDetails()
                                .multilineTextAlignment(.trailing)
                        }
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
