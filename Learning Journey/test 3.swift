

import SwiftUI

struct ActivityView88: View {
    @State private var currentDate88 = Date()
    @State private var learnedCount88 = 0
    @State private var freezedCount88 = 0
    @State private var completedDates88: [Date] = []
    @State private var freezedDates88: [Date] = []
    @State private var isPressedLearned88 = false
    @State private var isPressedFreezed88 = false
    @State private var lastPressedDate88: Date? = nil
    
    // User data loaded from First88
    @State private var topic88: String = ""
    @State private var timeframe88: String = "Week"
    @State private var totalDays88 = 7
    
    // Keys for UserDefaults
    private let kCompletedDates88 = "completedDates_88"
    private let kFreezedDates88 = "freezedDates_88"
    private let kLearnedCount88 = "learnedCount_88"
    private let kFreezedCount88 = "freezedCount_88"
    private let kLastPressed88 = "lastPressedDate_88"
    private let kUserTopic88 = "userTopic_88"
    private let kUserTimeframe88 = "userTimeframe_88"
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 25) {
                // Header
                HStack {
                    Text("Activity")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.horizontal)
                
                // Glassy section
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 0.05, green: 0.05, blue: 0.05))
                        .overlay(
                            LinearGradient(
                                colors: [Color.white.opacity(0.05), Color.black.opacity(0.05)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white.opacity(0.1), lineWidth: 0.5)
                        )
                        .frame(width: 375, height: 300)
                    
                    VStack(spacing: 16) {
                        TestWeekCalendarView(
                            selectedDate: $currentDate88,
                            doneDates: completedDates88,
                            freezeDates: freezedDates88
                        )
                        .padding(.horizontal)
                        
                        Divider().background(Color.white.opacity(0.15))
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Learning \(topic88)")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            HStack(spacing: 20) {
                                TestStatCard(icon: "flame.fill", count: learnedCount88, label: "Days Learned", color: .orange)
                                TestStatCard(icon: "snowflake", count: freezedCount88, label: "Days Freezed", color: .cyan)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical, 20)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Learned Button
                Button(action: logLearnedDay88) {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: isPressedLearned88 ?
                                    [Color.orange.opacity(0.25), Color.orange.opacity(0.1)] :
                                        [Color(red: 1.0, green: 0.57, blue: 0.19), Color.orange.opacity(0.7)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .glassEffect(.clear)
                            .frame(width: 250, height: 250)
                        Text(isPressedLearned88 ? "Learned\nToday" : "Log as\nLearned")
                            .font(.system(size: 28, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(isPressedLearned88 ? Color.orange : Color.white)
                    }
                }
                .buttonStyle(ScaleButtonStyle88())
                
                // Freezed Button
                Button(action: logFreezedDay88) {
                    Text("Log as Freezed")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                        .frame(maxWidth: 300)
                        .padding()
                        .background(
                            Capsule()
                                .fill(
                                    LinearGradient(
                                        colors: freezedDates88.contains(Calendar.current.startOfDay(for: Date())) ?
                                        [Color.cyan.opacity(0.25), Color.cyan.opacity(0.1)] :
                                            [Color(red: 0.0, green: 0.82, blue: 0.88), Color.cyan.opacity(0.7)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        )
                }
                .buttonStyle(ScaleButtonStyle88())
                
                Text("\(learnedCount88) / \(totalDays88) days completed")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
                
                if learnedCount88 >= totalDays88 {
                    Text("🎉 Task Completed!")
                        .font(.headline)
                        .foregroundColor(.green)
                }
            }
            .padding(.top, 10)
        }
        .onAppear {
            loadUserData88()
            loadProgress88()
        }
    }
    
    // MARK: - Logging
    func logLearnedDay88() {
        let today = Calendar.current.startOfDay(for: Date())
        if lastPressedDate88 == today { return }
        
        if !completedDates88.contains(today) && !freezedDates88.contains(today) {
            completedDates88.append(today)
            learnedCount88 = completedDates88.count
            lastPressedDate88 = today
            isPressedLearned88 = true
            saveProgress88()
        }
    }
    
    func logFreezedDay88() {
        let today = Calendar.current.startOfDay(for: Date())
        if lastPressedDate88 == today { return }
        
        if !freezedDates88.contains(today) && !completedDates88.contains(today) {
            freezedDates88.append(today)
            freezedCount88 = freezedDates88.count
            lastPressedDate88 = today
            isPressedFreezed88 = true
            saveProgress88()
        }
    }
    
    // MARK: - Persistence
    func saveProgress88() {
        let defaults = UserDefaults.standard
        let completedIntervals = completedDates88.map { $0.timeIntervalSince1970 }
        let freezedIntervals = freezedDates88.map { $0.timeIntervalSince1970 }
        
        defaults.set(completedIntervals, forKey: kCompletedDates88)
        defaults.set(freezedIntervals, forKey: kFreezedDates88)
        defaults.set(learnedCount88, forKey: kLearnedCount88)
        defaults.set(freezedCount88, forKey: kFreezedCount88)
        defaults.set(lastPressedDate88?.timeIntervalSince1970, forKey: kLastPressed88)
    }
    
    func loadProgress88() {
        let defaults = UserDefaults.standard
        
        if let completedIntervals = defaults.array(forKey: kCompletedDates88) as? [Double] {
            completedDates88 = completedIntervals.map { Date(timeIntervalSince1970: $0) }
            learnedCount88 = completedDates88.count
        }
        
        if let freezedIntervals = defaults.array(forKey: kFreezedDates88) as? [Double] {
            freezedDates88 = freezedIntervals.map { Date(timeIntervalSince1970: $0) }
            freezedCount88 = freezedDates88.count
        }
        
        if let lastInterval = defaults.object(forKey: kLastPressed88) as? Double {
            lastPressedDate88 = Date(timeIntervalSince1970: lastInterval)
        }
    }
    
    func loadUserData88() {
        let defaults = UserDefaults.standard
        topic88 = defaults.string(forKey: "userTopic") ?? "Swift"
        timeframe88 = defaults.string(forKey: "userTimeframe") ?? "Week"
        
        switch timeframe88 {
        case "Month":
            totalDays88 = 30
        case "Year":
            totalDays88 = 365
        default:
            totalDays88 = 7
        }
        
        // قراءة تاريخ البداية والنهاية
        let startDate = defaults.object(forKey: "startDate") as? Date ?? Date()
        let endDate = defaults.object(forKey: "endDate") as? Date ?? Calendar.current.date(byAdding: .day, value: totalDays88, to: startDate)!
        
        // فقط لعرضهما في الـ Console (اختياري)
        print("Start Date:", startDate)
        print("End Date:", endDate)
    }
    
    
    // MARK: - Scale Button
    struct ScaleButtonStyle88: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
        }
    }
}

#Preview {
    ActivityView88()
}


