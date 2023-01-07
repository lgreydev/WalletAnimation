//
//  Home.swift
//  WalletAnimation
//
//  Created by Sergey Lukaschuk on 2022-11-30.
//

import SwiftUI

struct Home: View {
    @State var startAnimation: Bool = false
    @State var animateContent: Bool = false
    @State var backgroundWidth: CGFloat? = 60
    @State var animateText: [Bool] = [false, false]
    
    var body: some View {
        VStack(spacing: 15) {
            HeaderView(animation: $startAnimation)
            
            CardView(cardColor: .white, balance: "5531.24", cardNumber: "4522", animation: $startAnimation, animateText: $animateText)
                .padding(.top, 10)
                .zIndex(1)
            
            DetailCardView(animation: $startAnimation)
                .zIndex(0)
            
            CardView(cardColor: .indigo, balance: "1201.78", cardNumber: "3351", animation: $startAnimation, animateText: $animateText)
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background {
            Color.black
                .frame(width: backgroundWidth)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .ignoresSafeArea()
        }
        .overlay(alignment: .trailing) {
            HStack( spacing: 10) {
                Text("My Cards")
                Image(systemName: "chevron.right")
            }
            .font(.system(size: 19))
            .fontWeight(.semibold)
            .contentShape(Rectangle())
            .onTapGesture {
                animatePage()
            }
            .rotationEffect(.init(degrees: -90))
            .offset(x: startAnimation ? 120 : 22)
            .opacity(startAnimation ? 0 : 1)
        }
        .background {
            Color.white
                .ignoresSafeArea()
        }
    }
    
    private func animatePage() {
        withAnimation(.easeOut(duration: 0.4)) {
            backgroundWidth = 40
        }
        
        withAnimation(.interactiveSpring(response: 1.1, dampingFraction: 0.75, blendDuration: 0).delay(0.3)) {
            backgroundWidth = nil
            startAnimation = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            animateText[0] = true
            animateText[1] = true
        }
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
