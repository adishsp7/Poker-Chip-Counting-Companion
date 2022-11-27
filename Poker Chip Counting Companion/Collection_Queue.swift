//
//  Collection_Queue.swift
//  Poker Chip Counting Companion
//
//  Created by Adish Patil on 10/13/22.
//

import Foundation
import UIKit
import SwiftUI
import CoreBluetooth

struct Collection_Queue: View {
    
    //button action variable
    @State private var action: Int? = 0
    @State private var disable1: Bool = false
    @State private var disable2: Bool = true
    @State private var disable3: Bool = true
    @State private var disable4: Bool = true
    @State private var disable5: Bool = true
    @State private var disable6: Bool = true
    @State private var disable7: Bool = true
    @State private var disable8: Bool = true
    
    @EnvironmentObject var bleManager1:BLEManager
    @EnvironmentObject var data:Data

    
    
    var body: some View {
        NavigationStack{
            
            VStack{
                //Chip Dispense
                Text("Chip Collection").font(.system(size: 35, weight: .bold)).underline().foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 1))).padding(.vertical, 40.0)
            }
            
            
            VStack{

                HStack{
                    //Player_1
                    Spacer()
                    Text("Player 1").font(.system(size: 32, weight: .regular))
                    Spacer()
                    Button("Collect"){
                        if(data.p1_buyin_int != 0){
                            self.bleManager1.writeOutgoingValue(data: "200000000")
                            self.bleManager1.readValue()
                        }
                        else{
                            self.bleManager1.buyout_zero()
                        }
                        
                        disable1 = true
                        disable2 = false
                    }
                    .font(.title)
                    .foregroundColor(disable1 ? .gray : .red)
                    .disabled(disable1)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                HStack{
                    //Player_2
                    Spacer()
                    Text("Player 2").font(.system(size: 32, weight: .regular))
                    Spacer()
                    Button("Collect"){
                        if(data.p2_buyin_int != 0){
                            self.bleManager1.writeOutgoingValue(data: "200000000")
                            self.bleManager1.readValue()
                        }
                        else{
                            self.bleManager1.buyout_zero()
                        }
                        
                        disable2 = true
                        disable3 = false
                    }
                    .font(.title)
                    .foregroundColor(disable2 ? .gray : .red)
                    .disabled(disable2)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                
                HStack{
                    //Player_3
                    Spacer()
                    Text("Player 3").font(.system(size: 32, weight: .regular))
                    Spacer()
                    Button("Collect"){
                        if(data.p3_buyin_int != 0){
                            self.bleManager1.writeOutgoingValue(data: "200000000")
                            self.bleManager1.readValue()
                        }
                        else{
                            self.bleManager1.buyout_zero()
                        }
                        disable3 = true
                        disable4 = false
                    }
                    .font(.title)
                    .foregroundColor(disable3 ? .gray : .red)
                    .disabled(disable3)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                
                HStack{
                    //Player_4
                    Spacer()
                    Text("Player 4").font(.system(size: 32, weight: .regular))
                    Spacer()
                    Button("Collect"){
                        if(data.p4_buyin_int != 0){
                            self.bleManager1.writeOutgoingValue(data: "200000000")
                            self.bleManager1.readValue()
                        }
                        else{
                            self.bleManager1.buyout_zero()
                        }
                        disable4 = true
                        disable5 = false
                    }
                    .font(.title)
                    .foregroundColor(disable4 ? .gray : .red)
                    .disabled(disable4)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                
                HStack{
                    //Player_5
                    Spacer()
                    Text("Player 5").font(.system(size: 32, weight: .regular))
                    Spacer()
                    Button("Collect"){
                        if(data.p5_buyin_int != 0){
                            self.bleManager1.writeOutgoingValue(data: "200000000")
                            self.bleManager1.readValue()
                        }
                        else{
                            self.bleManager1.buyout_zero()
                        }
                        disable5 = true
                        disable6 = false
                    }
                    .font(.title)
                    .foregroundColor(disable5 ? .gray : .red)
                    .disabled(disable5)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                
                HStack{
                    //Player_6
                    Spacer()
                    Text("Player 6").font(.system(size: 32, weight: .regular))
                    Spacer()
                    Button("Collect"){
                        if(data.p6_buyin_int != 0){
                            self.bleManager1.writeOutgoingValue(data: "200000000")
                            self.bleManager1.readValue()
                        }
                        else{
                            self.bleManager1.buyout_zero()
                        }
                        disable6 = true
                        disable7 = false
                    }
                    .font(.title)
                    .foregroundColor(disable6 ? .gray : .red)
                    .disabled(disable6)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                
                HStack{
                    //Player_7
                    Spacer()
                    Text("Player 7").font(.system(size: 32, weight: .regular))
                    Spacer()
                    Button("Collect"){
                        if(data.p7_buyin_int != 0){
                            self.bleManager1.writeOutgoingValue(data: "200000000")
                            self.bleManager1.readValue()
                        }
                        else{
                            self.bleManager1.buyout_zero()
                        }
                        disable7 = true
                        disable8 = false
                    }
                    .font(.title)
                    .foregroundColor(disable7 ? .gray : .red)
                    .disabled(disable7)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                
                HStack{
                    //Player_8
                    Spacer()
                    Text("Player 8").font(.system(size: 32, weight: .regular))
                    Spacer()
                    Button("Collect"){
                        if(data.p8_buyin_int != 0){
                            self.bleManager1.writeOutgoingValue(data: "200000000")
                            self.bleManager1.readValue()
                        }
                        else{
                            self.bleManager1.buyout_zero()
                        }
                        disable8 = true
                    }
                    .font(.title)
                    .foregroundColor(disable8 ? .gray : .red)
                    .disabled(disable8)
                    Spacer()
                }
                .padding(.bottom, 10.0)
                
                NavigationLink("Finish Collecting", destination: Buyout_Table())
                    .padding(.all)
                    .font(.largeTitle)
                    .padding(.bottom, -5.0)
            }
            
            Button("Calculate Buyouts"){
                data.p1_buyout_calc(red: self.bleManager1.buy_outs[0]!, white: self.bleManager1.buy_outs[1]!, green: self.bleManager1.buy_outs[2]!, blue: self.bleManager1.buy_outs[3]!)
                data.p2_buyout_calc(red: self.bleManager1.buy_outs[4]!, white: self.bleManager1.buy_outs[5]!, green: self.bleManager1.buy_outs[6]!, blue: self.bleManager1.buy_outs[7]!)
                data.p3_buyout_calc(red: self.bleManager1.buy_outs[8]!, white: self.bleManager1.buy_outs[9]!, green: self.bleManager1.buy_outs[10]!, blue: self.bleManager1.buy_outs[11]!)
                data.p4_buyout_calc(red: self.bleManager1.buy_outs[12]!, white: self.bleManager1.buy_outs[13]!, green: self.bleManager1.buy_outs[14]!, blue: self.bleManager1.buy_outs[15]!)
                data.p5_buyout_calc(red: self.bleManager1.buy_outs[16]!, white: self.bleManager1.buy_outs[17]!, green: self.bleManager1.buy_outs[18]!, blue: self.bleManager1.buy_outs[19]!)
                data.p6_buyout_calc(red: self.bleManager1.buy_outs[20]!, white: self.bleManager1.buy_outs[21]!, green: self.bleManager1.buy_outs[22]!, blue: self.bleManager1.buy_outs[23]!)
                data.p7_buyout_calc(red: self.bleManager1.buy_outs[24]!, white: self.bleManager1.buy_outs[25]!, green: self.bleManager1.buy_outs[26]!, blue: self.bleManager1.buy_outs[27]!)
                data.p8_buyout_calc(red: self.bleManager1.buy_outs[28]!, white: self.bleManager1.buy_outs[29]!, green: self.bleManager1.buy_outs[30]!, blue: self.bleManager1.buy_outs[31]!)
            }
            .font(.title)
            .foregroundColor(.green)
            .padding(.vertical, 10.0)
            
//            HStack{
//                Button(action: {
//                    self.bleManager1.startScanning()
//                }) {
//                    Text("Start Scanning")
//                }
//                Button(action: {
//                    self.bleManager1.stopScanning()
//                }) {
//                    Text("Stop Scanning")
//                }
//            }
            Spacer()
        }
    }
}

struct Collection_Queue_Previews: PreviewProvider {
    static var previews: some View {
        Collection_Queue().environmentObject(Data()).environmentObject(BLEManager())
    }
}
