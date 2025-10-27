import SwiftUI

struct FullCalendarView: View {
    @AppStorage("doneDates") private var doneDatesData: Data = Data()
    @AppStorage("freezeDates") private var freezeDatesData: Data = Data()
    
    @State private var doneDates: [Date] = []
    @State private var freezeDates: [Date] = []
    
    private var calendar = Calendar.current
    private let weekdaySymbols = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    private let startYear = 2025
    private let endYear = 9000 // لتجربة فقط
    
    var body: some View {
        ZStack(alignment: .top) {
            
            // 🔹 الخلفية + التقويم
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 25) {
                        LazyVStack(spacing: 25) {
                            ForEach(monthsInRange(), id: \.self) { month in
                                VStack(alignment: .leading, spacing: 10) {
                                    // اسم الشهر والسنة
                                    Text(monthTitle(for: month))
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.horizontal)
                                        .id(month) // ← مهم لتمرير ScrollView إليه
                                    
                                    // صف أسماء الأيام
                                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                                        ForEach(weekdaySymbols, id: \.self) { day in
                                            Text(day)
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .padding(.horizontal)
                                    
                                    // الأيام
                                    let days = daysInMonth(for: month)
                                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 8) {
                                        ForEach(days, id: \.self) { date in
                                            if let date = date {
                                                dayView(for: date)
                                            } else {
                                                Text("")
                                                    .frame(width: 35, height: 35)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                                
                                // 🔹 فاصل بين الشهور
                                Divider()
                                    .background(Color.gray.opacity(0.5))
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.vertical, 20)
                    }
                    .onAppear {
                        loadSavedDates()
                        // تمرير ScrollView تلقائيًا للشهر الحالي
                        let currentMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Date()))!
                        proxy.scrollTo(currentMonth, anchor: .top)
                    }
                }
            }
            .background(Color.black.ignoresSafeArea())
            
            // 🔹 الهيدر الشفاف بدون سهم
            HStack {
                Spacer()
                Text("All activities")
                    .font(.headline.bold())
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
            .background(Color.black.opacity(0)) // شفاف تمامًا
        }
    }
    
    // MARK: - Day View
    func dayView(for date: Date) -> some View {
        let isDone = doneDates.contains { calendar.isDate($0, inSameDayAs: date) }
        let isFreeze = freezeDates.contains { calendar.isDate($0, inSameDayAs: date) }

        // الألوان حسب الحالة
        let bgColor: Color = {
            if isFreeze {
                return Color(red: 0.12, green: 0.29, blue: 0.36) // أزرق غامق
            } else if isDone {
                return Color(red: 0.26, green: 0.17, blue: 0.08) // برتقالي غامق
            } else {
                return .clear // باقي الأيام بدون خلفية
            }
        }()

        let textColor: Color = {
            if isFreeze {
                return Color(red: 0.56, green: 0.80, blue: 0.96) // أزرق فاتح
            } else if isDone {
                return Color.orange // برتقالي فاتح
            } else {
                return Color.white // عادي
            }
        }()

        return Text("\(calendar.component(.day, from: date))")
            .font(.system(size: 18, weight: .bold))
            .frame(width: 42, height: 42)
            .background(
                Circle()
                    .fill(bgColor)
            )
            .foregroundColor(textColor)
    }




    // MARK: - Helpers
    func monthsInRange() -> [Date] {
        var months: [Date] = []
        for year in startYear...endYear {
            for month in 1...12 {
                if let date = calendar.date(from: DateComponents(year: year, month: month)) {
                    months.append(date)
                }
            }
        }
        return months
    }
    
    func daysInMonth(for date: Date) -> [Date?] {
        guard let range = calendar.range(of: .day, in: .month, for: date),
              let firstDay = calendar.date(from: calendar.dateComponents([.year, .month], from: date)) else {
            return []
        }
        
        let firstWeekday = calendar.component(.weekday, from: firstDay)
        let emptyDays = Array(repeating: nil as Date?, count: firstWeekday - 1)
        
        let days = range.compactMap { day -> Date? in
            calendar.date(byAdding: .day, value: day - 1, to: firstDay)
        }
        
        return emptyDays + days
    }
    
    func monthTitle(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
    
    func loadSavedDates() {
        if let decoded = try? JSONDecoder().decode([Date].self, from: doneDatesData) {
            doneDates = decoded
        }
        if let decoded = try? JSONDecoder().decode([Date].self, from: freezeDatesData) {
            freezeDates = decoded
        }
    }
}

#Preview {
    FullCalendarView()
}
