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
    
    var body: some View {
        VStack(spacing: 15) {
            HeaderView(animation: $startAnimation)
            
            CardView(cardColor: .white, balance: "5531.24", cardNumber: "4522", animation: $startAnimation)
                .padding(.top, 10)
                .zIndex(1)
            
            DetailCardView(animation: $startAnimation)
                .zIndex(0)
            
            CardView(cardColor: .orange, balance: "1201.78", cardNumber: "3351", animation: $startAnimation)
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
            .rotationEffect(.init(degrees: -90))
            .offset(x: 22)
            .onTapGesture {
                animatePage()
            }
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
    }
}

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

struct CardView: View {
    
    @State var animateText: [Bool] = [false, false]
    @Binding var animation: Bool
    
    var cardColor: Color
    var balance: String
    var cardNumber: String
    
    init(cardColor: Color = .clear, balance: String = "0000", cardNumber: String = "00", animation: Binding<Bool>) {
        self.cardColor = cardColor
        self.balance = balance
        self.cardNumber = cardNumber
        self._animation = animation
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
                }
                
                Text(".")
                    .font(.title.bold())
                    .padding(.horizontal, -4)
                
                if separationString.indices.contains(1), animateText[1] {
                    RollingText(font: .title, weight: .bold, animationDuration: 1.5, value: .constant(NSString(string: separationString[1]).integerValue))
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(alignment: .trailing) {
                CVView()
            }
            
            Text("Balance")
                .fontWeight(.semibold)
            
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

struct CVView: View {
    var body: some View {
        HStack(spacing: 5) {
            ForEach(1...3, id: \.self ) { _ in
                Circle()
                    .frame(width: 8, height: 8)
            }
        }
        .padding(.trailing, 8)
    }
}

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
            
            HStack {
                ButtonManage()
                
                ButtonPayNow()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .overlay(alignment: .topTrailing) {
            ButtonDue()
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



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
