//
//import SwiftUI
//import SwiftData
//
//struct test: View {
//    
//    var body: some View {
//        ZStack {
//            Color.black
//                .ignoresSafeArea()
//            
//            Button(action: {}) {
//                Circle()
//                    .fill(Color.blue)
//                
//            }
//            
//            
//        }
//    }
//    
//    
//    ////
//    ////  t2.swift
//    ////  Learning Journey
//    ////
//    ////  Created by Wed Ahmed Alasiri on 27/04/1447 AH.
//    ////
//    //
//    ////
//    ////  ContentView.swift
//    ////  Learning Journey
//    ////
//    ////  Created by Wed Ahmed Alasiri on 24/04/1447 AH.
//    ////
//    //
//    //import SwiftUI
//    //import SwiftData
//    //
//    //struct ContentView44: View {
//    //    var body: some View {
//    //
//    //        VStack{
//    //            Button(action: {
//    //
//    //                print("start")
//    //
//    //            }
//    //
//    //            ) {
//    //                Text("hi")
//    //                    .font(.system(size: 60))
//    //
//    ////                Image("Primary")
//    ////                    .resizable()
//    ////                    .scaledToFit()
//    ////                    .frame(width: 282, height: 200)
//    ////                Text("hi")
//    ////                    .font(.system(size: 60))
//    ////
//    //
//    //
//    //            }
//    //        }
//    ////
//    ////
//    ////        ZStack {
//    ////
//    ////            Text("hi")
//    ////        }
//    ////
//    //
//    //
//    //    }
//    //}
//    //#Preview {
//    //
//    //
//    //    ContentView44()
//    ////        .modelContainer(for: Item.self, inMemory: true)
//    //}
//}
//
//  GlassBackgroundTestView.swift
//  Learning Journey
//
//  Created by Wed Ahmed Alasiri.
//

//
//  GlassCalendarTestView.swift
//  Learning Journey
//
//  Created by Wed Ahmed Alasiri.
//

//
//  GlassCalendarDemoView.swift
//  Learning Journey
//
//  Created by Wed Ahmed Alasiri.
//

//
//  GrayBackgroundCalendarView.swift
//  Learning Journey
//
//  Created by Wed Ahmed Alasiri.
//
//
//  GrayBackgroundCalendarView.swift
//  Learning Journey
//
//  Created by Wed Ahmed Alasiri.
//

//
//  CircularGrayCalendarView.swift
//  Learning Journey
//
//  Created by Wed Ahmed Alasiri.
//

