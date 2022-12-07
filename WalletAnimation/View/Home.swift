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
        .padding(15)
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
    var cardColor: Color = .white

    @State var value: Int = 111

    var body: some View {
        VStack {
            Image("mastercard-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)

            HStack(spacing: 4) {
                Text("$")
                    .font(.title.bold())
                    .foregroundColor(.black)

                RollingText(value: .constant(100))
            }
        }
        .padding(15)
        .background(cardColor)
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
//        .clipShape(Circle())
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
