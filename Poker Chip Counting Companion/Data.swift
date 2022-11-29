//
//  Data.swift
//  Poker Chip Counting Companion
//
//  Created by Adish Patil on 10/13/22.
//
import Swift
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
    
    var p1_red_chips:Int = 0
    var p1_blue_chips:Int = 0
    var p1_green_chips:Int = 0
    var p1_white_chips:Int = 0
    var p1_dispense_chips:String = ""
    
    var p2_red_chips:Int = 0
    var p2_blue_chips:Int = 0
    var p2_green_chips:Int = 0
    var p2_white_chips:Int = 0
    var p2_dispense_chips:String = ""

    var p3_red_chips:Int = 0
    var p3_blue_chips:Int = 0
    var p3_green_chips:Int = 0
    var p3_white_chips:Int = 0
    var p3_dispense_chips:String = ""

    var p4_red_chips:Int = 0
    var p4_blue_chips:Int = 0
    var p4_green_chips:Int = 0
    var p4_white_chips:Int = 0
    var p4_dispense_chips:String = ""

    var p5_red_chips:Int = 0
    var p5_blue_chips:Int = 0
    var p5_green_chips:Int = 0
    var p5_white_chips:Int = 0
    var p5_dispense_chips:String = ""

    var p6_red_chips:Int = 0
    var p6_blue_chips:Int = 0
    var p6_green_chips:Int = 0
    var p6_white_chips:Int = 0
    var p6_dispense_chips:String = ""

    var p7_red_chips:Int = 0
    var p7_blue_chips:Int = 0
    var p7_green_chips:Int = 0
    var p7_white_chips:Int = 0
    var p7_dispense_chips:String = ""

    var p8_red_chips:Int = 0
    var p8_blue_chips:Int = 0
    var p8_green_chips:Int = 0
    var p8_white_chips:Int = 0
    var p8_dispense_chips:String = ""
    
    var p1_buyout:String? = ""
    var p2_buyout:String? = ""
    var p3_buyout:String? = ""
    var p4_buyout:String? = ""
    var p5_buyout:String? = ""
    var p6_buyout:String? = ""
    var p7_buyout:String? = ""
    var p8_buyout:String? = ""
    
    func data_store(){
        
        //store values in static ints
        
        //chip values
        red_value_int = Double(red_value) ?? 0
        print(red_value_int)
        
        white_value_int = Double(white_value) ?? 0
        print(white_value_int)
        
        green_value_int = Double(green_value) ?? 0
        print(green_value_int)
        
        blue_value_int = Double(blue_value) ?? 0
        print(blue_value_int)
        
        //blinds
        small_blind_int = Double(small_blind) ?? 0
//        print(small_blind_int)
        
        big_blind_int = Double(big_blind) ?? 0
//        print(big_blind_int)
        
        red_left = 25;
        white_left = 25;
        green_left = 25;
        blue_left = 25;
        
        //buy-in
        p1_buyin_int = Double(p1_buyin) ?? 0
        (p1_red_chips, p1_white_chips, p1_green_chips, p1_blue_chips) = chip_calc(buyin: p1_buyin_int)
        p1_dispense_chips = ascii_string_conv(red:p1_red_chips, white:p1_white_chips, green:p1_green_chips, blue:p1_blue_chips)
        
        p2_buyin_int = Double(p2_buyin) ?? 0
        (p2_red_chips, p2_white_chips, p2_green_chips, p2_blue_chips) = chip_calc(buyin: p2_buyin_int)
        p2_dispense_chips = ascii_string_conv(red:p2_red_chips, white:p2_white_chips, green:p2_green_chips, blue:p2_blue_chips)

        p3_buyin_int = Double(p3_buyin) ?? 0
        (p3_red_chips, p3_white_chips, p3_green_chips, p3_blue_chips) = chip_calc(buyin: p3_buyin_int)
        p3_dispense_chips = ascii_string_conv(red:p3_red_chips, white:p3_white_chips, green:p3_green_chips, blue:p3_blue_chips)

        p4_buyin_int = Double(p4_buyin) ?? 0
        (p4_red_chips, p4_white_chips, p4_green_chips, p4_blue_chips) = chip_calc(buyin: p4_buyin_int)
        p4_dispense_chips = ascii_string_conv(red:p4_red_chips, white:p4_white_chips, green:p4_green_chips, blue:p4_blue_chips)

        p5_buyin_int = Double(p5_buyin) ?? 0
        (p5_red_chips, p5_white_chips, p5_green_chips, p5_blue_chips) = chip_calc(buyin: p5_buyin_int)
        p5_dispense_chips = ascii_string_conv(red:p5_red_chips, white:p5_white_chips, green:p5_green_chips, blue:p5_blue_chips)

        p6_buyin_int = Double(p6_buyin) ?? 0
        (p6_red_chips, p6_white_chips, p6_green_chips, p6_blue_chips) = chip_calc(buyin: p6_buyin_int)
        p6_dispense_chips = ascii_string_conv(red:p6_red_chips, white:p6_white_chips, green:p6_green_chips, blue:p6_blue_chips)

        p7_buyin_int = Double(p7_buyin) ?? 0
        (p7_red_chips, p7_white_chips, p7_green_chips, p7_blue_chips) = chip_calc(buyin: p7_buyin_int)
        p7_dispense_chips = ascii_string_conv(red:p7_red_chips, white:p7_white_chips, green:p7_green_chips, blue:p7_blue_chips)

        p8_buyin_int = Double(p8_buyin) ?? 0
        (p8_red_chips, p8_white_chips, p8_green_chips, p8_blue_chips) = chip_calc(buyin: p8_buyin_int)
        p8_dispense_chips = ascii_string_conv(red:p8_red_chips, white:p8_white_chips, green:p8_green_chips, blue:p8_blue_chips)
        
        state = 0
    
    }

    var red_left:Int;
    var white_left:Int;
    var green_left:Int;
    var blue_left:Int;
    
    //Calculating number of colores chips needed to be distributed for each player
    func chip_calc(buyin: Double) -> (red: Int, white:Int, green:Int, blue:Int){
        
        var array = [red_value_int, white_value_int, green_value_int, blue_value_int]
        var buy_in:Double = buyin
        var offset:Double
        var chipcount = [Double]()
        
        array.sort(by: >)
        for val in array{
            if(val != blue_value_int){
                if(val == array[0]){
                    offset = 3
                }
                else if(val == array[1]){
                    offset = 3
                }
                else{
                    offset = 2
                }
                let r = floor((buy_in) / (val))
                if(r > 0){
                    chipcount.append(r-offset)
                    buy_in -= (val * (r-offset))
                }
                else if(r <= 0){
                    chipcount.append(0)
                }
//                print(r)
            }
            else{
                chipcount.append(floor((buy_in) / (val)))
                
            }
//            print(buy_in)
//            print(r)
        }
        let rc = Int(chipcount[0])
        let wc = Int(chipcount[1])
        let gc = Int(chipcount[2])
        let bc = Int(chipcount[3])
        
        red_left -= rc;
        white_left -= wc;
        green_left -= gc;
        blue_left -= bc;
        
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
    
    
    func ascii_string_conv(red: Int, white:Int, green:Int, blue:Int) -> String{
        
        var ret:String = "0"
        let string4 = String(format: "%02X%02X%02X%02X", red, white, green, blue)
        ret.append(string4)
        print(ret)
        return ret
        
        
//        var redv:String = String(red)
//        var bluev:String = String(blue)
//        var greenv:String = String(green)
//        var whitev:String = String(white)
//
//        var red_ascii = Unicode.Scalar(redv)
//        let blue_ascii = UnicodeScalar(bluev)
//        let green_ascii = UnicodeScalar(greenv)
//        let white_ascii = UnicodeScalar(whitev)
        
        
//        let array = [Unicode.Scalar(redv), Unicode.Scalar(bluev), Unicode.Scalar(greenv), Unicode.Scalar(whitev)]
        // Or: let array: [UnicodeScalar] = ["f", "o", "o"]

//        var str1 = ""
//        str1.unicodeScalars.append(contentsOf: array)
        
//        let charactersArray = array.map(Character.init)
//        let newString = String(charactersArray)
//        print(newString)
        

//        let unicodeScalarView = String.UnicodeScalarView(array)
//        let newString = String(unicodeScalarView)
//        print(newString) // prints: foo
    
    }
    
    func p1_buyout_calc(red: Int, white: Int, green: Int, blue: Int){
        p1_buyout = buyout_calc(red_chips: red, white_chips: white, green_chips: green, blue_chips: blue)
    }
    
    func p2_buyout_calc(red: Int, white: Int, green: Int, blue: Int){
        p2_buyout = buyout_calc(red_chips: red, white_chips: white, green_chips: green, blue_chips: blue)
    }
    
    func p3_buyout_calc(red: Int, white: Int, green: Int, blue: Int){
        p3_buyout = buyout_calc(red_chips: red, white_chips: white, green_chips: green, blue_chips: blue)
    }
    
    func p4_buyout_calc(red: Int, white: Int, green: Int, blue: Int){
        p4_buyout = buyout_calc(red_chips: red, white_chips: white, green_chips: green, blue_chips: blue)
    }
    
    func p5_buyout_calc(red: Int, white: Int, green: Int, blue: Int){
        p5_buyout = buyout_calc(red_chips: red, white_chips: white, green_chips: green, blue_chips: blue)
    }
    
    func p6_buyout_calc(red: Int, white: Int, green: Int, blue: Int){
        p6_buyout = buyout_calc(red_chips: red, white_chips: white, green_chips: green, blue_chips: blue)
    }
    
    func p7_buyout_calc(red: Int, white: Int, green: Int, blue: Int){
        p7_buyout = buyout_calc(red_chips: red, white_chips: white, green_chips: green, blue_chips: blue)
    }
    
    func p8_buyout_calc(red: Int, white: Int, green: Int, blue: Int){
        p8_buyout = buyout_calc(red_chips: red, white_chips: white, green_chips: green, blue_chips: blue)
    }
    
    func buyout_calc(red_chips: Int, white_chips: Int, green_chips: Int, blue_chips:Int) -> String{
        print ("total buy out calculation")
        var total_buyout: Int
        
        total_buyout = (red_chips * Int(red_value_int)) + (white_chips * Int(white_value_int)) + (green_chips * Int(green_value_int)) + (blue_chips * Int(blue_value_int))
        
        print(total_buyout)
        return String(total_buyout)
    }
    
}


extension Sequence where Element == Unicode.Scalar {
    var string: String { .init(String.UnicodeScalarView(self)) }
}