//import SwiftUI
//
//struct CircularGrayCalendarView: View {
//    @State private var currentDate = Date()
//    @State private var completedDays: [Date] = []
//    @State private var freezedDays: [Date] = []
//    @State private var learnedCount = 3
//    @State private var freezedCount = 1
//    
//    var body: some View {
////        ZStack {
//            Color.black.ignoresSafeArea()
//            
//            VStack(spacing: 25) {
//                
//                // MARK: - Header
//                HStack {
//                    Text("Circular Calendar Demo")
//                        .font(.largeTitle.bold())
//                        .foregroundColor(.white)
//                    
//                    Spacer()
//                    
//                    HStack(spacing: 16) {
//                        Button(action: {}) {
//                            Image(systemName: "calendar")
//                                .font(.system(size: 20))
//                                .foregroundColor(.white)
//                                .padding(5)
//                                .clipShape(Circle())
//                        }
//                        
//                        Button(action: {}) {
//                            Image(systemName: "person.crop.circle")
//                                .font(.system(size: 20))
//                                .foregroundColor(.white)
//                                .padding(5)
//                                .clipShape(Circle())
//                        }
//                    }
//                }
//                .padding(.horizontal)
//                
//                // MARK: - Calendar + Stats Section مع خلفية دائرية
//                VStack(spacing: 20) {
//                    
//                    // الأسبوعي
//                    CircularWeekCalendarView(currentDate: $currentDate,
//                                              learnedDates: completedDays,
//                                              freezedDates: freezedDays)
//                    
//                    // الإحصائيات
//                    VStack(alignment: .leading, spacing: 12) {
//                        Text("Learning Swift")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                        
//                        HStack(spacing: 20) {
//                            CircularStatCard(
//                                icon: "flame.fill",
//                                count: learnedCount,
//                                label: "Days Learned",
//                                color: Color(red: 0.35, green: 0.2, blue: 0)
//                            )
//                            
//                            CircularStatCard(
//                                icon: "cube.fill",
//                                count: freezedCount,
//                                label: "Days Freezed",
//                                color: Color(red: 0.1, green: 0.25, blue: 0.35)
//                            )
//                        }
//                    }
//                    
//                }
//                .padding()
//                .background(
//                    RoundedRectangle(cornerRadius: 50) // الحواف دائرية بالكامل
//                        .fill(Color.gray.opacity(0.3))
//                        .buttonStyle(.glassProminent)  // هنا استخدمنا ستايل الزجاج
//
//                )
//                
//                Spacer()
//                
//                // MARK: - زر البرتقالي
//                Button(action: {
//                    let today = Calendar.current.startOfDay(for: Date())
//                    if !completedDays.contains(today) && !freezedDays.contains(today) {
//                        completedDays.append(today)
//                        learnedCount += 1
//                    }
//                }) {
//                    Text("Log as\nLearned")
//                        .font(.system(size: 28, weight: .bold))
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(.white)
//                        .frame(width: 250, height: 250)
//                        .clipShape(Circle())
//                }
//                .buttonStyle(.glassProminent)
//                .tint(Color(red: 1.0, green: 0.57, blue: 0.19))
//                
//                // MARK: - زر الأزرق
//                Button(action: {
//                    let today = Calendar.current.startOfDay(for: Date())
//                    if !freezedDays.contains(today) && !completedDays.contains(today) {
//                        freezedDays.append(today)
//                        freezedCount += 1
//                    }
//                }) {
//                    Text("Log as Freezed")
//                        .font(.system(size: 18, weight: .medium))
//                        .foregroundColor(.white)
//                        .frame(maxWidth: 300)
//                        .padding()
//                        .clipShape(Capsule())
//                }
//                .buttonStyle(.glassProminent)
//                .tint(Color(red: 0.0, green: 0.82, blue: 0.88))
//                
//                // Footer
//                Text("\(freezedCount) out of 2 Freezes used")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//                    .padding(.bottom, 10)
//            }
//            .padding(.top, 20)
//        }
//    }
//}
//
//// MARK: - Week Calendar View
//struct CircularWeekCalendarView: View {
//    @Binding var currentDate: Date
//    var learnedDates: [Date]
//    var freezedDates: [Date]
//    
//    private var calendar: Calendar {
//        var cal = Calendar.current
//        cal.firstWeekday = 1
//        return cal
//    }
//    
//    private var weekDates: [Date] {
//        guard let interval = calendar.dateInterval(of: .weekOfYear, for: currentDate) else { return [] }
//        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: interval.start) }
//    }
//    
//    var body: some View {
//        VStack(spacing: 8) {
//            HStack {
//                Text(monthYearFormatter.string(from: currentDate))
//                    .font(.headline)
//                    .foregroundColor(.white)
//                Spacer()
//                HStack(spacing: 20) {
//                    Button { currentDate = calendar.date(byAdding: .weekOfYear, value: -1, to: currentDate) ?? currentDate } label: {
//                        Image(systemName: "chevron.left")
//                            .foregroundColor(.orange)
//                    }
//                    Button { currentDate = calendar.date(byAdding: .weekOfYear, value: 1, to: currentDate) ?? currentDate } label: {
//                        Image(systemName: "chevron.right")
//                            .foregroundColor(.orange)
//                    }
//                }
//            }
//            
//            HStack {
//                ForEach(weekDates, id: \.self) { date in
//                    Text(shortWeekdayFormatter.string(from: date))
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                        .frame(maxWidth: .infinity)
//                }
//            }
//            
//            HStack {
//                ForEach(weekDates, id: \.self) { date in
//                    let isToday = calendar.isDateInToday(date)
//                    let isLearned = learnedDates.contains(calendar.startOfDay(for: date))
//                    let isFreezed = freezedDates.contains(calendar.startOfDay(for: date))
//                    
//                    ZStack {
//                        if isLearned {
//                            Circle().fill(Color.orange.opacity(0.3))
//                        } else if isFreezed {
//                            Circle().fill(Color.blue.opacity(0.3))
//                        } else if isToday {
//                            Circle().fill(Color.orange)
//                        } else {
//                            Circle().fill(Color.clear)
//                        }
//                        
//                        Text(dayFormatter.string(from: date))
//                            .font(.system(size: 17, weight: .medium))
//                            .foregroundColor(.white)
//                    }
//                    .frame(width: 40, height: 40)
//                    .frame(maxWidth: .infinity)
//                }
//            }
//        }
//        .padding(.vertical, 10)
//        .padding(.horizontal, 8)
//    }
//    
//    private var dayFormatter: DateFormatter {
//        let f = DateFormatter()
//        f.dateFormat = "d"
//        return f
//    }
//    
//    private var shortWeekdayFormatter: DateFormatter {
//        let f = DateFormatter()
//        f.dateFormat = "EEE"
//        return f
//    }
//    
//    private var monthYearFormatter: DateFormatter {
//        let f = DateFormatter()
//        f.dateFormat = "MMMM yyyy"
//        return f
//    }
//}
//
//// MARK: - Stat Card
//struct CircularStatCard: View {
//    var icon: String
//    var count: Int
//    var label: String
//    var color: Color
//    
//    var body: some View {
//        HStack(spacing: 8) {
//            Image(systemName: icon)
//                .foregroundColor(.orange)
//                .font(.system(size: 20))
//            VStack(alignment: .leading, spacing: 2) {
//                Text("\(count)")
//                    .font(.title3.bold())
//                    .foregroundColor(.white)
//                Text(label)
//                    .font(.caption)
//                    .foregroundColor(.white)
//            }
//        }
//        .frame(width: 140, height: 60)
//        .background(
//            RoundedRectangle(cornerRadius: 50) // الحواف دائرية بالكامل
//                .fill(color)
//        )
//    }
//}
//
//#Preview {
//    CircularGrayCalendarView()
//}





