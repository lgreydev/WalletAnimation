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
    //    @State var animateText: [Bool] = [false, false]
    @State var backgroundWidth: CGFloat? = 60
    
    var body: some View {
        VStack(spacing: 15) {
            HeaderView()
            
            CardView(cardColor: .white, balance: "5531.24", cardNumber: "4522")
                .padding(.top, 10)
            
            DetailCardView()
            
            CardView(cardColor: .orange, balance: "1201.78", cardNumber: "3351")
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
                
            }
        }
        .background {
            Color.white
                .ignoresSafeArea()
        }
        
        //        (Color.black).frame(width: backgroundWidth)
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("My Cards")
                .font(.title.bold())
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
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
    }
}

struct CardView: View {
    
    @State var animateText: [Bool] = [false, false]
    
    var cardColor: Color
    var balance: String
    var cardNumber: String
    
    init(cardColor: Color = .clear, balance: String = "0000", cardNumber: String = "00") {
        self.cardColor = cardColor
        self.balance = balance
        self.cardNumber = cardNumber
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Image("mastercard-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
            
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
