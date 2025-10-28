//
//  logic.swift
//  Learning Journey
//
//  Created by Wed Ahmed Alasiri on 04/05/1447 AH.
//



import SwiftUI


// MARK: - الزر الزجاجي
struct GlassButton77: View {
    var title: String
    var isSelected: Bool = true
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .opacity(isSelected ? 0.9 : 0.6)
        }
        .buttonStyle(.glassProminent)
        .tint(isSelected ? Color.orange : Color.gray.opacity(0.4))
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


import SwiftUI

struct TestWeekCalendarView: View {
    @Binding var selectedDate: Date
    var doneDates: [Date]
    var freezeDates: [Date]

    private let calendar = Calendar.current
    @State  var showPicker = false // <-- needed for chevron toggle

    
 
    var body: some View {
        VStack(spacing: 16) {
            // MARK: - Header with Month and Week Navigation
            HStack {
//                Text(monthYearFormatter.string(from: selectedDate))
//                    .font(.headline)
//                    .foregroundColor(.white)
//                
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
                .offset(y:-20)

            }
            
            // MARK: - Week Calendar
            let week = currentWeek()
            HStack(spacing: 10) {
                ForEach(week, id: \.self) { date in
                    dayView(for: date)
                        .onTapGesture {
                            selectedDate = date
                        }
                }
            }
        }
    }

    // MARK: - Helpers
    func currentWeek() -> [Date] {
        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: selectedDate) else { return [] }
        let start = calendar.startOfDay(for: weekInterval.start)
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: start) }
    }
    
    func dayView(for date: Date) -> some View {
        let isDone = doneDates.contains { calendar.isDate($0, inSameDayAs: date) }
        let isFreeze = freezeDates.contains { calendar.isDate($0, inSameDayAs: date) }
        let isToday = calendar.isDateInToday(date)
        
        let bgColor: Color = {
            if isFreeze {
                return Color(red: 0.12, green: 0.29, blue: 0.36)
            } else if isDone {
                return Color(red: 0.26, green: 0.17, blue: 0.08)
            } else if isToday {
                return .orange
            } else {
                return .clear
            }
        }()
        
        let textColor: Color = {
            if isFreeze {
                return Color(red: 0.56, green: 0.80, blue: 0.96)
            } else if isDone {
                return .orange
            } else {
                return .white
            }
        }()
        
        return VStack(spacing: 6) {
            Text(shortWeekday(for: date))
                .font(.caption2)
                .foregroundColor(.gray)
            
            Text("\(calendar.component(.day, from: date))")
                .font(.system(size: 18, weight: .bold))
                .frame(width: 42, height: 42)
                .background(
                    Circle().fill(bgColor)
                )
                .foregroundColor(textColor)
        }
    }
    
    func shortWeekday(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter.string(from: date)
    }
    
     var monthYearFormatter: DateFormatter {
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
