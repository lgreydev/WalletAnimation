//
//  CVView.swift
//  WalletAnimation
//
//  Created by Sergey Lukaschuk on 2023-01-07.
//

import SwiftUI

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
