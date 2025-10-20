
import SwiftUI
import SwiftData

struct test: View {
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            Button(action: {}) {
                Circle()
                    .fill(Color.blue)
                
            }
            
            
        }
    }
    
    
    ////
    ////  t2.swift
    ////  Learning Journey
    ////
    ////  Created by Wed Ahmed Alasiri on 27/04/1447 AH.
    ////
    //
    ////
    ////  ContentView.swift
    ////  Learning Journey
    ////
    ////  Created by Wed Ahmed Alasiri on 24/04/1447 AH.
    ////
    //
    //import SwiftUI
    //import SwiftData
    //
    //struct ContentView44: View {
    //    var body: some View {
    //
    //        VStack{
    //            Button(action: {
    //
    //                print("start")
    //
    //            }
    //
    //            ) {
    //                Text("hi")
    //                    .font(.system(size: 60))
    //
    ////                Image("Primary")
    ////                    .resizable()
    ////                    .scaledToFit()
    ////                    .frame(width: 282, height: 200)
    ////                Text("hi")
    ////                    .font(.system(size: 60))
    ////
    //
    //
    //            }
    //        }
    ////
    ////
    ////        ZStack {
    ////
    ////            Text("hi")
    ////        }
    ////
    //
    //
    //    }
    //}
    //#Preview {
    //
    //
    //    ContentView44()
    ////        .modelContainer(for: Item.self, inMemory: true)
    //}
}
