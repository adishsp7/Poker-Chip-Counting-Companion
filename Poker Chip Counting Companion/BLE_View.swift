//
//  BLE_View.swift
//  Poker Chip Counting Companion
//
//  Created by Adish Patil on 10/14/22.
//

//THIS VIEW CODE WAS ADAPTED FROM A BLE Swift TUTORIAL ONLINE
//https://novelbits.io/intro-ble-mobile-development-ios-part-2/

import SwiftUI

struct BLE_View: View {

//    @ObservedObject var bleManager = BLEManager()
    @EnvironmentObject var bleManager1:BLEManager

    var body: some View {

        VStack (spacing: 10) {

                    Text("Bluetooth Devices")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .center)
                    List(bleManager1.peripherals) { peripheral in
                        HStack {
                            Text(peripheral.name)
                            Spacer()
                            Text(String(peripheral.rssi))
                        }
                    }.frame(height: 300)

                    Spacer()

                    Text("STATUS")
                        .font(.headline)

                    // Status goes here
                    if bleManager1.isSwitchedOn {
                        Text("Bluetooth is switched on")
                            .foregroundColor(.green)
                    }
                    else {
                        Text("Bluetooth is NOT switched on")
                            .foregroundColor(.red)
                    }

                    Spacer()

                    HStack {
                        VStack (spacing: 10) {
                            Button(action: {
                                self.bleManager1.startScanning()
                            }) {
                                Text("Start Scanning")
                            }
                            Button(action: {
                                self.bleManager1.stopScanning()
                            }) {
                                Text("Stop Scanning")
                            }
                            Button(action: {
                                self.bleManager1.writeOutgoingValue(data: "hello")
                            }) {
                                Text("test write")
                            }
                        }.padding()

                        Spacer()

                        VStack (spacing: 10) {
                            Button(action: {
                                print("Start Advertising")
                            }) {
                                Text("Start Advertising")
                            }
                            Button(action: {
                                print("Stop Advertising")
                            }) {
                                Text("Stop Advertising")
                            }
                        }.padding()
                    }
                    Spacer()
                }
    }
}

struct BLE_View_Previews: PreviewProvider {
    static var previews: some View {
        BLE_View().environmentObject(BLEManager())
    }
}


