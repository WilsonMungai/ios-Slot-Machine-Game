//
//  SplashScreen.swift
//  iosSlotMachineGame
//
//  Created by Wilson Mungai on 2023-02-18.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        ZStack {
//            // Background Gradient
//            LinearGradient(colors: [Color("black"), Color("gold")], startPoint: .top,
//                           endPoint: .bottom)
//            // Extend gradient outside the safe area
//            .edgesIgnoringSafeArea(.all)
            if isActive {
                ContentView()
            } else {
                VStack {
                      
                        Image("casino-logo")
                        .resizable()
                        .scaledToFit()
                        .layoutPriority(1)
                        .frame(minWidth: 306, idealWidth: 350, maxWidth: 370, minHeight: 162, idealHeight: 180, maxHeight: 190, alignment: .center)
                        .modifier(Shadow())
                        .padding(.horizontal)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        size = 0.9
                        opacity = 1.0
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }

            
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
