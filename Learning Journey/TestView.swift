//
//  TestView.swift
//  Learning Journey
//
//  Created by Wed Ahmed Alasiri on 28/04/1447 AH.
//
//
//import SwiftUI
//
//struct TestView: View {
//    var body: some View {
//        ZStack {
//            Color.black
//                .ignoresSafeArea()
//            
//            Button(action: {}) {
//                Circle()
//                    .fill(Color.blue)
//                    .glassEffect(.clear)
//                
//            }
//            
//            
//        }
//    }
//    
//}
//
//#Preview {
//    TestView()
//}
//import SwiftUI
//
//struct TestView: View {
//    var body: some View {
//        ZStack {
//            // خلفية داكنة ليوضح تأثير الزجاج
//            LinearGradient(colors: [.black, .gray.opacity(0.5)],
//                           startPoint: .top,
//                           endPoint: .bottom)
//                .ignoresSafeArea()
//            
//            Button(action: {}) {
//                ZStack {
//                    // الزجاج الأساسي
//                    Circle()
//                        .fill(.ultraThinMaterial)
//                        .glassEffect(.clear)
//                    
//                    // لمعة خفيفة تعطي انعكاس واقعي
//                    Circle()
//                        .stroke(
//                            LinearGradient(
//                                gradient: Gradient(colors: [
//                                    Color.white.opacity(0.6),
//                                    Color.orange.opacity(0.2)
//                                ]),
//                                startPoint: .topLeading,
//                                endPoint: .bottomTrailing
//                            ),
//                            lineWidth: 1
//                        )
//                        .blur(radius: 0.5)
//                }
//                .frame(width: 80, height: 80)
////                .shadow(color: Color.orange.opacity(0.4), radius: 8, x: 0, y: 4)
//            }
//        }
//    }
//}
//
//#Preview {
//    TestView()
//}
//
//
//
//import SwiftUI
//
//struct TestView: View {
//    var body: some View {
//        ZStack {
//            // خلفية داكنة لإبراز التأثير
//            LinearGradient(colors: [.black],
//                           startPoint: .top,
//                           endPoint: .bottom)
//                .ignoresSafeArea()
//            
//            Button(action: {}) {
//                ZStack {
//                    // خلفية زجاجية بلون بني
//                    Circle()
//                        .fill(
//                            LinearGradient(
//                                colors: [
//                                    Color.brown.opacity(0.5),
//                                    Color.brown.opacity(0.2)
//                                ],
//                                startPoint: .topLeading,
//                                endPoint: .bottomTrailing
//                            )
//                        )
//                        .glassEffect(.clear)
//                    
//                    // الحواف اللامعة
//                    Circle()
//                        .stroke(
//                            LinearGradient(
//                                gradient: Gradient(colors: [
//                                    Color.white.opacity(0.8),
//                                    Color.brown.opacity(0.8)
//                                ]),
//                                startPoint: .topLeading,
//                                endPoint: .bottomTrailing
//                            ),
//                            lineWidth: 1
//                        )
//                        .blur(radius: 0.5)
//                }
//                .frame(width: 80, height: 80)
//                
//            }
//        }
//    }
//}
//
//#Preview {
//    TestView()
//}
//
//  First.swift
//  Learning Journey
//
//  Created by Wed Ahmed Alasiri on 24/04/1447 AH.
//
//
//import SwiftUI
//
//struct First8: View {
//    @State private var selectedTimeframe = "Week"
//    @State private var topic = "Swift"
//    
//    let options = ["Week", "Month", "Year"]
//    
//    var body: some View {
//        ZStack {
//            // MARK: - الخلفية
//            LinearGradient(colors: [.black],
//                           startPoint: .top,
//                           endPoint: .bottom)
//                .ignoresSafeArea()
//            
//            VStack(spacing: 40) {
//                Spacer().frame(height: 40)
//                
//                // MARK: - شعار زجاجي (الدائرة)
//                ZStack {
//                    Circle()
//                        .fill(
//                            LinearGradient(
//                                colors: [
//                                    Color.orange.opacity(0.45),
//                                    Color.orange.opacity(0.25)
//                                ],
//                                startPoint: .topLeading,
//                                endPoint: .bottomTrailing
//                            )
//                        )
//                        .frame(width: 109, height: 109)
//                        .glassEffect(.clear)
//                        .overlay(
//                            Circle()
//                                .stroke(Color.orange.opacity(1), lineWidth: 0.25)
//                                .shadow(color: Color.orange.opacity(1),
//                                        radius: 0.25,
//                                        x: 2,
//                                        y: 2)
//                        )
//                        .overlay(
//                            Circle()
//                                .stroke(
//                                    LinearGradient(
//                                        gradient: Gradient(colors: [
//                                            Color.white.opacity(0.6),
//                                            Color.orange.opacity(0.2)
//                                        ]),
//                                        startPoint: .topLeading,
//                                        endPoint: .bottomTrailing
//                                    ),
//                                    lineWidth: 1
//                                )
//                                .blur(radius: 0.5)
//                        )
//                        .opacity(0.9)
//                    
//                    Image(systemName: "flame.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .foregroundColor(.orange)
//                        .frame(width: 40, height: 40)
//                }
//                
//                // MARK: - الترحيب
//                VStack(alignment: .leading, spacing: 8) {
//                    Text("Hello Learner")
//                        .font(.system(size: 34, weight: .bold))
//                        .foregroundColor(.white)
//                    
//                    Text("This app will help you learn everyday!")
//                        .font(.system(size: 16))
//                        .foregroundColor(.gray)
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(.horizontal)
//                
//                // MARK: - حقل الموضوع
//                VStack(alignment: .leading, spacing: 16) {
//                    Text("I want to learn")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                    
//                    TextField("Enter topic", text: $topic)
//                        .font(.system(size: 18))
//                        .foregroundColor(.gray)
//                        .padding(.bottom, 8)
//                    
//                    Divider().background(Color.gray)
//                }
//                .padding(.horizontal)
//                
//                // MARK: - أزرار المدة الزجاجية
//                VStack(alignment: .leading, spacing: 20) {
//                    Text("I want to learn it in a")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                    
//                    HStack(spacing: 20) {
//                        ForEach(options, id: \.self) { option in
//                            GlassButton7(
//                                title: option,
//                                isSelected: selectedTimeframe == option
//                            ) {
//                                selectedTimeframe = option
//                            }
//                        }
//                    }
//                }
//                .padding(.horizontal)
//                
//                Spacer()
//                
//                // MARK: - زر البدء الزجاجي
//                GlassButton7(title: "Start learning") {
//                    print("Start learning about \(topic) in a \(selectedTimeframe)")
//                }
//                .padding(.horizontal)
//                
//                Spacer().frame(height: 30)
//            }
//        }
//    }
//}
//
//#Preview {
//    First8()
//}
//
////
//// MARK: - Glass Button (بشكل الزجاج البرتقالي)
////
//
//struct GlassButton7: View {
//    var title: String
//    var isSelected: Bool = true
//    var action: () -> Void
//    
//    var body: some View {
//        Button(action: action) {
//            Text(title)
//                .font(.system(size: 16, weight: .medium))
//                .foregroundColor(.white)
//                .padding(.horizontal, 30)
//                .padding(.vertical, 12)
//                .background(
//                    ZStack {
//                        // خلفية زجاجية بتدرج برتقالي
//                        Capsule()
//                            .fill(
//                                LinearGradient(
//                                    colors: isSelected ?
//                                    [Color.orange.opacity(0.45),
//                                     Color.orange.opacity(0.25)] :
//                                    [Color(white: 0.25), Color(white: 0.15)],
//                                    startPoint: .topLeading,
//                                    endPoint: .bottomTrailing
//                                )
//                            )
//                            .glassEffect(.clear)
//                        
//                        // حدود ولمعة خارجية
//                        Capsule()
//                            .stroke(
//                                LinearGradient(
//                                    gradient: Gradient(colors: [
//                                        Color.white.opacity(0.6),
//                                        Color.orange.opacity(0.2)
//                                    ]),
//                                    startPoint: .topLeading,
//                                    endPoint: .bottomTrailing
//                                ),
//                                lineWidth: 1
//                            )
//                            .blur(radius: 0.5)
//                        
//                        // حدود برتقالية خفيفة بظل داخلي
//                        Capsule()
//                            .stroke(Color.orange.opacity(1), lineWidth: 0.25)
////
//                    }
//                )
//                .opacity(isSelected ? 0.9 : 0.6)
////                .shadow(color: Color.orange.opacity(0.3), radius: 6, x: 0, y: 3)
//        }
//        .buttonStyle(ScaleButtonStyle7())
//    }
//}
//
////
//// MARK: - حركة الضغط
////
//
//struct ScaleButtonStyle7: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
//            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
//    }
//}


