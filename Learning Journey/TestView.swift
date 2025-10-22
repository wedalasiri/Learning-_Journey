

import SwiftUI

struct TestActivityView: View {
    @State private var activeDate = Date() // التاريخ الحالي
    @State private var learnedCountTest = 0 // عدد الأيام المتعلمة
    @State private var freezedCountTest = 0 // عدد الأيام المجمدة
    @State private var completedDatesTest: [Date] = [] // الأيام المتعلمة
    @State private var freezedDatesTest: [Date] = []   // الأيام المجمدة
    @State private var isPressed = false

    
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
                
                
                
                ZStack{
                    //background q
                    Rectangle()
                        .frame(width: 375 , height: 294)
                        .foregroundStyle(Color.gray)
                        .cornerRadius(13)
                    
                    
                    // MARK: - Calendar Section
                    TestWeekCalendarView(
                        selectedDate: $activeDate,
                        doneDates: completedDatesTest,
                        freezeDates: freezedDatesTest
                    )
                    .padding(.horizontal)
                    .padding(.bottom, 170)
                
                    
                    
                    
                    Rectangle()
                        .frame(width: 335, height: 1)
                        
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
                .padding(.top,100)
                Spacer()
            }
                // MARK: - Orange Button
//                Button(action: {
//                    let today = Calendar.current.startOfDay(for: Date())
//                    if !completedDatesTest.contains(today) && !freezedDatesTest.contains(today) {
//                        completedDatesTest.append(today)
//                        learnedCountTest += 1
//                    }
//                }) {
//                    Text("Log as\nLearned")
//                        .font(.system(size: 28, weight: .bold))
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(.white)
//                        .frame(width: 250, height: 250)
//                }
//                .buttonStyle(.glassProminent)
//                .tint(Color(red: 1.0, green: 0.57, blue: 0.19))
//                
//                // MARK: - Blue Button
//                Button(action: {
//                    let today = Calendar.current.startOfDay(for: Date())
//                    if !freezedDatesTest.contains(today) && !completedDatesTest.contains(today) {
//                        freezedDatesTest.append(today)
//                        freezedCountTest += 1
//                    }
                
                
                
                
                // MARK: - Orange Button
                // MARK: - Orange Button
                Button(action: {
                    let today = Calendar.current.startOfDay(for: Date())
                    if !completedDatesTest.contains(today) && !freezedDatesTest.contains(today) {
                        completedDatesTest.append(today)
                        learnedCountTest += 1
                    }
                    
                    // تأثير الضغط المؤقت
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isPressed.toggle()
                    }
                    
                    // يرجع لحالته بعد 0.6 ثانية
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isPressed.toggle()
                        }
                    }
                }) {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: isPressed ?
                                        [Color.orange.opacity(0.25), Color.orange.opacity(0.1)] :
                                        [Color(red: 1.0, green: 0.57, blue: 0.19),
                                         Color.orange.opacity(0.7)],
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
                        
                        Text("Log as\nLearned")
                            .font(.system(size: 28, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        
                    }
                    
                    
                }
                .buttonStyle(ScaleButtonStyle77())

                
                
                Text("Log as Freezed")
                                        .font(.system(size: 18, weight: .medium))
                                        .foregroundColor(.white)
                                        .frame(maxWidth: 300)
                                        .padding()
                                }
                .buttonStyle(.glassProminent)
                .tint(Color(red: 0.0, green: 0.82, blue: 0.88))
                                
                // Footer
                Text("\(freezedCountTest) out of 2 Freezes used (Test)")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
            }
            .padding(.top, 20)
        }
    }
//}

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
