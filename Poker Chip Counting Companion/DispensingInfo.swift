//
//  DispensingInfo.swift
//  Poker Chip Counting Companion
//
//  Created by Adish Patil on 10/9/22.
//
import Foundation
import UIKit
import SwiftUI
import CoreBluetooth

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}


struct DispensingInfo: View {
    
    @EnvironmentObject var data:Data
    
    var body: some View {

        ScrollView{
            
            VStack{
                
                //Please enter the all the g...
                Text("Please enter the all the game information below to be given the correct amount of chips for your Poker Game and press submit before dispensing...").font(.system(size: 20, weight: .regular)).multilineTextAlignment(.center).padding(.bottom, -12.0)
                
                //Rectangle 1
                ZStack {
                    
                    VStack{
                        //Chip Values ($)
                        Text("Chip Values ($)").font(.system(size: 36, weight: .bold)).underline().foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 1))).padding(.bottom, -4.0)
                        
                        HStack{
                            //form/03 component/textFiel...
                            VStack(spacing: 6) {
                                Text(" Red Chips").font(.system(size: 16, weight: .medium))
                                    .frame(maxWidth: 139)
                                ZStack() {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 2)
                                            .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))
                                        
                                        RoundedRectangle(cornerRadius: 2)
                                            .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                                    }
                                    .frame(width: 139, height: 42)
                                    .frame(maxWidth: 139)
                                    HStack(spacing: 0) {

//                                        TextField("Eg.5", text: $red_value.value)
//                                            .multilineTextAlignment(.center)
//                                            .padding()
//                                            .keyboardType(.decimalPad)
                                        
                                        TextField("Eg.5", text: $data.red_value)
                                            .multilineTextAlignment(.center)
                                            .padding()
                                            .keyboardType(.decimalPad)
                                    
                                    }
                                    .frame(maxWidth: 139)

                                }
                                .frame(maxWidth: 139)
                            }
                            .background(Color(#colorLiteral(red: 1, green: 0.23137255012989044, blue: 0.1882352977991104, alpha: 1)))
                            .overlay(Rectangle().strokeBorder(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1))
                            .padding()
                            
                            //form/03 component/textFiel...
                            VStack(spacing: 6) {
                                Text(" White Chips").font(.system(size: 16, weight: .medium))
                                    .frame(maxWidth: 139)
                                ZStack() {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 2)
                                            .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))
                                        
                                        RoundedRectangle(cornerRadius: 2)
                                            .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                                    }
                                    .frame(width: 139, height: 42)
                                    .frame(maxWidth: 139)
                                    HStack(spacing: 0) {
//                                        Text("Eg. 5").font(.custom("Inter Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 0.3)))
//                                        TextField("Eg.5", text: $white_value.value)
//                                            .multilineTextAlignment(.center)
//                                            .padding()
//                                            .keyboardType(.decimalPad)
                                        
                                        TextField("Eg.5", text: $data.white_value)
                                            .multilineTextAlignment(.center)
                                            .padding()
                                            .keyboardType(.decimalPad)
                                    }
                                    .frame(maxWidth: 139)
                                }
                                .frame(maxWidth: 139)
                            }
                            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .overlay(Rectangle().strokeBorder(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1))
                            
                        }
                        HStack {
                            //form/03 component/textFiel...
                            VStack(spacing: 6) {
                                Text(" Green Chips").font(.system(size: 16, weight: .medium))
                                    .frame(maxWidth: 139)
                                ZStack() {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 2)
                                            .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))
                                        
                                        RoundedRectangle(cornerRadius: 2)
                                            .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                                    }
                                    .frame(width: 139, height: 42)
                                    .frame(maxWidth: 139)
                                    HStack(spacing: 0) {
//                                        Text("Eg. 5").font(.custom("Inter Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 0.3)))
//                                        TextField("Eg.5", text: $green_value.value)
//                                            .multilineTextAlignment(.center)
//                                            .padding()
//                                            .keyboardType(.decimalPad)
                                        
                                        TextField("Eg.5", text: $data.green_value)
                                            .multilineTextAlignment(.center)
                                            .padding()
                                            .keyboardType(.decimalPad)
                                        
                                    }
                                    .frame(maxWidth: 139)
                                }
                                .frame(maxWidth: 139)
                            }
                            .background(Color(#colorLiteral(red: 0.1882352977991104, green: 0.8588235378265381, blue: 0.35686275362968445, alpha: 1)))
                            .overlay(Rectangle().strokeBorder(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1))
                            .padding()
                            
                            //form/03 component/textFiel...
                            VStack(spacing: 6) {
                                Text(" Blue Chips").font(.system(size: 16, weight: .medium))
                                    .frame(maxWidth: 139)
                                ZStack() {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 2)
                                            .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))
                                        
                                        RoundedRectangle(cornerRadius: 2)
                                            .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                                    }
                                    .frame(width: 139, height: 42)
                                    .frame(maxWidth: 139)
                                    HStack(spacing: 0) {
//                                        Text("Eg. 5").font(.custom("Inter Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 0.3)))
//                                        TextField("Eg.5", text: $blue_value.value)
//                                            .multilineTextAlignment(.center)
//                                            .padding()
//                                            .keyboardType(.decimalPad)
                                        
                                        TextField("Eg.5", text: $data.blue_value)
                                            .multilineTextAlignment(.center)
                                            .padding()
                                            .keyboardType(.decimalPad)
                                        
                                    }
                                    .frame(maxWidth: 139)
                                }
                                .frame(maxWidth: 139)
                            }
                            .background(Color(#colorLiteral(red: 0, green: 0.39999985694885254, blue: 1, alpha: 1)))
                            .overlay(Rectangle().strokeBorder(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1))
                            
                            
                        }
                        .padding(.bottom, -19.0)
                    }
                    
                }
                .frame(width: 367, height: 284)
                .padding()
                
                //Rectangle 1
                ZStack {
                    //                Rectangle()
                    //                .fill(Color(#colorLiteral(red: 0.9666666388511658, green: 0.9626388549804688, blue: 0.9626388549804688, alpha: 1)))
                    //
                    //                Rectangle()
                    //                .strokeBorder(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1)
                    
                    VStack {
                        
                        //Blinds ($)
                        Text("Blinds ($)").font(.system(size: 36, weight: .bold)).underline().foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 1))).padding(.bottom, -4.0)
                        
                        HStack{
                            //form/03 component/textFiel...
                            VStack(spacing: 4) {
                                Text("Small Blind").font(.system(size: 16, weight: .medium))
                                    .frame(maxWidth: 139)
                                ZStack() {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 2)
                                            .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))
                                        
                                        RoundedRectangle(cornerRadius: 2)
                                            .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                                    }
                                    .frame(width: 139, height: 42)
                                    .frame(maxWidth: 139)
                                    HStack(spacing: 0) {
//                                        Text("Eg. 10").font(.custom("Inter Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 0.3)))
//                                        TextField("Eg.10", text: $small_blind.value)
//                                            .multilineTextAlignment(.center)
//                                            .padding()
//                                            .keyboardType(.decimalPad)
                                        
                                        TextField("Eg.10", text: $data.small_blind)
                                            .multilineTextAlignment(.center)
                                            .padding()
                                            .keyboardType(.decimalPad)
                                        
                                    }
                                    .frame(maxWidth: 139)
                                }
                                .frame(maxWidth: 139)
                            }
                            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .overlay(Rectangle().strokeBorder(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1))
                            .padding()
                            
                            //form/03 component/textFiel...
                            VStack(spacing: 4) {
                                Text("Big Blind").font(.system(size: 16, weight: .medium))
                                    .frame(maxWidth: 139)
                                ZStack() {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 2)
                                            .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))
                                        
                                        RoundedRectangle(cornerRadius: 2)
                                            .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                                    }
                                    .frame(width: 139, height: 42)
                                    .frame(maxWidth: 139)
                                    HStack(spacing: 0) {
//                                        Text("Eg. 20").font(.custom("Inter Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 0.3)))
//                                        TextField("Eg.20", text: $big_blind.value)
//                                            .multilineTextAlignment(.center)
//                                            .padding()
//                                            .keyboardType(.decimalPad)
                                        
                                        TextField("Eg.20", text: $data.big_blind)
                                            .multilineTextAlignment(.center)
                                            .padding()
                                            .keyboardType(.decimalPad)
                                        
                                    }
                                    .frame(maxWidth: 139)
                                }
                                .frame(maxWidth: 139)
                            }
                            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .overlay(Rectangle().strokeBorder(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1))
                            
                            
                            
                            
                        }
                        .padding(.bottom, 0.0)
                        

                        Text("10/20 cents at the minimum").font(.system(size: 20, weight: .bold)).foregroundColor(Color(#colorLiteral(red: 0.55, green: 0.56, blue: 0.62, alpha: 1))).padding(.bottom, 8.0)
                        
                    }
                    
                    
                }
                .frame(width: 367, height: 174)
                
                //Player Buy-In
                Text("Player Buy-In").font(.system(size: 36, weight: .bold)).underline().foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 1))).padding(.bottom, -2.0)
                //form/02 element/info/default
                
                Text("Put in 0 for player #s not being utilized ").font(.system(size: 16, weight: .medium)).padding(.bottom, -1.0)
                
                VStack{
                    //player 1 buy in
                    VStack(spacing: 6) {
                        Text("Player 1").font(.custom("Inter Medium", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.37, green: 0.39, blue: 0.47, alpha: 1)))
                        .frame(maxWidth: 331)
                        ZStack() {
                            ZStack {
                                RoundedRectangle(cornerRadius: 2)
                                .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))

                                RoundedRectangle(cornerRadius: 2)
                                .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                            }
                            .frame(width: 331, height: 42)
                            .frame(maxWidth: 331)
                            HStack(spacing: 0) {
//                                Text("Eg. 20").font(.custom("Inter Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 0.3)))
//                                TextField("Eg.20", text: $p1_buyin.value)
//                                    .multilineTextAlignment(.center)
//                                    .padding()
//                                    .keyboardType(.decimalPad)
                                
                                TextField("Eg.20", text: $data.p1_buyin)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .keyboardType(.decimalPad)
                                
                            }
                            .frame(maxWidth: 331)
                        }
                        .frame(maxWidth: 331)
                    }
                    
                    //player 2 buy in
                    VStack(spacing: 6) {
                        Text("Player 2").font(.custom("Inter Medium", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.37, green: 0.39, blue: 0.47, alpha: 1)))
                        .frame(maxWidth: 331)
                        ZStack() {
                            ZStack {
                                RoundedRectangle(cornerRadius: 2)
                                .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))

                                RoundedRectangle(cornerRadius: 2)
                                .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                            }
                            .frame(width: 331, height: 42)
                            .frame(maxWidth: 331)
                            HStack(spacing: 0) {
//                                Text("Eg. 20").font(.custom("Inter Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 0.3)))
//                                TextField("Eg.20", text: $p2_buyin.value)
//                                    .multilineTextAlignment(.center)
//                                    .padding()
//                                    .keyboardType(.decimalPad)
                                
                                TextField("Eg.20", text: $data.p2_buyin)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .keyboardType(.decimalPad)
                                
                            }
                            .frame(maxWidth: 331)
                        }
                        .frame(maxWidth: 331)
                    }
                    
                    //player 3 buy in
                    VStack(spacing: 6) {
                        Text("Player 3").font(.custom("Inter Medium", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.37, green: 0.39, blue: 0.47, alpha: 1)))
                        .frame(maxWidth: 331)
                        ZStack() {
                            ZStack {
                                RoundedRectangle(cornerRadius: 2)
                                .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))

                                RoundedRectangle(cornerRadius: 2)
                                .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                            }
                            .frame(width: 331, height: 42)
                            .frame(maxWidth: 331)
                            HStack(spacing: 0) {
//                                Text("Eg. 20").font(.custom("Inter Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 0.3)))
//                                TextField("Eg.20", text: $p3_buyin.value)
//                                    .multilineTextAlignment(.center)
//                                    .padding()
//                                    .keyboardType(.decimalPad)
                                
                                TextField("Eg.20", text: $data.p3_buyin)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .keyboardType(.decimalPad)
                                
                            }
                            .frame(maxWidth: 331)
                        }
                        .frame(maxWidth: 331)
                    }
                    
                    //player 4 buy in
                    VStack(spacing: 6) {
                        Text("Player 4").font(.custom("Inter Medium", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.37, green: 0.39, blue: 0.47, alpha: 1)))
                        .frame(maxWidth: 331)
                        ZStack() {
                            ZStack {
                                RoundedRectangle(cornerRadius: 2)
                                .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))

                                RoundedRectangle(cornerRadius: 2)
                                .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                            }
                            .frame(width: 331, height: 42)
                            .frame(maxWidth: 331)
                            HStack(spacing: 0) {
//                                Text("Eg. 20").font(.custom("Inter Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 0.3)))
//                                TextField("Eg.20", text: $p4_buyin.value)
//                                    .multilineTextAlignment(.center)
//                                    .padding()
//                                    .keyboardType(.decimalPad)
                                
                                TextField("Eg.20", text: $data.p4_buyin)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .keyboardType(.decimalPad)
                                
                                
                            }
                            .frame(maxWidth: 331)
                        }
                        .frame(maxWidth: 331)
                    }
                    
                    //player 5 buy in
                    VStack(spacing: 6) {
                        Text("Player 5").font(.custom("Inter Medium", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.37, green: 0.39, blue: 0.47, alpha: 1)))
                        .frame(maxWidth: 331)
                        ZStack() {
                            ZStack {
                                RoundedRectangle(cornerRadius: 2)
                                .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))

                                RoundedRectangle(cornerRadius: 2)
                                .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                            }
                            .frame(width: 331, height: 42)
                            .frame(maxWidth: 331)
                            HStack(spacing: 0) {
//                                Text("Eg. 20").font(.custom("Inter Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 0.3)))
//                                TextField("Eg.20", text: $p5_buyin.value)
//                                    .multilineTextAlignment(.center)
//                                    .padding()
//                                    .keyboardType(.decimalPad)
                                
                                TextField("Eg.20", text: $data.p5_buyin)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .keyboardType(.decimalPad)
                                
                            }
                            .frame(maxWidth: 331)
                        }
                        .frame(maxWidth: 331)
                    }
                    
                    //player 6 buy in
                    VStack(spacing: 6) {
                        Text("Player 6").font(.custom("Inter Medium", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.37, green: 0.39, blue: 0.47, alpha: 1)))
                        .frame(maxWidth: 331)
                        ZStack() {
                            ZStack {
                                RoundedRectangle(cornerRadius: 2)
                                .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))

                                RoundedRectangle(cornerRadius: 2)
                                .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                            }
                            .frame(width: 331, height: 42)
                            .frame(maxWidth: 331)
                            HStack(spacing: 0) {
//                                Text("Eg. 20").font(.custom("Inter Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 0.3)))
//                                TextField("Eg.20", text: $p6_buyin.value)
//                                    .multilineTextAlignment(.center)
//                                    .padding()
//                                    .keyboardType(.decimalPad)
                                
                                TextField("Eg.20", text: $data.p6_buyin)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .keyboardType(.decimalPad)
                                
                            }
                            .frame(maxWidth: 331)
                        }
                        .frame(maxWidth: 331)
                    }
                    
                    //player 7 buy in
                    VStack(spacing: 6) {
                        Text("Player 7").font(.custom("Inter Medium", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.37, green: 0.39, blue: 0.47, alpha: 1)))
                        .frame(maxWidth: 331)
                        ZStack() {
                            ZStack {
                                RoundedRectangle(cornerRadius: 2)
                                .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))

                                RoundedRectangle(cornerRadius: 2)
                                .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                            }
                            .frame(width: 331, height: 42)
                            .frame(maxWidth: 331)
                            HStack(spacing: 0) {
//                                Text("Eg. 20").font(.custom("Inter Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 0.3)))
//                                TextField("Eg.20", text: $p7_buyin.value)
//                                    .multilineTextAlignment(.center)
//                                    .padding()
//                                    .keyboardType(.decimalPad)
                                
                                TextField("Eg.20", text: $data.p7_buyin)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .keyboardType(.decimalPad)
                                
                            }
                            .frame(maxWidth: 331)
                        }
                        .frame(maxWidth: 331)
                    }
                    
                    //player 8 buy in
                    VStack(spacing: 6) {
                        Text("Player 8").font(.custom("Inter Medium", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.37, green: 0.39, blue: 0.47, alpha: 1)))
                        .frame(maxWidth: 331)
                        ZStack() {
                            ZStack {
                                RoundedRectangle(cornerRadius: 2)
                                .fill(Color(#colorLiteral(red: 0.9882352948188782, green: 0.9882352948188782, blue: 0.9921568632125854, alpha: 1)))

                                RoundedRectangle(cornerRadius: 2)
                                .strokeBorder(Color(#colorLiteral(red: 0.8117647171020508, green: 0.8156862854957581, blue: 0.843137264251709, alpha: 1)), lineWidth: 1)
                            }
                            .frame(width: 331, height: 42)
                            .frame(maxWidth: 331)
                            HStack(spacing: 0) {
//                                Text("Eg. 20").font(.custom("Inter Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 0.3)))
//                                TextField("Eg.20", text: $p8_buyin.value)
//                                    .multilineTextAlignment(.center)
//                                    .padding()
//                                    .keyboardType(.decimalPad)
                                
                                TextField("Eg.20", text: $data.p8_buyin)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .keyboardType(.decimalPad)
                                
                                
                            }
                            .frame(maxWidth: 331)
                        }
                        .frame(maxWidth: 331)
                    }
                    

                }
                
            }
            
            HStack{
                Button("Submit"){
                    data.data_store()
                }
                .padding(.all)
                .font(.title2)
                
                NavigationLink("Begin Dispensing", destination: Dispensing_Queue())
                    .padding(.all)
                    .font(.title2)
            }
        }
    }
    
//    func call_data_store(){
//        data.data_store()
//    }
}

struct DispensingInfo_Previews: PreviewProvider {
    static var previews: some View {
        DispensingInfo().environmentObject(Data()).environmentObject(BLEManager())
    }
}


