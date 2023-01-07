//
//  CardView.swift
//  WalletAnimation
//
//  Created by Sergey Lukaschuk on 2023-01-07.
//

import SwiftUI

struct CardView: View {
    
    @Binding var animateText: [Bool]
    @Binding var animation: Bool
    
    var cardColor: Color
    var balance: String
    var cardNumber: String
    
    init(cardColor: Color = .clear, balance: String = "0000", cardNumber: String = "00", animation: Binding<Bool>, animateText: Binding<[Bool]>) {
        self.cardColor = cardColor
        self.balance = balance
        self.cardNumber = cardNumber
        self._animation = animation
        self._animateText = animateText
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Image("mastercard-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
                .offset(x: animation ? 0 : 15, y: animation ? 0 : 15)
                .opacity(animation ? 1 : 0)
                .animation(.easeOut(duration: 1).delay(1), value: animation)
            
            HStack(spacing: 4) {
                Text("$")
                    .font(.title.bold())
                
                let separationString: [String] = balance.components(separatedBy: ".")
                if separationString.indices.contains(0), animateText[0] {
                    RollingText(font: .title, weight: .bold, animationDuration: 1.5, value: .constant(NSString(string: separationString[0]).integerValue))
                        .transition(.opacity)
                }
                
                Text(".")
                    .font(.title.bold())
                    .padding(.horizontal, -4)
                
                if separationString.indices.contains(1), animateText[1] {
                    RollingText(font: .title, weight: .bold, animationDuration: 1.5, value: .constant(NSString(string: separationString[1]).integerValue))
                        .transition(.opacity)
                }
                
            }
            .opacity(animation ? 1 : 0)
            .animation(.easeIn(duration: 1).delay(1.2), value: animation)
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(alignment: .trailing) {
                CVView()
                    .opacity(animation ? 1 : 0)
                    .offset(x: animation ? 0 : 70)
                    .animation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1).delay(1.6), value: animation)
            }
            
            Text("Balance")
                .fontWeight(.semibold)
                .opacity(animation ? 1 : 0)
                .offset(y: animation ? 0 : 70)
                .animation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1).delay(1.5), value: animation)
            
            HStack {
                Text("**** **** ****")
                    .font(.title)
                    .fontWeight(.semibold)
                    .kerning(3)
                
                Text(cardNumber)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .offset(y: -6)
            }
            .opacity(animation ? 1 : 0)
            .offset(y: animation ? 0 : 70)
            .animation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1).delay(1.6), value: animation)
        }
        .foregroundColor(.black)
        .padding(10)
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity)
        .background(cardColor)
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .rotation3DEffect(.init(degrees: animation ? 0 : -70), axis: (x: 1, y: 0, z: 0), anchor: .center)
        .scaleEffect(animation ? 1 : 0.001, anchor: .bottom)
        .animation(.interactiveSpring(response: 1, dampingFraction: 0.7, blendDuration: 1).delay(0.9), value: animation)
    }
}