//
//  test 3.swift
//  Learning Journey
//
//  Created by Wed Ahmed Alasiri on 30/04/1447 AH.
//

import SwiftUI

struct ActivityView56: View {
    @State private var currentDate = Date()
    @State private var learnedCount = 0
    @State private var freezedCount = 0
    @State private var completedDates: [Date] = []
    @State private var freezedDates: [Date] = []
    @State private var isPressedLearned = false
    @State private var isPressedFreezed = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 25) {
                // MARK: - Header
                HStack {
                    Text("Activity")
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
                
                // MARK: - Glassy Background Section
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 0.05, green: 0.05, blue: 0.05))
                        .overlay(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.05),
                                    Color.black.opacity(0.05)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white.opacity(0.1), lineWidth: 0.5)
                        )
                        .frame(width: 375, height: 300)
                    
                    VStack(spacing: 16) {
                        // التقويم
                        TestWeekCalendarView(
                            selectedDate: $currentDate,
                            doneDates: completedDates,
                            freezeDates: freezedDates
                        )
                        .padding(.horizontal)

                        Divider().background(Color.white.opacity(0.15))

                        // Learning Swift + الكبسولات
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Learning Swift")
                                .font(.headline)
                                .foregroundColor(.white)

                            HStack(spacing: 20) {
                                TestStatCard(
                                    icon: "flame.fill",
                                    count: learnedCount,
                                    label: "Days Learned",
                                    color: Color(red: 0.35, green: 0.2, blue: 0)
                                )

                                TestStatCard(
                                    icon: "cube.fill",
                                    count: freezedCount,
                                    label: "Days Freezed",
                                    color: Color(red: 0.1, green: 0.25, blue: 0.35)
                                )
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical, 20)
                }
                .padding(.horizontal)

                Spacer()
                
                // الزر البرتقالي (Learned)
                Button(action: {
                    let today = Calendar.current.startOfDay(for: Date())
                    if !completedDates.contains(today) && !freezedDates.contains(today) {
                        completedDates.append(today)
                        learnedCount += 1
                    }
                    // 🔸 هنا تخلي حالة الضغط تتفعّل
                        isPressedLearned = true
                }) {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: completedDates.contains(Calendar.current.startOfDay(for: Date())) ?
                                        [Color.orange.opacity(0.25), Color.orange.opacity(0.1)] :  // بعد الضغط يبقى شفاف
                                        [Color(red: 1.0, green: 0.57, blue: 0.19), Color.orange.opacity(0.7)], // الحالة الأصلية
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .glassEffect(.clear)
                            .frame(width: 250, height: 250)
                            .overlay(
                                Circle()
                                    .stroke(
                                        LinearGradient(
                                            colors: [
                                                Color.white.opacity(0.6),
                                                Color.orange.opacity(0.2)
                                            ],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 1
                                    )
                                    .blur(radius: 0.5)
                            )

                        Text(isPressedLearned ? "Learned\nToday" : "Log as\nLearned")
                            .font(.system(size: 28, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                }
                .buttonStyle(ScaleButtonStyle77())


                // الزر الأزرق (Freezed)
                Button(action: {
                    let today = Calendar.current.startOfDay(for: Date())
                    if !freezedDates.contains(today) && !completedDates.contains(today) {
                        freezedDates.append(today)
                        freezedCount += 1
                    }
                    
                }) {
                    Text("Log as Freezed")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                        .frame(maxWidth: 300)
                        .padding()
                        .background(
                            Capsule()
                                .fill(
                                    LinearGradient(
                                        colors: freezedDates.contains(Calendar.current.startOfDay(for: Date())) ?
                                            [Color.cyan.opacity(0.25), Color.cyan.opacity(0.1)] :  // بعد الضغط يبقى شفاف
                                            [Color(red: 0.0, green: 0.82, blue: 0.88), Color.cyan.opacity(0.7)], // الحالة الأصلية
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        )
                }
                .buttonStyle(ScaleButtonStyle77())


                // MARK: - Footer
                Text("\(freezedCount) out of 2 Freezes used")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
            }
            .padding(.top, 20)
        }
    }
}

// MARK: - ScaleButtonStyle77 (نفس ستايل الضغط)
struct ScaleButtonStyle77: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}

// MARK: - TestWeekCalendarView & TestStatCard
// (نفس الكود اللي عندك تمامًا)


#Preview {
    ActivityView56()
}
