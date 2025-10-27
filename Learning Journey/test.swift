import SwiftUI

struct ActivityView56: View {
    @State private var currentDate = Date()
    @State private var learnedCount = 0
    @State private var freezedCount = 0
    @State private var completedDates: [Date] = []
    @State private var freezedDates: [Date] = []
    @State private var isPressedLearned = false
    @State private var isPressedFreezed = false
    @State private var lastPressedDate: Date? = nil
    @State private var showFullCalendar = false
    @State private var goToِِEditView = false

    @AppStorage("doneDates") private var doneDatesData: Data = Data()
    @AppStorage("freezeDates") private var freezeDatesData: Data = Data()
    
    var topic: String
    var timeframe: String
    @State var startDate: Date
    @State var endDate: Date
    
    @State private var showMonthPicker = false
    @State private var selectedMonth = Calendar.current.component(.month, from: Date())
    @State private var selectedYear = Calendar.current.component(.year, from: Date())
    

    
    // Formatter لعرض أسماء الشهور
    private let monthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US") // أو "ar_SA" لو تبي أسماء الشهور بالعربي
        formatter.dateFormat = "MMMM"
        return formatter
    }()

    
    // 🔹 الحد الأقصى للتجميد حسب المدة المختارة
    var maxFreezesAllowed: Int {
        switch timeframe {
        case "Year": return 96
        case "Month": return 8
        default: return 2
        }
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 25) {
                // MARK: - Header
                HStack {
                    Text("Activity ")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    HStack(spacing: 6) {
                        NavigationLink(destination: FullCalendarView()) {
                            Image(systemName: "calendar")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(5)
                                .glassEffect(.clear)
                        }
                        .buttonStyle(.glass)
                        
                        Button(action: {
                            goToِِEditView = true
                        }) {
                            Image(systemName: "pencil.and.outline")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(5)
                                .glassEffect(.clear)
                        }
                        .buttonStyle(.glass)
                    }
                }
                .padding(.horizontal)
                .offset(y:5)
                
                
                
                
                // MARK: - Glassy Background Section
                ZStack(alignment: .top) {
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [Color.gray.opacity(0.45), Color.gray.opacity(0.25)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 375, height: 300)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white.opacity(0.15), lineWidth: 2)
                        )
                        .zIndex(0)
                    
                    // ✅ هنا نبدّل بين التقويم والـ Picker
                    if showMonthPicker {
                        VStack {
                            HStack {
                                Picker("Select Month", selection: $selectedMonth) {
                                    ForEach(1...12, id: \.self) { month in
                                        Text(monthFormatter.string(from: Calendar.current.date(from: DateComponents(year: selectedYear, month: month))!))
                                            .tag(month)
                                    }
                                }
                                .pickerStyle(.wheel)
                                .frame(width: 150, height: 120)
                                
                                Picker("Select Year", selection: $selectedYear) {
                                    ForEach(2020...9000, id: \.self) { year in
                                        Text("\(year)").tag(year)
                                    }
                                }
                                .pickerStyle(.wheel)
                                .frame(width: 200, height: 220)
                            }
                            
                            Button("Done") {
                                withAnimation(.easeInOut) {
                                    updateSelectedDate()
                                    showMonthPicker = false
                                }
                            }
                            .padding(.top, 8)
                            .foregroundColor(.orange)
                        }
                        .padding()
                        .background(Color.black.opacity(0.85))
                        .cornerRadius(20)
                        .transition(.opacity)
                        .zIndex(1) // تأكد أنه فوق المربع وليس تحته
                        
                        
                        
                        
                        
                        
                    } else {
                        VStack(spacing: 16) {
                            TestWeekCalendarView(
                                selectedDate: $currentDate,
                                doneDates: completedDates,
                                freezeDates: freezedDates
                            )
                            .padding(.horizontal)
                            
                            Divider().background(Color.white.opacity(0.15))
                            
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
                        .padding(.vertical, 20)
                        .transition(.opacity)
                        .zIndex(0)
                    }
                }
                .padding(.horizontal)
                .offset(y: 5)


                
                
                
                
                // MARK: - Conditional Section (Buttons OR Well done)
                let goalCompleted = Date() > endDate
                
                if goalCompleted {
                    // ✅ شاشة النهاية "Well done!"
                    VStack(spacing: 8) {
                        Image(systemName: "hands.and.sparkles.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.orange)
                            .padding(.bottom, 10)
                            .symbolEffect(.bounce, options: .repeat(2), value: 1)
                            .offset(y: -80)
                            .padding(.top,50)
                        
                        
                        Text("Will done!")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .offset(y: -80)

                         
                        
                        Text("Goal completed! Start learning again or set new learning goal.")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .offset(y: -80)
                        
                        Button(action: {
                            goToِِEditView = true
                        }) {
                            Text("Set new learning goal")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(Color.white)
                                .frame(maxWidth: 300)
                                .padding()
                                .background(
                                    Capsule()
                                        .fill(
                                            LinearGradient(
                                                colors: [Color.orange, Color.orange.opacity(0.7)],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                )
                                .overlay(
                                    Capsule()
                                        .stroke(
                                            LinearGradient(
                                                colors: [
                                                    Color.white.opacity(0.6),
                                                    Color.orange.opacity(0.3)
                                                ],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ),
                                            lineWidth: 1
                                        )
                                        .blur(radius: 0.5)
                                )
                        }
                        .buttonStyle(ScaleButtonStyle77())
                        .offset(y: -25)


                        
                        

                        Button(action: {
                            // ✅ تصفير العدادات
                            learnedCount = 0
                            freezedCount = 0
                            
                            // ✅ حذف التواريخ
                            completedDates.removeAll()
                            freezedDates.removeAll()
                            
                            // ✅ حفظ التغييرات
                            saveDates()
                            
                            // ✅ إعادة ضبط آخر يوم ضغط فيه
                            lastPressedDate = nil
                            isPressedLearned = false
                            isPressedFreezed = false
                            
                            // ✅ تعيين تاريخ بداية جديد (اليوم)
                            let newStart = Date()
                            let calendar = Calendar.current
                            
                            switch timeframe {
                            case "Year":
                                startDate = newStart
                                endDate = calendar.date(byAdding: .year, value: 1, to: newStart) ?? newStart
                            case "Month":
                                startDate = newStart
                                endDate = calendar.date(byAdding: .month, value: 1, to: newStart) ?? newStart
                            default: // Week
                                startDate = newStart
                                endDate = calendar.date(byAdding: .day, value: 7, to: newStart) ?? newStart
                            }
                            
                            // ✅ تحديث الحالة عشان يعيد عرض الواجهة بدون رسالة "Well done!"
                            currentDate = newStart
                        }) {
                            Text("Set same learning goal and duration")
                                .font(.system(size: 20))
                                .foregroundColor(.orange)
                        }
                        .padding(.top, 5)

                        .offset(y:-10)

                    }
                    .padding(.top, 40)
                

                    
                } else {
                    // 🔸 الأزرار الأصلية قبل انتهاء المدة
                    Button(action: {
                        let today = Calendar.current.startOfDay(for: Date())
                        guard lastPressedDate != today else { return }
                        
                        if !completedDates.contains(today) && !freezedDates.contains(today) {
                            completedDates.append(today)
                            learnedCount += 1
                            lastPressedDate = today
                            saveDates()
                        }
                        isPressedLearned = true
                        UserDefaults.standard.set(true, forKey: "isPressedLearned")
                    }) {
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: isPressedFreezed ?
                                        [Color.blue.opacity(0.25), Color.blue.opacity(0.1)] :
                                        (completedDates.contains(Calendar.current.startOfDay(for: Date())) ?
                                         [Color.orange.opacity(0.25), Color.orange.opacity(0.1)] :
                                         [Color(red: 1.0, green: 0.57, blue: 0.19), Color.orange.opacity(0.7)]),
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
                            
                            Text(isPressedFreezed ? "Day \nFreezed" : (isPressedLearned ? "Learned\nToday" : "Log as\nLearned"))
                                .font(.system(size: 28, weight: .bold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(isPressedFreezed ? Color.cyan : (isPressedLearned ? Color.orange : Color.white))
                        }
                    }
                    .buttonStyle(ScaleButtonStyle77())
                    .offset(y: -1)
                    
                    Button(action: {
                        let today = Calendar.current.startOfDay(for: Date())
                        guard lastPressedDate != today else { return }
                        
                        if freezedCount < maxFreezesAllowed,
                           !freezedDates.contains(today),
                           !completedDates.contains(today) {
                            freezedDates.append(today)
                            freezedCount += 1
                            lastPressedDate = today
                            saveDates()
                            
                            isPressedFreezed = true
                            UserDefaults.standard.set(true, forKey: "isPressedFreezed")
                        }
                    }) {
                        Text("Day Freezed")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(isPressedFreezed ? Color.cyan : Color.white)
                            .frame(maxWidth: 300)
                            .padding()
                            .background(
                                Capsule()
                                    .fill(
                                        LinearGradient(
                                            colors: isPressedFreezed
                                            ? [Color.cyan.opacity(0.25), Color.cyan.opacity(0.1)]
                                            : [Color(red: 0.0, green: 0.82, blue: 0.88), Color.cyan.opacity(0.7)],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                            )
                            .overlay(
                                Capsule()
                                    .stroke(
                                        LinearGradient(
                                            colors: [
                                                Color.white.opacity(0.6),
                                                Color.cyan.opacity(0.3)
                                            ],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 1
                                    )
                                    .blur(radius: 0.5)
                            )
                    }
                    .buttonStyle(ScaleButtonStyle77())
                    .offset(y: -5)
                    
                    // MARK: - Footer
                    Text("\(freezedCount) out of \(maxFreezesAllowed) Freezes used")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
//                // MARK: - Footer
//                Text("\(freezedCount) out of \(maxFreezesAllowed) Freezes used")
//                    .font(.caption)
//                    .foregroundColor(.gray)
            }
            .onAppear {
                let defaults = UserDefaults.standard
                learnedCount = defaults.integer(forKey: "learnedCount")
                freezedCount = defaults.integer(forKey: "freezedCount")
                lastPressedDate = defaults.object(forKey: "lastPressedDate") as? Date
                
                let today = Calendar.current.startOfDay(for: Date())
                if lastPressedDate != today {
                    isPressedLearned = false
                    isPressedFreezed = false
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $goToِِEditView) {
                EditView()
            }
        }
    }
    
    func saveDates() {
        if let encoded = try? JSONEncoder().encode(completedDates) {
            doneDatesData = encoded
        }
        if let encoded = try? JSONEncoder().encode(freezedDates) {
            freezeDatesData = encoded
        }
    }
    
    // تحديث التاريخ الحالي بناءً على الشهر والسنة المختارين
    func updateSelectedDate() {
        let calendar = Calendar.current
        if let newDate = calendar.date(from: DateComponents(year: selectedYear, month: selectedMonth, day: 1)) {
            currentDate = newDate
        }
    }

}

#Preview {
    NavigationStack {
        ActivityView56(
            topic: "Swift",
            timeframe: "Week",
            startDate: Date(),
            endDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!
//            endDate: Calendar.current.date(byAdding: .day, value: -1, to: Date())!

        )
    }
}
