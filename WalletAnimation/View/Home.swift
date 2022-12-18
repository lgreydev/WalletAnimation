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
    
    /*
     @ViewBuilder
     func CardView() -> some View {
     VStack(alignment: .leading, spacing: 15) {
     Image("mastercard-logo")
     .resizable()
     .aspectRatio(contentMode: .fit)
     .frame(width: 45, height: 45)
     
     HStack(spacing: 4) {
     Text("$")
     .font(.title.bold())
     .foregroundColor(.black)
     .font(.title.bold())
     .foregroundColor(.black)
     
     RollingText(font: .title, weight: .bold, value: .constant(5224))
     
     Text(".")
     .font(.title.bold())
     
     RollingText(font: .title, weight: .bold, value: .constant(59))
     }
     }
     .foregroundColor(.black)
     .padding(15)
     .background(.white)
     .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
     }
     */
    
    /*
    @ViewBuilder
    func HeaderView() -> some View {
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
     */
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
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Image("mastercard-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
            
            HStack(spacing: 4) {
                Text("$")
                    .font(.title.bold())
                    .foregroundColor(.black)
                    .font(.title.bold())
                    .foregroundColor(.black)
                
                RollingText(font: .title, weight: .bold, value: .constant(5224))
                
                Text(".")
                    .font(.title.bold())
                
                RollingText(font: .title, weight: .bold, value: .constant(59))
            }
        }
        .foregroundColor(.black)
        .padding(15)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
