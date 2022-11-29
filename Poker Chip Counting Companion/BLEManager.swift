//
//  BLEManager.swift
//  Poker Chip Counting Companion
//
//  Created by Adish Patil on 10/13/22.
//

import Foundation
import CoreBluetooth
import UIKit


struct Peripheral: Identifiable {
    let id: Int
    let name: String
    let rssi: Int
}
class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate, CBPeripheralManagerDelegate {

    var myCentral: CBCentralManager!
    var discoveredPer: CBPeripheral?
//    private var per: CBPeripheral?
    private var transferCharacteristic: CBCharacteristic?
    private var readCharacteristic: CBCharacteristic?
    @Published var isSwitchedOn = false
    @Published var peripherals = [Peripheral]()
    var buy_outs = [Int?]()

        override init() {
            super.init()

            myCentral = CBCentralManager(delegate: self, queue: nil)
            myCentral.delegate = self
        }
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
         if central.state == .poweredOn {
             isSwitchedOn = true
         }
         else {
             isSwitchedOn = false
         }
    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        var peripheralName: String!
//        print(peripheral)
        
        if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            peripheralName = name
        }
        else {
            peripheralName = "Unknown"
        }

        let newPeripheral = Peripheral(id: peripherals.count, name: peripheralName, rssi: RSSI.intValue)