//
//  TestActivityView.swift
//  Learning Journey
//
//  Created by Wed Ahmed Alasiri on 27/04/1447 AH.
//

import SwiftUI

struct TestActivityView: View {
    // MARK: - التخزين الدائم
    @AppStorage("learnedCountTest") private var learnedCountTest = 0
    @AppStorage("freezedCountTest") private var freezedCountTest = 0
    @AppStorage("completedDatesDataTest") private var completedDatesData = Data()
    @AppStorage("freezedDatesDataTest") private var freezedDatesData = Data()
    
    // MARK: - الحالات المؤقتة
    @State private var activeDate = Date()
    @State private var completedDatesTest: [Date] = []
    @State private var freezedDatesTest: [Date] = []
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 25) {
                
                // MARK: - Header
                HStack {
                    Text("Activity (Test)")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    HStack(spacing: 16) {
                        Button(action: {}) {
                            Image(systemName: "calendar")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(5)
                                .clipShape(Circle())
                                .glassEffect(.clear)
                        }
                        .buttonStyle(.glass)
                        
                        Button(action: {}) {
                            Image(systemName: "person.crop.circle")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(5)
                                .clipShape(Circle())
                                .glassEffect(.clear)
                        }
                        .buttonStyle(.glass)
                    }
                }
                .padding(.horizontal)
                
                // MARK: - Calendar Section
                TestWeekCalendarView(
                    selectedDate: $activeDate,
                    doneDates: completedDatesTest,
                    freezeDates: freezedDatesTest
                )
                .padding(.horizontal)
                
                // MARK: - Stats Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Learning Swift (Test)")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 20) {
                        TestStatCard(
                            icon: "flame.fill",
                            count: learnedCountTest,
                            label: "Days Learned",
                            color: Color(red: 0.35, green: 0.2, blue: 0)
                        )
                        
                        TestStatCard(
                            icon: "cube.fill",
                            count: freezedCountTest,
                            label: "Days Freezed",
                            color: Color(red: 0.1, green: 0.25, blue: 0.35)
                        )
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // MARK: - Orange Button (Learned)
                Button(action: {
                    let today = Calendar.current.startOfDay(for: Date())
                    if !completedDatesTest.contains(today) && !freezedDatesTest.contains(today) {
                        completedDatesTest.append(today)
                        learnedCountTest += 1
                        saveData()
                    }
                }) {
                    Text("Log as\nLearned")
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 250, height: 250)
                }
                .buttonStyle(.glassProminent)
                .tint(Color(red: 1.0, green: 0.57, blue: 0.19))
                
                // MARK: - Blue Button (Freezed)
                Button(action: {
                    let today = Calendar.current.startOfDay(for: Date())
                    if !freezedDatesTest.contains(today) && !completedDatesTest.contains(today) {
                        freezedDatesTest.append(today)
                        freezedCountTest += 1
                        saveData()
                    }
                }) {
                    Text("Log as Freezed")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                        .frame(maxWidth: 300)
                        .padding()
                }
                .buttonStyle(.glassProminent)
                .tint(Color(red: 0.0, green: 0.82, blue: 0.88))
                
                // MARK: - Footer
                Text("\(freezedCountTest) out of 2 Freezes used (Test)")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
            }
            .padding(.top, 20)
            .onAppear {
                loadData()
            }
        }
    }
    
    // MARK: - حفظ البيانات
    private func saveData() {
        if let encodedCompleted = try? JSONEncoder().encode(completedDatesTest) {
            completedDatesData = encodedCompleted
        }
        if let encodedFreezed = try? JSONEncoder().encode(freezedDatesTest) {
            freezedDatesData = encodedFreezed
        }
    }
    
    private func loadData() {
        if let decodedCompleted = try? JSONDecoder().decode([Date].self, from: completedDatesData) {
            completedDatesTest = decodedCompleted
        }
        if let decodedFreezed = try? JSONDecoder().decode([Date].self, from: freezedDatesData) {
            freezedDatesTest = decodedFreezed
        }
    }
}

