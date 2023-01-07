//
//  DetailCardView.swift
//  WalletAnimation
//
//  Created by Sergey Lukaschuk on 2023-01-07.
//

import SwiftUI

struct DetailCardView: View {
    @Binding var animation: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(Date().formatted(date: .abbreviated, time: .omitted))
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            
            Text("633.50")
                .font(.title.bold())
                .foregroundColor(.white)
                .offset(x: animation ? 0 : 100)
                .opacity(animation ? 1 : 0)
                .animation(.easeInOut(duration: 0.6).speed(0.7).delay(1.5), value: animation)
            
            HStack {
                ButtonManage()
                
                ButtonPayNow()
            }
            .offset(y: animation ? 0 : 100)
            .animation(.easeInOut(duration: 0.8).delay(1.8), value: animation)
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .overlay(alignment: .topTrailing) {
            ButtonDue()
                .offset(x: animation ? 0 : -100)
                .opacity(animation ? 1 : 0)
                .animation(.easeInOut(duration: 0.8).speed(0.8).delay(1.7), value: animation)
        }
        .padding(.vertical, 15)
        .rotation3DEffect(.init(degrees: animation ? 0 : 30), axis: (x: 1, y: 0, z: 0))
        .offset(y: animation ? 0 : -200)
        .opacity(animation ? 1 : 0)
        .animation(.interactiveSpring(response: 1, dampingFraction: 0.9, blendDuration: 1).delay(1.2), value: animation)
    }
    
    @ViewBuilder
    private func ButtonManage() -> some View {
        Button {
            // Action
        } label: {
            Text("Manage")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 25)
                .background {
                    Capsule()
                        .stroke(.white, lineWidth: 1)
                }
        }
    }
    
    @ViewBuilder
    private func ButtonPayNow() -> some View {
        Button {
            // Action
        } label: {
            Text("Pay Now")
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.vertical, 10)
                .padding(.horizontal, 25)
                .background {
                    Capsule()
                        .fill(.white)
                }
        }
    }
    
    @ViewBuilder
    private func ButtonDue() -> some View {
        Button {
            // Action
        } label: {
            Text("Due")
                .fontWeight(.semibold)
                .foregroundColor(.orange)
                .underline(true, color: .orange)
        }
        .padding()
    }
}