//        print(newPeripheral)
        if(peripheralName != "Unknown"){
            peripherals.append(newPeripheral)
        }
        
        if peripheralName == "Poker-Chip-Counting-Companion" {
            discoveredPer = peripheral
            
            print ("Connected")
            
            myCentral.connect(peripheral, options: nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("failed to connect", peripheral, String(describing: error))
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.delegate = self
        peripheral.discoverServices([CBUUIDs.BLEService_UUID])
    }

    func startScanning() {
         print("startScanning")
         myCentral.scanForPeripherals(withServices: nil)
     }
    


    func stopScanning() {
        print("stopScanning")
        myCentral.stopScan()
    }
    
    /*
     *  Write some test data to peripheral
     */
    func writeOutgoingValue(data: String){
              print("write")
            let valueString = (data as NSString).data(using: String.Encoding.utf8.rawValue)

            if let peripheral = self.discoveredPer {
    
              if let transferCharacteristic = transferCharacteristic {    
                peripheral.writeValue(valueString!, for: transferCharacteristic, type: CBCharacteristicWriteType.withResponse)
                  }
              }
    }
    
    /*
     *  Start reading for test data from the peripheral
     */
    func readValue(){
        if let peripheral = self.discoveredPer {

          if let readCharacteristic = readCharacteristic {
            peripheral.readValue(for: readCharacteristic)
              }
          }
    }
    
    
    
    
    // implementations of the CBPeripheralDelegate methods

    /*
     *  The peripheral letting us know when services have been invalidated.
     */
    func peripheral(_ peripheral: CBPeripheral, didModifyServices invalidatedServices: [CBService]) {

        for service in invalidatedServices where service.uuid == CBUUIDs.BLEService_UUID {
            print("Transfer service is invalidated - rediscover services")
            peripheral.discoverServices([CBUUIDs.BLEService_UUID])
        }
    }
    

    /*
     *  The Transfer Service was discovered
     */
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let error = error {
            print("Error discovering services: %s", error.localizedDescription)
//            cleanup()
            return
        }

        // Discover the characteristic we want...

        // Loop through the newly filled peripheral.services array, just in case there's more than one.
        guard let peripheralServices = peripheral.services else { return }
        for service in peripheralServices {
            peripheral.discoverCharacteristics([CBUUIDs.BLECharacteristic_UUID], for: service)
        }
    }

    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
       switch peripheral.state {
       case .poweredOn:
           print("Peripheral Is Powered On.")
       case .unsupported:
           print("Peripheral Is Unsupported.")
       case .unauthorized:
       print("Peripheral Is Unauthorized.")
       case .unknown:
           print("Peripheral Unknown")
       case .resetting:
           print("Peripheral Resetting")
       case .poweredOff:
         print("Peripheral Is Powered Off.")
       @unknown default:
         print("Error")
       }
     }
    
    
    /*
     *  The Transfer characteristic was discovered.
     *  Once this has been found, we want to subscribe to it, which lets the peripheral know we want the data it contains
     */
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        // Deal with errors (if any).
        if let error = error {
            print(" ", error.localizedDescription)
//            cleanup()
            return
        }

        // Again, we loop through the array, just in case and check if it's the right one
        guard let serviceCharacteristics = service.characteristics else { return }
        for characteristic in serviceCharacteristics where characteristic.uuid == CBUUIDs.BLECharacteristic_UUID {
            // If it is, subscribe to it
            transferCharacteristic = characteristic
            readCharacteristic = characteristic
            peripheral.setNotifyValue(true, for: characteristic)
//            peripheral.readValue(for: characteristic)
            
//            print("Characteristic Read: \(readCharacteristic?.uuid)")
        }

        // Once this is complete, we just need to wait for the data to come in.
    }
    
    func buyout_zero(){
        buy_outs.append(0)
        buy_outs.append(0)
        buy_outs.append(0)
        buy_outs.append(0)
        print(buy_outs)

        print("didUpdateValueFor")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {

//        print(characteristic.value![0],characteristic.value![1],characteristic.value![2],characteristic.value![3])
        
        buy_outs.append(Int(exactly: characteristic.value![0]))
        buy_outs.append(Int(exactly: characteristic.value![1]))
        buy_outs.append(Int(exactly: characteristic.value![2]))
        buy_outs.append(Int(exactly: characteristic.value![3]))
        print(buy_outs)

        print("didUpdateValueFor")
//          var characteristicASCIIValue = NSString()
//
//          guard characteristic == readCharacteristic,
//
//          let characteristicValue = characteristic.value,
//                let ASCIIstring = NSString(data: characteristicValue, encoding: String.Encoding.utf8.rawValue) else { return }
//
//            characteristicASCIIValue = ASCIIstring
//
//
//            print(characteristicASCIIValue as String)

          //characteristicASCIIValue = ASCIIstring
            

//          print("Value Recieved: \((characteristicASCIIValue as String))")
    }

//    /*
//     *   This callback lets us know more data has arrived via notification on the characteristic
//     */
//    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
//        // Deal with errors (if any)
//        if let error = error {
//            print("Error discovering characteristics: %s", error.localizedDescription)
////            cleanup()
//            return
//        }
//
//        guard let characteristicData = characteristic.value,
//            let stringFromData = String(data: characteristicData, encoding: .utf8) else { return }
//
//        print("Received %d bytes: %s", characteristicData.count, stringFromData)
//
////        // Have we received the end-of-message token?
////        if stringFromData == "EOM" {
////            // End-of-message case: show the data.
////            // Dispatch the text view update to the main queue for updating the UI, because
////            // we don't know which thread this method will be called back on.
////            DispatchQueue.main.async() {
////                self.textView.text = String(data: self.data, encoding: .utf8)
////            }
////
////            // Write test data
////            writeData()
////        } else {
////            // Otherwise, just append the data to what we have previously received.
////            data.append(characteristicData)
////        }
//    }

    /*
     *  The peripheral letting us know whether our subscribe/unsubscribe happened or not
     */
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        // Deal with errors (if any)
        if let error = error {
            print("Error changing notification state: %s", error.localizedDescription)
            return
        }

        // Exit if it's not the transfer characteristic
        guard characteristic.uuid == CBUUIDs.BLECharacteristic_UUID else { return }

        if characteristic.isNotifying {
            // Notification has started
            print("Notification began on %@", characteristic)
        } else {
            // Notification has stopped, so disconnect from the peripheral
            print("Notification stopped on %@. Disconnecting", characteristic)
//            cleanup()
        }

    }

//    /*
//     *  This is called when peripheral is ready to accept more data when using write without response
//     */
//    func peripheralIsReady(toSendWriteWithoutResponse peripheral: CBPeripheral) {
//        print("Peripheral is ready, send data")
//        writeData()
//    }


}
