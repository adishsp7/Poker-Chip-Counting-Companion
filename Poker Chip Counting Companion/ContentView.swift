//
//  ContentView.swift
//  Poker Chip Counting Companion
//
//  Created by Adish Patil on 10/9/22.
//
import Foundation
import SwiftUI

struct ContentView: View {
    //button action variable
    @State private var action: Int? = 0
    
    //Logo Screen View
    var body: some View {
        NavigationStack{
            
            ZStack{
                Image("background").ignoresSafeArea()
                
                //StatusBar / iPhone 13
                VStack{
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 390, height: 47)
                    
                    
                    PokerLogo()
                        .offset(y:-130)
                        .padding(.bottom, -90)
                        .padding(.top, 50)
                    
                    
                    
                    NavigationLink("Poker Chip \n Counting Companion", destination: DispensingInfo())
                        .padding(.all)
                        .font(.largeTitle.weight(.semibold))
//                        .background(Color.white)
                    
                    //            NavigationView(content: NavigationLink("button", destination: DispensingInfo()))
                    //            NavigationLink(destination: DispensingInfo(), tag: 1, selection: $action) {}
                    //
                    //            NavigationLink("String", destination: DispensingInfo())
                    //                .padding(.all)
                    //                .font(.largeTitle)
                    //                .background(Color.white)
                    //            Button("Poker Chip \n Counting Companion") {
                    //                    self.action = 1
                    //            }
                    //                                .padding(.all)
                    //                                .font(.largeTitle)
                    //                                .background(Color.white)
                    
                    
                    VStack (alignment: .center) {
                        //                Text("Poker Chip")
                        //                    .font(.largeTitle)
                        //                Text("Counting Companion")
                        //                    .font(.largeTitle)
                        
                        Divider()
                        VStack (alignment: .center){
                            Text("Click the title to begin.")
                                .foregroundColor(.primary)
                                .font(.title2)
                                .padding(.bottom)
                                .fontWeight(.semibold)
                            
                            Text("NATIONAL PROBLEM GAMBLING HELPLINE \n                       1-800-522-4700")
                                .fontWeight(.regular)
                                .foregroundColor(.red)
                                .font(.headline)
                                .padding(.bottom)
                                .fontWeight(.bold)
                            
//                            NavigationLink("Bluetooth Connection", destination: BLE_View())
//                                .padding(.all)
//                                .font(.headline)
//                                .fontWeight(.semibold)
                            
                            NavigationLink("Bluetooth Connection", destination: MainView())
                                .padding(.all)
                                .font(.headline)
                                .fontWeight(.semibold)

                        }
                    }
                }
                .padding()
                //            Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Data())
    }
}
