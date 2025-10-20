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
////import SwiftUI
////import SwiftData
////
////struct ContentView44: View {
////    var body: some View {
////    
////        VStack{
////            Button(action: {
////                
////                print("start")
////
////            }
////                   
////            ) {
////               
////                
////                Image("Primary")
////                    .resizable()
////                    .scaledToFit()
////                    .frame(width: 282, height: 200)
////                
////                
////            }
////        }
////        
////        
////        
////        
////    }
////}
////#Preview {
////    ContentView44()
//////        .modelContainer(for: Item.self, inMemory: true)
////}
//
//
//
//import SwiftUI
//
//struct WeekCalendarView: View {
//    @State private var currentDate = Date()
//    
//    private var calendar: Calendar {
//        var cal = Calendar.current
//        cal.firstWeekday = 1 // Sunday
//        return cal
//    }
//    
//    private var weekDates: [Date] {
//        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: currentDate) else { return [] }
//        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: weekInterval.start) }
//    }
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            
//            // MARK: - Month Header
//            HStack {
//                Text(monthYearFormatter.string(from: currentDate))
//                    .font(.headline)
//                    .foregroundColor(.white)
//                Spacer()
//                HStack(spacing: 20) {
//                    Button {
//                        withAnimation {
//                            currentDate = calendar.date(byAdding: .weekOfYear, value: -1, to: currentDate) ?? currentDate
//                        }
//                    } label: {
//                        Image(systemName: "chevron.left")
//                            .foregroundColor(.orange)
//                    }
//                    
//                    Button {
//                        withAnimation {
//                            currentDate = calendar.date(byAdding: .weekOfYear, value: 1, to: currentDate) ?? currentDate
//                        }
//                    } label: {
//                        Image(systemName: "chevron.right")
//                            .foregroundColor(.orange)
//                    }
//                }
//            }
//            
//            // MARK: - Week Days
//            VStack(spacing: 8) {
//                // Day names
//                HStack {
//                    ForEach(weekDates, id: \.self) { date in
//                        Text(shortWeekdayFormatter.string(from: date))
//                            .font(.caption)
//                            .foregroundColor(.gray)
//                            .frame(maxWidth: .infinity)
//                    }
//                }
//                
//                // Day numbers
//                HStack {
//                    ForEach(weekDates, id: \.self) { date in
//                        let isToday = calendar.isDateInToday(date)
//                        
//                        ZStack {
//                            if isToday {
//                                Circle()
//                                    .fill(Color.orange)
//                            } else if date < Date() {
//                                Circle()
//                                    .fill(Color.orange.opacity(0.3))
//                            } else {
//                                Circle()
//                                    .fill(Color.clear)
//                            }
//                            
//                            Text(dayFormatter.string(from: date))
//                                .font(.system(size: 17, weight: .medium))
//                                .foregroundColor(.white)
//                        }
//                        .frame(width: 40, height: 40)
//                        .frame(maxWidth: .infinity)
//                    }
//                }
//            }
//            .padding(.vertical, 10)
//            .padding(.horizontal, 8)
//            .background(
//                RoundedRectangle(cornerRadius: 15)
//                    .fill(Color(red: 0.1, green: 0.1, blue: 0.1))
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 15)
//                            .stroke(Color.orange, lineWidth: 2)
//                    )
//            )
//        }
//        .padding(.horizontal)
//    }
//    
//    // MARK: - Formatters
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
//#Preview {
//    ZStack {
//        Color.black.ignoresSafeArea()
//        WeekCalendarView()
//    }
//}



import SwiftUI

struct ActivityView5: View {
    @State private var currentDate = Date() // To sync with WeekCalendarView
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 25) {
                
                //  Header
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
                
                // MARK: - Calendar Section (Integrated WeekCalendarView)
                WeekCalendarView(currentDate: $currentDate)
                    .padding(.horizontal)
                
                // MARK: - Stats Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Learning Swift")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 20) {
                        StatCard(
                            icon: "flame.fill",
                            count: 3,
                            label: "Days Learned",
                            color: Color(red: 0.35, green: 0.2, blue: 0)
                        )
                        
                        
                        StatCard(
                            icon: "cube.fill",
                            count: 1,
                            label: "Day Freezed",
                            color: Color(red: 0.1, green: 0.25, blue: 0.35)
                        )
                    }
                }
                
                
                
                
                .padding(.horizontal)
                
                Spacer()
                
                // MARK: - Big Orange Button
                Button(action: {}) {
                    Text("Log as\nLearned")
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 250, height: 250)
                        .glassEffect(.clear)
                        .background(
                            Circle()
                                .fill(Color(red: 0.8, green: 0.4, blue: 0))
                                .glassEffect(.clear)
                       )
                }
//                .buttonStyle(.glass)
                
                
                // MARK: - Blue Button
                Button(action: {}) {
                    Text("Log as Freezed")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                        .frame(maxWidth: 300)
                    
                        .padding()
                        .glassEffect(.clear)
                        .background(
                            Capsule()
                                .fill(Color(red: 0.1, green: 0.5, blue: 0.6))
                        )
                }
//                .buttonStyle(.glass)
                
                // Footer
                Text("1 out of 2 Freezes used")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
            }
            .padding(.top, 20)
        }
    }
}

// MARK: - WeekCalendarView (Modified to accept Binding)
struct WeekCalendarView: View {
    @Binding var currentDate: Date
    
    private var calendar: Calendar {
        var cal = Calendar.current
        cal.firstWeekday = 1
        return cal
    }
    
    private var weekDates: [Date] {
        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: currentDate) else { return [] }
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: weekInterval.start) }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            // Month Header
            HStack {
                Text(monthYearFormatter.string(from: currentDate))
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                HStack(spacing: 20) {
                    Button {
                        withAnimation { currentDate = calendar.date(byAdding: .weekOfYear, value: -1, to: currentDate) ?? currentDate }
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.orange)
                    }
                    
                    Button {
                        withAnimation { currentDate = calendar.date(byAdding: .weekOfYear, value: 1, to: currentDate) ?? currentDate }
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
                        
                        ZStack {
                            if isToday {
                                Circle()
                                    .fill(Color.orange)
                            } else if date < Date() {
                                Circle()
                                    .fill(Color.orange.opacity(0.3))
                            } else {
                                Circle()
                                    .fill(Color.clear)
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
            .background(
                RoundedRectangle(cornerRadius: 15)
//                    .fill(Color(red: 0.1, green: 0.1, blue: 0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
//                            .stroke(Color.orange, lineWidth: 2)
                    )
            )
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
struct StatCard5: View {
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
    ActivityView5()
}
