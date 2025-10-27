import SwiftUI

struct CalendarSummaryView: View {
    @State private var showPicker = false
    @State private var selectedMonth = "October"
    @State private var selectedYear = 2025
    
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
                        .frame(width: 375, height: 300) // حجم المربع ثابت
                    
                    VStack(spacing: 16) {
                        // الهيدر يكون في بداية المربع
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
                        .padding(12)
                        
                        // Picker أو التقويم يظهر أسفل الهيدر
                        if showPicker {
                            HStack(spacing: 0) {
                                Picker("Month", selection: $selectedMonth) {
                                    ForEach(months, id: \.self) { month in
                                        Text(month).tag(month)
                                    }
                                }
                                .pickerStyle(.wheel)
                                .frame(maxWidth: .infinity)
                                .labelsHidden()
                                
                                Picker("Year", selection: $selectedYear) {
                                    ForEach(years, id: \.self) { year in
                                        Text("\(year)").tag(year)
                                    }
                                }
                                .pickerStyle(.wheel)
                                .frame(maxWidth: .infinity)
                                .labelsHidden()
                            }
                            .frame(height: 160)
                        } else {
                            // التقويم الأسبوعي وملخص التعلم
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
                                
                                // Learning summary
                                VStack(alignment: .leading, spacing: 15) {
                                    Text("Learning Swift")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.horizontal)
                                    
                                    HStack(spacing: 16) {
                                        // Days Learned
                                        VStack {
                                            Image(systemName: "flame.fill")
                                                .foregroundColor(.orange)
                                                .font(.system(size: 22))
                                            Text("0")
                                                .font(.system(size: 22, weight: .bold))
                                                .foregroundColor(.white)
                                            Text("Days Learned")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14))
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color(red: 0.30, green: 0.20, blue: 0.05))
                                        .cornerRadius(18)
                                        
                                        // Days Freezed
                                        VStack {
                                            Image(systemName: "cube.fill")
                                                .foregroundColor(.orange)
                                                .font(.system(size: 22))
                                            Text("0")
                                                .font(.system(size: 22, weight: .bold))
                                                .foregroundColor(.white)
                                            Text("Days Freezed")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14))
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color(red: 0.05, green: 0.20, blue: 0.35))
                                        .cornerRadius(18)
                                    }
                                    .padding(.horizontal)
                                }
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
