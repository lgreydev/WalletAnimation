//
//  ContentView.swift
//  WalletAnimation
//
//  Created by Sergey Lukaschuk on 2022-11-30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
