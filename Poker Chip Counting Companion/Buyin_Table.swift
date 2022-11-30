//
//  Buyin_Table.swift
//  Poker Chip Counting Companion
//
//  Created by Adish Patil on 10/12/22.
//

import Foundation
import UIKit
import SwiftUI
import CoreBluetooth

struct Buyin_Table: View {
    
    @EnvironmentObject var data:Data
    @EnvironmentObject var bleManager1:BLEManager
    
    var body: some View {
        
        NavigationStack{
            
            VStack{
                
                //Chip Dispense
                Text("Player Buy-In Info ($)").font(.system(size: 35, weight: .bold)).underline().foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 1))).padding(.vertical, 20.0)

                
                VStack(spacing: 6) {
                    Text("Player 1").font(.custom("Inter Medium", size: 20)).foregroundColor(Color(.black))
                    .frame(maxWidth: 331)
                    ZStack() {
                        ZStack {
                            RoundedRectangle(cornerRadius: 2)
                            .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))

                            RoundedRectangle(cornerRadius: 2)
                            .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                        }
                        .frame(width: 250, height: 42)
                        .frame(maxWidth: 331)
                        HStack(spacing: 0) {
                            
                            Text(data.p1_buyin)
                                .font(.title)
                                .foregroundColor(.red)
                            
                            
                        }
                        .frame(maxWidth: 331)
                    }
                    .frame(maxWidth: 331)
                }
                
            
                
                VStack(spacing: 6) {
                    Text("Player 2").font(.custom("Inter Medium", size: 20)).foregroundColor(Color(.black))
                    .frame(maxWidth: 331)
                    ZStack() {
                        ZStack {
                            RoundedRectangle(cornerRadius: 2)
                            .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))

                            RoundedRectangle(cornerRadius: 2)
                            .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                        }
                        .frame(width: 250, height: 42)
                        .frame(maxWidth: 331)
                        HStack(spacing: 0) {
                            
                            Text(data.p2_buyin)
                                .font(.title)
                                .foregroundColor(.red)
                            
                            
                        }
                        .frame(maxWidth: 331)
                    }
                    .frame(maxWidth: 331)
                }
                
                
                VStack(spacing: 6) {
                    Text("Player 3").font(.custom("Inter Medium", size: 20)).foregroundColor(Color(.black))
                    .frame(maxWidth: 331)
                    ZStack() {
                        ZStack {
                            RoundedRectangle(cornerRadius: 2)
                            .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))

                            RoundedRectangle(cornerRadius: 2)
                            .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                        }
                        .frame(width: 250, height: 42)
                        .frame(maxWidth: 331)
                        HStack(spacing: 0) {
                            
                            Text(data.p3_buyin)
                                .font(.title)
                                .foregroundColor(.red)
                            
                            
                        }
                        .frame(maxWidth: 331)
                    }
                    .frame(maxWidth: 331)
                }
                
                
                
                VStack(spacing: 6) {
                    Text("Player 4").font(.custom("Inter Medium", size: 20)).foregroundColor(Color(.black))
                    .frame(maxWidth: 331)
                    ZStack() {
                        ZStack {
                            RoundedRectangle(cornerRadius: 2)
                            .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))

                            RoundedRectangle(cornerRadius: 2)
                            .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                        }
                        .frame(width: 250, height: 42)
                        .frame(maxWidth: 331)
                        HStack(spacing: 0) {
                            
                            Text(data.p4_buyin)
                                .font(.title)
                                .foregroundColor(.red)
                            
                            
                        }
                        .frame(maxWidth: 331)
                    }
                    .frame(maxWidth: 331)
                }
                
                
                VStack(spacing: 6) {
                    Text("Player 5").font(.custom("Inter Medium", size: 20)).foregroundColor(Color(.black))
                    .frame(maxWidth: 331)
                    ZStack() {
                        ZStack {
                            RoundedRectangle(cornerRadius: 2)
                            .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))

                            RoundedRectangle(cornerRadius: 2)
                            .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                        }
                        .frame(width: 250, height: 42)
                        .frame(maxWidth: 331)
                        HStack(spacing: 0) {
                            
                            Text(data.p5_buyin)
                                .font(.title)
                                .foregroundColor(.red)
                            
                            
                        }
                        .frame(maxWidth: 331)
                    }
                    .frame(maxWidth: 331)
                }
                

                
                VStack(spacing: 6) {
                    Text("Player 6").font(.custom("Inter Medium", size: 20)).foregroundColor(Color(.black))
                    .frame(maxWidth: 331)
                    ZStack() {
                        ZStack {
                            RoundedRectangle(cornerRadius: 2)
                            .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))

                            RoundedRectangle(cornerRadius: 2)
                            .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                        }
                        .frame(width: 250, height: 42)
                        .frame(maxWidth: 331)
                        HStack(spacing: 0) {
                            
                            Text(data.p6_buyin)
                                .font(.title)
                                .foregroundColor(.red)
                            
                            
                        }
                        .frame(maxWidth: 331)
                    }
                    .frame(maxWidth: 331)
                }
                
                
                VStack(spacing: 6) {
                    Text("Player 7").font(.custom("Inter Medium", size: 20)).foregroundColor(Color(.black))
                    .frame(maxWidth: 331)
                    ZStack() {
                        ZStack {
                            RoundedRectangle(cornerRadius: 2)
                            .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))

                            RoundedRectangle(cornerRadius: 2)
                            .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                        }
                        .frame(width: 250, height: 42)
                        .frame(maxWidth: 331)
                        HStack(spacing: 0) {
                            
                            Text(data.p7_buyin)
                                .font(.title)
                                .foregroundColor(.red)
                            
                            
                        }
                        .frame(maxWidth: 331)
                    }
                    .frame(maxWidth: 331)
                }
                
                
                VStack(spacing: 6) {
                    Text("Player 8").font(.custom("Inter Medium", size: 20)).foregroundColor(Color(.black))
                    .frame(maxWidth: 331)
                    ZStack() {
                        ZStack {
                            RoundedRectangle(cornerRadius: 2)
                            .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))

                            RoundedRectangle(cornerRadius: 2)
                            .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                        }
                        .frame(width: 250, height: 42)
                        .frame(maxWidth: 331)
                        HStack(spacing: 0) {
                            
                            Text(data.p8_buyin)
                                .font(.title)
                                .foregroundColor(.red)
                            
                            
                        }
                        .frame(maxWidth: 331)
                    }
                    .frame(maxWidth: 331)
                }
                .padding(.bottom, 5.0)
            }
            
            HStack{
                Button("Prepare Collection"){
                    self.bleManager1.writeOutgoingValue(data: "100000000")
                }
                .font(.title2)
                .foregroundColor(.green)
                
                NavigationLink("Start Collection", destination: Collection_Queue())
                    .padding(.all)
                    .font(.title2)
            }
            Spacer()
        }
    }
}


struct Buyin_Table_Previews: PreviewProvider {
    static var previews: some View {
        Buyin_Table().environmentObject(Data()).environmentObject(BLEManager())
    }
}
