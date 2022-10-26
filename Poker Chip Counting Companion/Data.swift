//
//  Data.swift
//  Poker Chip Counting Companion
//
//  Created by Adish Patil on 10/13/22.
//

import Foundation
import SwiftUI
import CoreBluetooth

class Data: ObservableObject {
    @Published var red_value = ""
    @Published var white_value = ""
    @Published var green_value = ""
    @Published var blue_value = ""
    @Published var small_blind = ""
    @Published var big_blind = ""
    @Published var p1_buyin = ""
    @Published var p2_buyin = ""
    @Published var p3_buyin = ""
    @Published var p4_buyin = ""
    @Published var p5_buyin = ""
    @Published var p6_buyin = ""
    @Published var p7_buyin = ""
    @Published var p8_buyin = ""
    
    var peripheral: CBPeripheral?
    
    var state:Double = 0
    
    var red_value_int:Double = 0
    var white_value_int:Double = 0
    var green_value_int:Double = 0
    var blue_value_int:Double = 0
    var small_blind_int:Double = 0
    var big_blind_int:Double = 0
    
    var p1_buyin_int:Double = 0
    var p2_buyin_int:Double = 0
    var p3_buyin_int:Double = 0
    var p4_buyin_int:Double = 0
    var p5_buyin_int:Double = 0
    var p6_buyin_int:Double = 0
    var p7_buyin_int:Double = 0
    var p8_buyin_int:Double = 0
    
    var p1_red_chips:Double = 0
    var p1_blue_chips:Double = 0
    var p1_green_chips:Double = 0
    var p1_white_chips:Double = 0
    
    var p2_red_chips:Double = 0
    var p2_blue_chips:Double = 0
    var p2_green_chips:Double = 0
    var p2_white_chips:Double = 0
    
    var p3_red_chips:Double = 0
    var p3_blue_chips:Double = 0
    var p3_green_chips:Double = 0
    var p3_white_chips:Double = 0
    
    var p4_red_chips:Double = 0
    var p4_blue_chips:Double = 0
    var p4_green_chips:Double = 0
    var p4_white_chips:Double = 0
    
    var p5_red_chips:Double = 0
    var p5_blue_chips:Double = 0
    var p5_green_chips:Double = 0
    var p5_white_chips:Double = 0
    
    var p6_red_chips:Double = 0
    var p6_blue_chips:Double = 0
    var p6_green_chips:Double = 0
    var p6_white_chips:Double = 0
    
    var p7_red_chips:Double = 0
    var p7_blue_chips:Double = 0
    var p7_green_chips:Double = 0
    var p7_white_chips:Double = 0
    
    var p8_red_chips:Double = 0
    var p8_blue_chips:Double = 0
    var p8_green_chips:Double = 0
    var p8_white_chips:Double = 0
    
    func data_store(){
        
        //store values in static ints
        
        //chip values
        red_value_int = Double(red_value) ?? 0
        print(red_value_int)
        
        white_value_int = Double(white_value) ?? 0
        print(white_value_int)
        
        blue_value_int = Double(blue_value) ?? 0
        print(green_value_int)
        
        blue_value_int = Double(blue_value) ?? 0
        print(green_value_int)
        
        //blinds
        small_blind_int = Double(small_blind) ?? 0
        print(small_blind_int)
        
        big_blind_int = Double(big_blind) ?? 0
        print(big_blind_int)
        
        //buy-in
        p1_buyin_int = Double(p1_buyin) ?? 0
        (p1_red_chips, p1_white_chips, p1_green_chips, p1_blue_chips) = chip_calc(buyin: p1_buyin_int)
        print(p1_buyin_int)
        
        p2_buyin_int = Double(p2_buyin) ?? 0
        print(p2_buyin_int)
        
        p3_buyin_int = Double(p3_buyin) ?? 0
        print(p3_buyin_int)
        
        p4_buyin_int = Double(p4_buyin) ?? 0
        print(p4_buyin_int)
        
        p5_buyin_int = Double(p5_buyin) ?? 0
        print(p5_buyin_int)
        
        p6_buyin_int = Double(p6_buyin) ?? 0
        print(p6_buyin_int)
        
        p7_buyin_int = Double(p7_buyin) ?? 0
        print(p7_buyin_int)
        
        p8_buyin_int = Double(p8_buyin) ?? 0
        print(p8_buyin_int)
        
        state = 0
    
    }
//
    func chip_calc(buyin: Double) -> (red: Double, blue:Double, green:Double, white:Double){
        
        var array = [red_value_int, white_value_int, green_value_int, blue_value_int]
        var buy_in:Double = buyin
        var offset:Double
        var chipcount = [Double]()
        
        array.sort(by: >)
        for val in array{
            if(val != 1){
                if(val == array[0]){
                    offset = 5
                }
                else if(val == array[1]){
                    offset = 5
                }
                else{
                    offset = 2
                }
                let r = floor((buyin) / (val))
                if(r > 0){
                    chipcount.append(r-offset)
                    buy_in -= (val * (r-offset))
                }
                else if(r <= 0){
                    chipcount.append(0)
                }
            }
            else{
                chipcount.append(buy_in)
            }
        }
        let rc = chipcount[0]
        let wc = chipcount[1]
        let gc = chipcount[2]
        let bc = chipcount[3]
        
        print(rc)
        print(wc)
        print(gc)
        print(bc)
        
        return(rc, wc, gc, bc)
        

//        buyin = 253
//        c = [1,5,10,25]
//        c = c[::-1]
//        def chips(buyin):
//            num_each = []
//            c = [25,10,5,1]
//            for chip in c:
//                if (chip!=1):
//                    if chip == c[0]:
//                        offset = 5
//                    elif chip == c[1]:
//                        offset = 5
//                    else:
//                        offset = 2
//                    R = buyin//chip
//                    if (R>0):
//                        num_each += [R-offset]
//                        buyin -= chip * (R-offset)
//                    elif(R<=0):
//                        num_each += [0]
//                else:
//                    num_each += [buyin]
//
//            return num_each
//        s = 0
//        chips(250)
    }
    
}


