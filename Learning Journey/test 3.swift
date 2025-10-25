import SwiftUI

struct GoalCompletedView: View {
    var body: some View {
        ZStack {
            // خلفية سوداء
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 30) {
                // MARK: - العنوان (Activity)
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("October 2025")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.orange)
                    }
                    
                    // الأيام (مجرد شكل تجريبي)
                    HStack(spacing: 12) {
                        ForEach(["20", "21", "22", "23", "24", "25", "26"], id: \.self) { day in
                            VStack {
                                Text(day)
                                    .font(.headline)
                                    .foregroundColor(day == "20" ? .cyan : .orange)
                            }
                        }
                    }
                    
                    // قسم الإحصائيات
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Learning Swift")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        HStack(spacing: 20) {
                            StatCard6(icon: "flame.fill", count: "6", label: "Days Learned", color: .brown)
                            StatCard6(icon: "cube.fill", count: "1", label: "Day Freezed", color: .blue)
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
                .frame(width: 350)
                
                // MARK: - رسالة النهاية
                VStack(spacing: 12) {
                    Image(systemName: "hands.clap.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.orange)
                    
                    Text("Well done!")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    
                    Text("Goal completed! Start learning again or set new learning goal")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.top, 30)
                
                // MARK: - الأزرار
                VStack(spacing: 12) {
                    Button(action: {
                        // Action for new goal
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
                        // Action for same goal
                    }) {
                        Text("Set same learning goal and duration")
                            .font(.system(size: 16))
                            .foregroundColor(.orange)
                    }
                }
                .padding(.top, 10)
            }
        }
    }
}

// MARK: - البطاقة الصغيرة للإحصائيات
struct StatCard6: View {
    var icon: String
    var count: String
    var label: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 2) {
                Text(count)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                Text(label)
                    .font(.caption)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .frame(width: 150, height: 60)
        .background(color.opacity(0.6))
        .cornerRadius(15)
    }
}

// MARK: - المعاينة
struct GoalCompletedView_Previews: PreviewProvider {
    static var previews: some View {
        GoalCompletedView()
            .preferredColorScheme(.dark)
    }
}