// MARK: - Calendar View
struct TestWeekCalendarView: View {
    @Binding var selectedDate: Date
    var doneDates: [Date]
    var freezeDates: [Date]
    
    private var calendar: Calendar {
        var cal = Calendar.current
        cal.firstWeekday = 1
        return cal
    }
    
    private var weekDates: [Date] {
        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: selectedDate) else { return [] }
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: weekInterval.start) }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            // Month Header
            HStack {
                Text(monthYearFormatter.string(from: selectedDate))
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                HStack(spacing: 20) {
                    Button {
                        withAnimation {
                            selectedDate = calendar.date(byAdding: .weekOfYear, value: -1, to: selectedDate) ?? selectedDate
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.orange)
                    }
                    
                    Button {
                        withAnimation {
                            selectedDate = calendar.date(byAdding: .weekOfYear, value: 1, to: selectedDate) ?? selectedDate
                        }
                    } label: {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.orange)
                    }
                }
            }
            
            // Week Days
            VStack(spacing: 8) {
                HStack {
                    ForEach(weekDates, id: \.self) { date in
                        Text(shortWeekdayFormatter.string(from: date))
                            .font(.caption)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity)
                    }
                }
                
                HStack {
                    ForEach(weekDates, id: \.self) { date in
                        let isToday = calendar.isDateInToday(date)
                        let isLearned = doneDates.contains(calendar.startOfDay(for: date))
                        let isFreezed = freezeDates.contains(calendar.startOfDay(for: date))
                        
                        ZStack {
                            if isLearned {
                                Circle().fill(Color.orange.opacity(0.3))
                            } else if isFreezed {
                                Circle().fill(Color.blue.opacity(0.3))
                            } else if isToday {
                                Circle().fill(Color.orange)
                            } else {
                                Circle().fill(Color.clear)
                            }
                            
                            Text(dayFormatter.string(from: date))
                                .font(.system(size: 17, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 40, height: 40)
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 8)
        }
    }
    
    // MARK: - Formatters
    private var dayFormatter: DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "d"
        return f
    }
    
    private var shortWeekdayFormatter: DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "EEE"
        return f
    }
    
    private var monthYearFormatter: DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "MMMM yyyy"
        return f
    }
}

// MARK: - Stat Card
struct TestStatCard: View {
    var icon: String
    var count: Int
    var label: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(.orange)
                .font(.system(size: 20))
            VStack(alignment: .leading, spacing: 2) {
                Text("\(count)")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                Text(label)
                    .font(.caption)
                    .foregroundColor(.white)
            }
        }
        .frame(width: 140, height: 60)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
        )
    }
}

#Preview {
    TestActivityView()
}
