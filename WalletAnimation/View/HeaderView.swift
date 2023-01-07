//
//  HeaderView.swift
//  WalletAnimation
//
//  Created by Sergey Lukaschuk on 2023-01-07.
//

import SwiftUI

struct HeaderView: View {
    @Binding var animation: Bool
    
    var body: some View {
        HStack {
            Text("My Cards")
                .font(.title.bold())
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(animation ? 1 : 0)
                .offset(x: animation ? 0 : 100)
                .animation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1).delay(0.9), value: animation)
            
            ButtonPlus()
        }
    }
    
    @ViewBuilder
    private func ButtonPlus() -> some View {
        Button {
            // Action
        } label: {
            Image(systemName: "plus")
                .font(.title2.bold())
                .foregroundColor(.black)
                .padding(10)
                .background {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(.white)
                }
        }
        .scaleEffect(animation ? 1 : 0.001)
        .animation(.interactiveSpring(response: 1, dampingFraction: 0.6, blendDuration: 0.7).delay(0.7), value: animation)
    }
}
