
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
  


    var topic: String
    var timeframe: String
    var startDate: Date
    var endDate: Date

    
    
    // 🔹 الحد الأقصى للتجميد حسب المدة المختارة
    var maxFreezesAllowed: Int {
        switch timeframe {
        case "Year": return 104
        case "Month": return 9
        default: return 2
        }
    }


    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 25) {
                // MARK: - Header
                HStack {
                    Text("Activity wed ")
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
                            Image(systemName: "pencil.and.outline")
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



//                Spacer()
                
                
        
//                // الزر البرتقالي (Learned)
//                Button(action: {
//                    let today = Calendar.current.startOfDay(for: Date())
//                    if !completedDates.contains(today) && !freezedDates.contains(today) {
//                        completedDates.append(today)
//                        learnedCount += 1
//                    }
//                    // 🔸  هنا تخلي حالة الضغط تتفعّل  و يتغير الكلام الي جره الزر و شكل الزر نفسه  
////                        isPressedLearned = true
//                    isPressedLearned = true
//                  
//                }) {
//                    ZStack {
//                        Circle()
//                            .fill(
//                                LinearGradient(
//                                    colors: completedDates.contains(Calendar.current.startOfDay(for: Date())) ?
//                                        [Color.orange.opacity(0.25), Color.orange.opacity(0.1)] :  // بعد الضغط يبقى شفاف
//                                        [Color(red: 1.0, green: 0.57, blue: 0.19), Color.orange.opacity(0.7)], // الحالة الأصلية
//                                    startPoint: .topLeading,
//                                    endPoint: .bottomTrailing
//                                )
//                            )
//                            .glassEffect(.clear)
//                            .frame(width: 250, height: 250)
//                            .overlay(
//                                Circle()
//                                    .stroke(
//                                        LinearGradient(
//                                            colors: [
//                                                Color.white.opacity(0.6),
//                                                Color.orange.opacity(0.2)
//                                            ],
//                                            startPoint: .topLeading,
//                                            endPoint: .bottomTrailing
//                                        ),
//                                        lineWidth: 1
//                                    )
//                                    .blur(radius: 0.5)
//                            )
//
//                        Text(isPressedLearned ? "Learned\nToday" : "Log as\nLearned")
//                            .font(.system(size: 28, weight: .bold))
//                            .multilineTextAlignment(.center)
//                            .foregroundColor(isPressedLearned ? Color.orange : Color.white)
//                    }
//                }
//                .buttonStyle(ScaleButtonStyle77())
                
                
                
                
                
                Button(action: {
                    let today = Calendar.current.startOfDay(for: Date())
                    // شرط: لا يسمح بالضغط إلا إذا لم يتم الضغط اليوم
                    // شرط: لا يسمح بالضغط إذا تم الضغط على أي زر اليوم
                        guard lastPressedDate != today else { return }
                        
                    if !completedDates.contains(today) && !freezedDates.contains(today) {
                        completedDates.append(today)
                        learnedCount += 1
                        lastPressedDate = today // نخزن اليوم كآخر يوم ضغطنا فيه
                    }
                    isPressedLearned = true
                }) {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: isPressedFreezed ?
                                    
                                    [Color.blue.opacity(0.25), Color.blue.opacity(0.1)] :            //يغير الفافيه الدائره  الي الازرق
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
                .offset(y: -1) // pleace the elemant on screen



                // blue button Freezed
                Button(action: {
                    let today = Calendar.current.startOfDay(for: Date())
                    // شرط: لا يسمح بالضغط إذا تم الضغط على أي زر اليوم
                        guard lastPressedDate != today else { return }
                        
                    if freezedCount < maxFreezesAllowed,
                           !freezedDates.contains(today),
                           !completedDates.contains(today) {
                            freezedDates.append(today)
                            freezedCount += 1
                            lastPressedDate = today// نخزن اليوم كآخر يوم ضغطنا فيه
                    
                            isPressedFreezed = true
                        
                        
                        
                        
                    }
                    
                    // 🔹 خليه يصير شفاف بعد الضغط
                        isPressedFreezed = true
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
                                                  colors: isPressedFreezed ?
                                                      [Color.blue.opacity(0.25), Color.blue.opacity(0.1)] :   // 🔹 شفاف بعد الضغط
                                                      [Color(red: 0.0, green: 0.82, blue: 0.88), Color.cyan.opacity(0.7)], // اللون الأزرق الأصلي
                                                  startPoint: .topLeading,
                                                  endPoint: .bottomTrailing
                                              )
                                          )


                        )
                }
                
                .buttonStyle(ScaleButtonStyle77())
                .offset(y: -5) // pleace the elemant on screen

                // MARK: - Footer
                Text("\(freezedCount) out of \(maxFreezesAllowed) Freezes used")
                    .font(.caption)
                    .foregroundColor(.gray)

//                    .padding()
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
 //            .offset(y: -10) // pleace the elemant on screen

            
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
    ActivityView56(
        topic: "Swift",
        timeframe: "Week",
        startDate: Date(),
        endDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!
    )
}
