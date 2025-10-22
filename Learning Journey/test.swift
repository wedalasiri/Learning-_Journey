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

import SwiftUI

struct CircularGrayCalendarView: View {
    @State private var currentDate = Date()
    @State private var completedDays: [Date] = []
    @State private var freezedDays: [Date] = []
    @State private var learnedCount = 3
    @State private var freezedCount = 1
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 25) {
                
                // MARK: - Header
                HStack {
                    Text("Circular Calendar Demo")
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
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "person.crop.circle")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(5)
                                .clipShape(Circle())
                        }
                    }
                }
                .padding(.horizontal)
                
                // MARK: - Calendar + Stats Section مع خلفية دائرية
                VStack(spacing: 20) {
                    
                    // الأسبوعي
                    CircularWeekCalendarView(currentDate: $currentDate,
                                              learnedDates: completedDays,
                                              freezedDates: freezedDays)
                    
                    // الإحصائيات
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Learning Swift")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        HStack(spacing: 20) {
                            CircularStatCard(
                                icon: "flame.fill",
                                count: learnedCount,
                                label: "Days Learned",
                                color: Color(red: 0.35, green: 0.2, blue: 0)
                            )
                            
                            CircularStatCard(
                                icon: "cube.fill",
                                count: freezedCount,
                                label: "Days Freezed",
                                color: Color(red: 0.1, green: 0.25, blue: 0.35)
                            )
                        }
                    }
                    
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 50) // الحواف دائرية بالكامل
                        .fill(Color.gray.opacity(0.3))
                        .buttonStyle(.glassProminent)  // هنا استخدمنا ستايل الزجاج

                )
                
                Spacer()
                
                // MARK: - زر البرتقالي
                Button(action: {
                    let today = Calendar.current.startOfDay(for: Date())
                    if !completedDays.contains(today) && !freezedDays.contains(today) {
                        completedDays.append(today)
                        learnedCount += 1
                    }
                }) {
                    Text("Log as\nLearned")
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                }
                .buttonStyle(.glassProminent)
                .tint(Color(red: 1.0, green: 0.57, blue: 0.19))
                
                // MARK: - زر الأزرق
                Button(action: {
                    let today = Calendar.current.startOfDay(for: Date())
                    if !freezedDays.contains(today) && !completedDays.contains(today) {
                        freezedDays.append(today)
                        freezedCount += 1
                    }
                }) {
                    Text("Log as Freezed")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                        .frame(maxWidth: 300)
                        .padding()
                        .clipShape(Capsule())
                }
                .buttonStyle(.glassProminent)
                .tint(Color(red: 0.0, green: 0.82, blue: 0.88))
                
                // Footer
                Text("\(freezedCount) out of 2 Freezes used")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
            }
            .padding(.top, 20)
        }
    }
}

// MARK: - Week Calendar View
struct CircularWeekCalendarView: View {
    @Binding var currentDate: Date
    var learnedDates: [Date]
    var freezedDates: [Date]
    
    private var calendar: Calendar {
        var cal = Calendar.current
        cal.firstWeekday = 1
        return cal
    }
    
    private var weekDates: [Date] {
        guard let interval = calendar.dateInterval(of: .weekOfYear, for: currentDate) else { return [] }
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: interval.start) }
    }
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(monthYearFormatter.string(from: currentDate))
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                HStack(spacing: 20) {
                    Button { currentDate = calendar.date(byAdding: .weekOfYear, value: -1, to: currentDate) ?? currentDate } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.orange)
                    }
                    Button { currentDate = calendar.date(byAdding: .weekOfYear, value: 1, to: currentDate) ?? currentDate } label: {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.orange)
                    }
                }
            }
            
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
                    let isLearned = learnedDates.contains(calendar.startOfDay(for: date))
                    let isFreezed = freezedDates.contains(calendar.startOfDay(for: date))
                    
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
struct CircularStatCard: View {
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
            RoundedRectangle(cornerRadius: 50) // الحواف دائرية بالكامل
                .fill(color)
        )
    }
}

#Preview {
    CircularGrayCalendarView()
}
