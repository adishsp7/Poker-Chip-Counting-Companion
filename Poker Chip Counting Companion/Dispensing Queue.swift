import Foundation
import UIKit
import SwiftUI
import CoreBluetooth


struct Dispensing_Queue: View {
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
    
//    @ObservedObject private var manager = BluetoothManager.shared
//    @EnvironmentObject var manager:BluetoothManager
//    @ObservedObject var bleManager1 = BLEManager()
    
    @EnvironmentObject var bleManager1:BLEManager
    @EnvironmentObject var data:Data
    
    
    //Logo Screen View
    var body: some View {
        NavigationStack{
            
            
            VStack{
                
                //Chip Dispense
                Text("Chip Dispense").font(.system(size: 35, weight: .bold)).underline().foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 1))).padding(.vertical, 40.0)
                
                
                
                HStack{
                    //Player_1
                    Spacer()
                    Text("Player 1").font(.system(size: 32, weight: .regular))
                    Spacer()
//                    Button(action: {
//                        self.bleManager1.startScanning()
//                    }) {
//                        Text("Start Scanning")
//                    }
//                    Button(action: {
//                        self.bleManager1.stopScanning()
//                    }) {
//                        Text("Stop Scanning")
//                    }
                    Button("Dispense"){
                        print("test")
                        self.bleManager1.writeOutgoingValue(data: "hello")
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
                    Button("Dispense"){
                        print("hello")
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
                    Button("Dispense"){
                        print("hello")
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
                    Button("Dispense"){
                        print("hello")
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
                    Button("Dispense"){
                        print("hello")
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
                    Button("Dispense"){
                        print("hello")
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
                    Button("Dispense"){
                        print("hello")
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
                    Button("Dispense"){
                        print("hello")
                        disable8 = true
                    }
                    .font(.title)
                    .foregroundColor(disable8 ? .gray : .red)
                    .disabled(disable8)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                
                NavigationLink("Finish Dispensing", destination: Buyin_Table())
                                    .padding(.all)
                                    .font(.largeTitle)
                
              
            }
            Spacer()
        }
    }
}

struct Dispensing_Queue_Previews: PreviewProvider {
    static var previews: some View {
        Dispensing_Queue().environmentObject(Data()).environmentObject(BLEManager())
    }
}
