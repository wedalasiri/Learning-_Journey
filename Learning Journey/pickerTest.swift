import SwiftUI

struct TestStatCard8: View {
    var icon: String
    var count: Int
    var label: String
    var color: Color
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .foregroundColor(.orange)
                .font(.system(size: 22))
            Text("\(count)")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)
            Text(label)
                .foregroundColor(.white)
                .font(.system(size: 14))
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(color)
        .cornerRadius(18)
    }
}

struct CalendarSummaryView: View {
    @State private var showPicker = false
    @State private var selectedMonth = "October"
    @State private var selectedYear = 2025
    
    // بيانات جديدة للملخص
    @State private var topic = "Swift"
    @State private var learnedCount = 0
    @State private var freezedCount = 0
    
    let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    let dates = [19, 20, 21, 22, 23, 24, 25]
    
    let months = [
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ]
    let years = Array(2015...2030)
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                ZStack {
                    // الخلفية الكبيرة
                    RoundedRectangle(cornerRadius: 30)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(red: 0.15, green: 0.15, blue: 0.15),
                                    Color(red: 0.10, green: 0.10, blue: 0.10)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.white.opacity(0.15), lineWidth: 1)
                        )
                        .frame(width: 375, height: 300)
                    
                    VStack(spacing: 16) {
                        // الهيدر في بداية المربع
                        HStack {
                            Text("\(selectedMonth) \(selectedYear)")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white)
                            
                            Button {
                                showPicker.toggle()
                            } label: {
                                Image(systemName: showPicker ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.orange)
                                    .font(.system(size: 18, weight: .bold))
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        .offset(y: 0)
                        
                        // Picker أو التقويم
                        if showPicker {
                            HStack(spacing: 0) {
                                Picker("Month", selection: $selectedMonth) {
                                    ForEach(months, id: \.self) { month in
                                        Text(month).tag(month)
                                            .foregroundColor(.white) // ← هنا التعديل

                                    }
                                }
                                .pickerStyle(.wheel)
                                .frame(maxWidth: .infinity)
                                .labelsHidden()
                                
                                Picker("Year", selection: $selectedYear) {
                                    ForEach(years, id: \.self) { year in
                                        Text(String(format: "%d", year)) // ← يجبرها بدون فاصلة
                                            .tag(year)
                                            .foregroundColor(.white) // ← هنا التعديل

                                    }
                                }
                                .pickerStyle(.wheel)
                                .frame(maxWidth: .infinity)
                                .labelsHidden()
                            }
                            .frame(height: 160)
                        } else {
                            // التقويم الأسبوعي وملخص التعلم الجديد
                            VStack(spacing: 12) {
                                // Weekdays
                                HStack {
                                    ForEach(days, id: \.self) { day in
                                        Text(day)
                                            .font(.system(size: 14, weight: .medium))
                                            .foregroundColor(.gray)
                                            .frame(maxWidth: .infinity)
                                    }
                                }
                                .padding(.horizontal)
                                
                                // Dates
                                HStack {
                                    ForEach(dates, id: \.self) { date in
                                        if date == 23 {
                                            ZStack {
                                                Circle()
                                                    .fill(Color.orange)
                                                    .frame(width: 38, height: 38)
                                                Text("\(date)")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .bold))
                                            }
                                            .frame(maxWidth: .infinity)
                                        } else {
                                            Text("\(date)")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18))
                                                .frame(maxWidth: .infinity)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                
                                Divider()
                                    .background(Color.white.opacity(0.15))
                                    .padding(.horizontal)
                                
                                // ملخص التعلم الجديد
                                VStack(alignment: .leading, spacing: 12) {
                                    HStack(spacing: 4) {
                                        Text("Learning")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        
                                        Text(topic)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                    }
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
                        }
                    }
                    .padding(.top)
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    CalendarSummaryView()
}





