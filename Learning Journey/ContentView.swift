import SwiftUI

struct First88: View {
    @State private var selectedTimeframe = "Week"
    @State private var topic = ""
    @State private var goToActivity = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.black], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Spacer().frame(height: 40)
                    
                    // MARK: - شعار
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [Color.orange.opacity(0.45), Color.orange.opacity(0.25)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 109, height: 109)
                            .glassEffect(.clear)
                        Image(systemName: "flame.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.orange)
                            .frame(width: 40, height: 40)
                    }
                    
                    // MARK: - الترحيب
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Hello Learner")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("This app will help you learn everyday!")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    // MARK: - حقل الموضوع
                    VStack(alignment: .leading, spacing: 16) {
                        Text("I want to learn")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        TextField("Enter topic", text: $topic)
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                            .padding(.bottom, 8)
                        Divider().background(Color.gray)
                    }
                    .padding(.horizontal)
                    
                    // MARK: - أزرار المدة
                    VStack(alignment: .leading, spacing: 20) {
                        Text("I want to learn it in a")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        HStack(spacing: 20) {
                            GlassButton77(title: "Week", isSelected: selectedTimeframe == "Week") {
                                selectedTimeframe = "Week"
                            }
                            GlassButton77(title: "Month", isSelected: selectedTimeframe == "Month") {
                                selectedTimeframe = "Month"
                            }
                            GlassButton77(title: "Year", isSelected: selectedTimeframe == "Year") {
                                selectedTimeframe = "Year"
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // MARK: - زر البدء (يحفظ كل البيانات)
                    GlassButton77(title: "Start learning") {
                        goToActivity = true
                        let defaults = UserDefaults.standard
                        defaults.set(topic, forKey: "userTopic")
                        defaults.set(selectedTimeframe, forKey: "userTimeframe")
                        
                        // حفظ تاريخ البداية
                        let startDate = Date()
                        defaults.set(startDate, forKey: "startDate")
                        
                        // حساب تاريخ النهاية حسب الاختيار
                        var endDate: Date
                        let calendar = Calendar.current
                        switch selectedTimeframe {
                        case "Month":
                            // 🔹 يضيف شهر فعلي كامل حسب التقويم
                            endDate = calendar.date(byAdding: .month, value: 1, to: startDate)!
                        case "Year":
                            endDate = calendar.date(byAdding: .day, value: 365, to: startDate)!
                        default:
                            endDate = calendar.date(byAdding: .day, value: 7, to: startDate)!
                        }
                        defaults.set(endDate, forKey: "endDate")
                    }
                    .padding(.horizontal)
                    
                    Spacer().frame(height: 30)
                }
            }
            .navigationDestination(isPresented: $goToActivity) {
                ActivityView56(
                    topic: topic,
                    timeframe: selectedTimeframe,
                    startDate: UserDefaults.standard.object(forKey: "startDate") as? Date ?? Date(),
                    endDate: UserDefaults.standard.object(forKey: "endDate") as? Date ?? Date()
                )
            }
        }
    }
    
}
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

    #Preview {
        First88()
    }

