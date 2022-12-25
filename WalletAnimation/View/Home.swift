//
//  Home.swift
//  WalletAnimation
//
//  Created by Sergey Lukaschuk on 2022-11-30.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(spacing: 15) {
            HeaderView()
            
            CardView()
                .padding(.top, 10)
            
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.black)
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("My Cards")
                .font(.title.bold())
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                
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
}

struct CardView: View {
    
    let spent: String = "5531.24"
    let cardNumber: String = "4522"
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Image("mastercard-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
            
            HStack(spacing: 4) {
                Text("$")
                    .font(.title.bold())

                let separationString: [String] = spent.components(separatedBy: ".")
                if separationString.indices.contains(0) {
                    RollingText(font: .title, weight: .bold, value: .constant(NSString(string: separationString[0]).integerValue))
                }
                
                Text(".")
                    .font(.title.bold())
                    .padding(.horizontal, -4)
                
                if separationString.indices.contains(1) {
                    RollingText(font: .title, weight: .bold, value: .constant(NSString(string: separationString[1]).integerValue))
                }
                
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
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
