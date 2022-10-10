//
//  DispensingInfo.swift
//  Poker Chip Counting Companion
//
//  Created by Adish Patil on 10/9/22.
//

import SwiftUI

struct DispensingInfo: View {
    var body: some View {
        //StatusBar / iPhone 13
        VStack{
            Rectangle()
            .fill(Color.clear)
            .frame(width: 390, height: 47)
            
            
            PokerLogo()
                .offset(y:-130)
                .padding(.bottom, -100)
            Button("Poker Chip \n Counting Companion") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .padding(.all)
                .font(.largeTitle)
                .background(Color.white)

                
            VStack (alignment: .center) {
//                Text("Poker Chip")
//                    .font(.largeTitle)
//                Text("Counting Companion")
//                    .font(.largeTitle)

                Divider()
                VStack (alignment: .center){
                    Text("Click the button to begin.")
                            .foregroundColor(.primary)
                            .font(.title2)
                            .padding(.bottom)
                    Text("NATIONAL PROBLEM GAMBLING HELPLINE \n                       1-800-522-4700")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                }
            }
        }
        .padding()
        Spacer()
    }
}

struct DispensingInfo_Previews: PreviewProvider {
    static var previews: some View {
        DispensingInfo()
    }
}
