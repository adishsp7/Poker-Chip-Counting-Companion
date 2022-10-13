//
//  Collection_Queue.swift
//  Poker Chip Counting Companion
//
//  Created by Adish Patil on 10/13/22.
//

import SwiftUI

struct Collection_Queue: View {
    var body: some View {
        NavigationStack{
            
            VStack{
                
                //Chip Dispense
                Text("Chip Collection").font(.system(size: 35, weight: .bold)).underline().foregroundColor(Color(#colorLiteral(red: 0.1, green: 0.13, blue: 0.24, alpha: 1))).padding(.vertical, 40.0)

                HStack{
                    //Player_1
                    Spacer()
                    Text("Player 1").font(.system(size: 32, weight: .regular))
                    Spacer()
                    Button("Collect"){
                        print("hello")
                    }
                    .font(.title)
                    .foregroundColor(.red)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                HStack{
                    //Player_2
                    Spacer()
                    Text("Player 2").font(.system(size: 32, weight: .regular))
                    Spacer()
                    Button("Collect"){
                        print("hello")
                    }
                    .font(.title)
                    .foregroundColor(.red)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                
                HStack{
                    //Player_3
                    Spacer()
                    Text("Player 3").font(.system(size: 32, weight: .regular))
                    Spacer()
                    Button("Collect"){
                        print("hello")
                    }
                    .font(.title)
                    .foregroundColor(.red)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                
                HStack{
                    //Player_4
                    Spacer()
                    Text("Player 4").font(.system(size: 32, weight: .regular))
                    Spacer()
                    Button("Collect"){
                        print("hello")
                    }
                    .font(.title)
                    .foregroundColor(.red)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                
                HStack{
                    //Player_5
                    Spacer()
                    Text("Player 5").font(.system(size: 32, weight: .regular))
                    Spacer()
                    Button("Collect"){
                        print("hello")
                    }
                    .font(.title)
                    .foregroundColor(.red)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                
                HStack{
                    //Player_6
                    Spacer()
                    Text("Player 6").font(.system(size: 32, weight: .regular))
                    Spacer()
                    Button("Collect"){
                        print("hello")
                    }
                    .font(.title)
                    .foregroundColor(.red)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                
                HStack{
                    //Player_7
                    Spacer()
                    Text("Player 7").font(.system(size: 32, weight: .regular))
                    Spacer()
                    Button("Collect"){
                        print("hello")
                    }
                    .font(.title)
                    .foregroundColor(.red)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                
                HStack{
                    //Player_8
                    Spacer()
                    Text("Player 8").font(.system(size: 32, weight: .regular))
                    Spacer()
                    Button("Collect"){
                        print("hello")
                    }
                    .font(.title)
                    .foregroundColor(.red)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                
                NavigationLink("Finish Collecting", destination: Buyout_Table())
                    .padding(.all)
                    .font(.largeTitle)
            }
            Spacer()
        }
    }
}

struct Collection_Queue_Previews: PreviewProvider {
    static var previews: some View {
        Collection_Queue().environmentObject(Data())
    }
}
