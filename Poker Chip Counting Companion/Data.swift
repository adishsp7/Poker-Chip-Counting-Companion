//
//  Data.swift
//  Poker Chip Counting Companion
//
//  Created by Adish Patil on 10/13/22.
//

import Foundation
import SwiftUI

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
    
    var red_value_int:Int = 0
    var white_value_int:Int = 0
    var green_value_int:Int = 0
    var blue_value_int:Int = 0
    var small_blind_int:Int = 0
    var big_blind_int:Int = 0
    var p1_buyin_int:Int = 0
    var p2_buyin_int:Int = 0
    var p3_buyin_int:Int = 0
    var p4_buyin_int:Int = 0
    var p5_buyin_int:Int = 0
    var p6_buyin_int:Int = 0
    var p7_buyin_int:Int = 0
    var p8_buyin_int:Int = 0
    
    var p1_red_chips:Int = 0
    var p1_blue_chips:Int = 0
    var p1_green_chips:Int = 0
    var p1_white_chips:Int = 0
    
    func data_store(){
        
        //store values in static ints
        
        //chip values
        red_value_int = Int(red_value) ?? 0
        print(red_value_int)
        
        white_value_int = Int(white_value) ?? 0
        print(white_value_int)
        
        blue_value_int = Int(blue_value) ?? 0
        print(green_value_int)
        
        blue_value_int = Int(blue_value) ?? 0
        print(green_value_int)
        
        //blinds
        small_blind_int = Int(small_blind) ?? 0
        print(small_blind_int)
        
        big_blind_int = Int(big_blind) ?? 0
        print(big_blind_int)
        
        //buy-in
        p1_buyin_int = Int(p1_buyin) ?? 0
        (p1_red_chips, p1_white_chips, p1_green_chips, p1_blue_chips) = chip_calc(buyin: p1_buyin_int)
        print(p1_buyin_int)
        
        p2_buyin_int = Int(p2_buyin) ?? 0
        print(p2_buyin_int)
        
        p3_buyin_int = Int(p3_buyin) ?? 0
        print(p3_buyin_int)
        
        p4_buyin_int = Int(p4_buyin) ?? 0
        print(p4_buyin_int)
        
        p5_buyin_int = Int(p5_buyin) ?? 0
        print(p5_buyin_int)
        
        p6_buyin_int = Int(p6_buyin) ?? 0
        print(p6_buyin_int)
        
        p7_buyin_int = Int(p7_buyin) ?? 0
        print(p7_buyin_int)
        
        p8_buyin_int = Int(p8_buyin) ?? 0
        print(p8_buyin_int)
    
    }
//
    func chip_calc(buyin: Int) -> (red: Int, blue:Int, green:Int, white:Int){
        
        var array = [red_value_int, white_value_int, green_value_int, blue_value_int]
        var buy_in:Int = buyin
        var offset:Int
        var chipcount = [Int]()
        
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
                let r = Int(floor(Double(buyin) / Double(val)))
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


