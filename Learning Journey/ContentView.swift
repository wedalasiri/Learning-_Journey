//
//  ContentView.swift
//  Learning Journey
//
//  Created by Wed Ahmed Alasiri on 24/04/1447 AH.
//

import SwiftUI

struct First88: View {
    @State private var selectedTimeframe = "Week"
    @State private var topic = "Swift"
    
    let options = ["Week", "Month", "Year"]
    
    var body: some View {
        ZStack {
            // MARK: - الخلفية
            LinearGradient(colors: [.black],
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Spacer().frame(height: 40)
                
                // MARK: - شعار زجاجي (الدائرة)
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.orange.opacity(0.45),
                                    Color.orange.opacity(0.25)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 109, height: 109)
                        .glassEffect(.clear)
                        .overlay(
                            Circle()
                                .stroke(Color.orange.opacity(1), lineWidth: 0.25)
                                .shadow(color: Color.orange.opacity(1),
                                        radius: 0.25,
                                        x: 2,
                                        y: 2)
                        )
                        .overlay(
                            Circle()
                                .stroke(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.white.opacity(0.6),
                                            Color.orange.opacity(0.2)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 1
                                )
                                .blur(radius: 0.5)
                        )
                        .opacity(0.9)
                    
                    Image(systemName: "flame.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.orange)
                        .frame(width: 40, height: 40)
                }
                
                // MARK: - الترحيب
                VStack(alignment: .leading, spacing: 8) {
                    Text("Hello Learner")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("This app will help you learn everyday!")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                // MARK: - حقل الموضوع
                VStack(alignment: .leading, spacing: 16) {
                    Text("I want to learn")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    TextField("Enter topic", text: $topic)
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                        .padding(.bottom, 8)
                    
                    Divider().background(Color.gray)
                }
                .padding(.horizontal)
                
                // MARK: - أزرار المدة الزجاجية
                VStack(alignment: .leading, spacing: 20) {
                    Text("I want to learn it in a")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 20) {
                        ForEach(options, id: \.self) { option in
                            GlassButton77(
                                title: option,
                                isSelected: selectedTimeframe == option
                            ) {
                                selectedTimeframe = option
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // MARK: - زر البدء الزجاجي
                GlassButton77(title: "Start learning") {
                    print("Start learning about \(topic) in a \(selectedTimeframe)")
                }
                .padding(.horizontal)
                
                Spacer().frame(height: 30)
                
            }
        }
    }
}

#Preview {
    First88()
}

//
// MARK: - Glass Button (بشكل الزجاج البرتقالي)
//

struct GlassButton77: View {
    var title: String
    var isSelected: Bool = true
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .padding(.horizontal, 30)
                .padding(.vertical, 12)
                .background(
                    ZStack {
                        // خلفية زجاجية بتدرج برتقالي
                        Capsule()
                            .fill(
                                LinearGradient(
                                    colors: isSelected ?
                                    [Color.orange.opacity(0.45),
                                     Color.orange.opacity(0.25)] :
                                    [Color(white: 0.25), Color(white: 0.15)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .glassEffect(.clear)
                        
                        // حدود ولمعة خارجية
                        Capsule()
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.white.opacity(0.6),
                                        Color.orange.opacity(0.2)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                            .blur(radius: 0.5)
                        
                        // حدود برتقالية خفيفة بظل داخلي
                        Capsule()
                            .stroke(Color.orange.opacity(1), lineWidth: 0.25)
//
                    }
                )
                .opacity(isSelected ? 0.9 : 0.6)
//                .shadow(color: Color.orange.opacity(0.3), radius: 6, x: 0, y: 3)
        }
        .buttonStyle(ScaleButtonStyle77())//.glass
    }
}

//
// MARK: - حركة الضغط
//

struct ScaleButtonStyle77: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
