//import SwiftUI
//import SwiftData
//
//struct ContentView4: View {
//
//    var body: some View {
//        Button(action: {}) {
//            Image(systemName: "person.crop.circle")
//                .font(.system(size: 20))
//                .foregroundColor(.white)
//                .padding(10)
//                .background(Color(white: 0.2))
//                .clipShape(Circle())
//        }
//        }
//    }
//
//
//#Preview {
//    ContentView4()
//        .modelContainer(for: Item.self, inMemory: true)
//}
//
import SwiftUI
import SwiftData

struct ContentView4: View {

    var body: some View {
        ZStack {
            // الخلفية سوداء
            Color.black
                .ignoresSafeArea()
            
            // الزر
            Button(action: {}) {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.black.opacity(0.4),
                                Color(red: 26/255, green: 26/255, blue: 26/255)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 44, height: 44)
                    .overlay(
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    )
                    .shadow(color: Color(red: 38/255, green: 38/255, blue: 38/255), radius: 0.25, x: 1, y: 1)
                    .shadow(color: Color(red: 77/255, green: 77/255, blue: 77/255), radius: 0.25, x: 1, y: 1)
//                    .shadow(color: Color(red: 38/255, green: 38/255, blue: 38/255), radius: 0.25, x: -1, y: -1)
                    .shadow(color: Color(red: 77/255, green: 77/255, blue: 77/255), radius: 0.55, x: -1, y: -1)
            }
        }
    }
}

#Preview {
    ContentView4()
        .modelContainer(for: Item.self, inMemory: true)
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
