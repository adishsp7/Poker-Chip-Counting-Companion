//
//  PokerLogo.swift
//  Poker Chip Counting Companion
//
//  Created by Adish Patil on 10/9/22.
//

import SwiftUI

struct PokerLogo: View {
    var body: some View {
        Image("casino-chip")
            .resizable()
            .frame(width: 200, height: 200)
            .aspectRatio(CGSize(width: 1, height: 1), contentMode: .fit)
//            .clipShape(RoundedRectangle(cornerRadius: 3))
//            .overlay {
//                RoundedRectangle(cornerRadius: 3).stroke(.white, lineWidth: 4)
//            }
//            .shadow(radius: 3)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.black, lineWidth: 5)
            }
            .shadow(radius: 3)
    }
}

struct PokerLogo_Previews: PreviewProvider {
    static var previews: some View {
        PokerLogo()
    }
}
