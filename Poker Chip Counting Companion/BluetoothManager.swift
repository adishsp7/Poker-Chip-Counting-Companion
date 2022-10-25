//
//  BluetoothManager.swift
//  Poker Chip Counting Companion

//
//  Created by Artem Novichkov on 31.05.2021.
//

import Combine
import CoreBluetooth

final class BluetoothManager: NSObject, ObservableObject {
    
    static let shared: BluetoothManager = .init()
    
    var stateSubject: PassthroughSubject<CBManagerState, Never> = .init()
    var peripheralSubject: PassthroughSubject<CBPeripheral, Never> = .init()
    var servicesSubject: PassthroughSubject<[CBService], Never> = .init()
    var characteristicsSubject: PassthroughSubject<(CBService, [CBCharacteristic]), Never> = .init()
    var centralManager: CBCentralManager!
    
    private var per: CBPeripheral!
    private var txCharacteristic: CBCharacteristic!
    private var rxCharacteristic: CBCharacteristic!
   
    

    //MARK: - Lifecycle
    
//    func start() {
//        centralManager = .init(delegate: self, queue: .main)
//    }
//
//    func scan() {
//        centralManager.scanForPeripherals(withServices: nil)
//    }
    
    func init_centralmanager() {
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func startScanning() -> Void {
      // Start Scanning
      centralManager?.scanForPeripherals(withServices: [CBUUIDs.BLEService_UUID])
    }
    
    func connect(_ peripheral: CBPeripheral) {
        centralManager.stopScan()
        peripheral.delegate = self
        centralManager.connect(peripheral)
    }
    
    //Recieving Function
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {

          var characteristicASCIIValue = NSString()

          guard characteristic == rxCharacteristic,

          let characteristicValue = characteristic.value,
          let ASCIIstring = NSString(data: characteristicValue, encoding: String.Encoding.utf8.rawValue) else { return }

          characteristicASCIIValue = ASCIIstring

          print("Value Recieved: \((characteristicASCIIValue as String))")
    }
    
    //write
    func writeOutgoingValue(data: String){
          
        let valueString = (data as NSString).data(using: String.Encoding.utf8.rawValue)
        
        if let per = per {
              
          if let txCharacteristic = txCharacteristic {
                  
            per.writeValue(valueString!, for: txCharacteristic, type: CBCharacteristicWriteType.withResponse)
              }
          }
      }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral,advertisementData: [String : Any], rssi RSSI: NSNumber) {

        per = peripheral

        per.delegate = self

        print("Peripheral Discovered: \(peripheral)")
        print("Peripheral name: Arduino")
        print ("Advertisement Data : \(advertisementData)")
            
        centralManager?.connect(per!, options: nil)
       }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
       per.discoverServices([CBUUIDs.BLEService_UUID])
    }
    
}

extension BluetoothManager: CBCentralManagerDelegate {
    
//    func centralManagerDidUpdateState(_ central: CBCentralManager) {
//        stateSubject.send(central.state)
//    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
             case .poweredOff:
                 print("Is Powered Off.")
             case .poweredOn:
                 print("Is Powered On.")
                 startScanning()
             case .unsupported:
                 print("Is Unsupported.")
             case .unauthorized:
             print("Is Unauthorized.")
             case .unknown:
                 print("Unknown")
             case .resetting:
                 print("Resetting")
             @unknown default:
               print("Error")
             }
    }
    
//    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
//        peripheralSubject.send(peripheral)
//    }
    
    
//    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
//        peripheral.discoverServices(nil)
//
//    }
    
}

extension BluetoothManager: CBPeripheralDelegate {
    
//    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
//        guard let services = peripheral.services else {
//            return
//        }
//        servicesSubject.send(services)
//    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
            print("*******************************************************")

            if ((error) != nil) {
                print("Error discovering services: \(error!.localizedDescription)")
                return
            }
            guard let services = peripheral.services else {
                return
            }
            //We need to discover the all characteristic
            for service in services {
                peripheral.discoverCharacteristics(nil, for: service)
            }
            print("Discovered Services: \(services)")
        }
    
//    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
//        guard let characteristics = service.characteristics else {
//            return
//        }
//        characteristicsSubject.send((service, characteristics))
//    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
           
               guard let characteristics = service.characteristics else {
              return
          }

          print("Found \(characteristics.count) characteristics.")

          for characteristic in characteristics {

            if characteristic.uuid.isEqual(CBUUIDs.BLE_Characteristic_uuid_Rx)  {

              rxCharacteristic = characteristic

              peripheral.setNotifyValue(true, for: rxCharacteristic!)
              peripheral.readValue(for: characteristic)

              print("RX Characteristic: \(rxCharacteristic.uuid)")
            }

            if characteristic.uuid.isEqual(CBUUIDs.BLE_Characteristic_uuid_Tx){
              
              txCharacteristic = characteristic
              
              print("TX Characteristic: \(txCharacteristic.uuid)")
            }
          }
    }
}


extension BluetoothManager: CBPeripheralManagerDelegate{
    
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
    

}

