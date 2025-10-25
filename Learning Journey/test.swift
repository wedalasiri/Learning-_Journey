
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
    
    @State private var goToِِEditView = false // في ActivityView56
    
    @AppStorage("doneDates") private var doneDatesData: Data = Data()
    @AppStorage("freezeDates") private var freezeDatesData: Data = Data()
    
    var topic: String
    var timeframe: String
    var startDate: Date
    var endDate: Date
    
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
            
            let goalCompleted = Date() > endDate// ثابت عشان اذا خلصت المده الي اخترها تطلع له الرساله 
            
            if goalCompleted {
                // ✅ واجهة "Well done!" بعد انتهاء الهدف
                VStack(spacing: 20) {
                    Image(systemName: "hands.clap.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.orange)
                        .padding(.bottom, 10)
                    
                    Text("Well done!")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    
                    Text("Goal completed! Start learning again or set a new learning goal.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Button(action: {
                        // أكشن لتعيين هدف جديد
                        goToِِEditView = true
                    }) {
                        Text("Set new learning goal")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: 280)
                            .padding()
                            .background(
                                Capsule()
                                    .fill(LinearGradient(
                                        colors: [Color.orange, Color.orange.opacity(0.8)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                            )
                    }
                    
                    Button(action: {
                        // أكشن لتعيين نفس الهدف
                        // ممكن ترجع تعيد العداد أو تعيد نفس القيم
                    }) {
                        Text("Set same learning goal and duration")
                            .font(.system(size: 16))
                            .foregroundColor(.orange)
                    }
                    .padding(.top, 5)
                }
                .padding()
            } else {
                VStack(spacing: 25) {
                    // 👇 حط هنا كل كودك الحالي مثل ما هو (الهيدر، الدائرة، الأزرار...)
                    
                    // MARK: - Header
                    HStack {
                        Text("Activity wed ")
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
                            
                            // استبدال NavigationLink القديم بزر فقط
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
                    .offset(y:5)  // pleace the elemant on screen
                    
                    // MARK: - Glassy Background Section
                    ZStack(alignment: .top) {
                        // الخلفية الأساسية
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
                        // تأثير الزجاج على الحواف فقط
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white.opacity(0.15), lineWidth: 2)
                                    .glassEffect(.clear) // هنا التأثير يطبق على الحواف فقط
                            )
                        
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
                    }
                    .padding(.horizontal)
                    .offset(y: 5)
                    
                    
                    
                    
                    
                    
                    
                    let goalCompleted = Date() > endDate

                    if goalCompleted {
                        // ✅ شاشة النهاية "Well done!"
                        VStack(spacing: 20) {
                            Image(systemName: "hands.clap.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.orange)
                                .padding(.bottom, 10)
                                .symbolEffect(.bounce, options: .repeat(2), value: 1)
                            
                            Text("Well done!")
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                            
                            Text("Goal completed! Start learning again or set a new learning goal")
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Button(action: {
                                // ✅ يروح لشاشة تعديل الهدف
                                goToِِEditView = true
                            }) {
                                Text("Set new learning goal")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: 280)
                                    .padding()
                                    .background(
                                        Capsule()
                                            .fill(
                                                LinearGradient(
                                                    colors: [Color.orange, Color.orange.opacity(0.8)],
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                    )
                            }
                            
                            Button(action: {
                                // ✅ تعيين نفس الهدف والمدة (تقدر تخصصه)
                            }) {
                                Text("Set same learning goal and duration")
                                    .font(.system(size: 16))
                                    .foregroundColor(.orange)
                            }
                            .padding(.top, 5)
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

                        // 🔹 الزر الأزرق
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
                    }
                    
                    // MARK: - Footer
                    Text("\(freezedCount) out of \(maxFreezesAllowed) Freezes used")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .onAppear {
                    let defaults = UserDefaults.standard
                    learnedCount = defaults.integer(forKey: "learnedCount")
                    freezedCount = defaults.integer(forKey: "freezedCount")
                    lastPressedDate = defaults.object(forKey: "lastPressedDate") as? Date
                    
                    // Check if a new day has started
                    let today = Calendar.current.startOfDay(for: Date())
                    if lastPressedDate != today {
                        isPressedLearned = false
                        isPressedFreezed = false
                    }
                }
                // 👇 this hides the back button
                .navigationBarBackButtonHidden(true)
                // Attach the modern navigation destination here
                .navigationDestination(isPresented: $goToِِEditView) {
                    EditView()
                }
            }
        }
        
    }
    //عشان تطلع في زر التقويم الكامل الدواير
    
    func saveDates() {
        if let encoded = try? JSONEncoder().encode(completedDates) {
            doneDatesData = encoded
        }
        if let encoded = try? JSONEncoder().encode(freezedDates) {
            freezeDatesData = encoded
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

#Preview {
    NavigationStack {
        ActivityView56(
            topic: "Swift",
            timeframe: "Week",
            startDate: Date(),
            endDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!
            //endDate: Calendar.current.date(byAdding: .day, value: -1, to: Date())!

        )
    }
}

