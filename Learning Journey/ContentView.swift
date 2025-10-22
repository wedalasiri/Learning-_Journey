import SwiftUI

struct First88: View {
    @State private var selectedTimeframe = "Week"
    @State private var topic = "Swift"
    @State private var goToActivity = false

    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - الخلفية
                LinearGradient(colors: [.black],
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()

                VStack(spacing: 40) {
                    Spacer().frame(height: 40)

                    // MARK: - شعار زجاجي (الدائرة)
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color.orange.opacity(0.45),
                                        Color.orange.opacity(0.25)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 109, height: 109)
                            .glassEffect(.clear)
                            .overlay(
                                Circle()
                                    .stroke(Color.orange.opacity(1), lineWidth: 0.25)
                                    .shadow(color: Color.orange.opacity(1),
                                            radius: 0.25,
                                            x: 2,
                                            y: 2)
                            )
                            .overlay(
                                Circle()
                                    .stroke(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.white.opacity(0.6),
                                                Color.orange.opacity(0.2)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 1
                                    )
                                    .blur(radius: 0.5)
                            )
                            .opacity(0.9)

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

                    // MARK: - أزرار المدة الزجاجية
                    VStack(alignment: .leading, spacing: 20) {
                        Text("I want to learn it in a")
                            .font(.headline)
                            .foregroundColor(.white)

                        HStack(spacing: 20) {
                            GlassButton77(
                                title: "Week",
                                isSelected: selectedTimeframe == "Week"
                            ) {
                                selectedTimeframe = "Week"
                            }

                            GlassButton77(
                                title: "month",
                                isSelected: selectedTimeframe == "Month"
                            ) {
                                selectedTimeframe = "Month"
                            }

                            GlassButton77(
                                title: "Year",
                                isSelected: selectedTimeframe == "Year"
                            ) {
                                selectedTimeframe = "Year"
                            }
                        }
                    }
                    .padding(.horizontal)

                    Spacer()

                    // MARK: - زر البدء
                    GlassButton77(title: "Start learning") {
                        goToActivity = true
                    }
                    .padding(.horizontal)
                    .navigationDestination(isPresented: $goToActivity) {
                        ActivityView5() // 👈 صفحتك التالية
                    }

                    Spacer().frame(height: 30)
                }
            }
        }
    }
}

#Preview {
    First88()
}

//
// MARK: - Glass Button (ستايل الزجاج مع تأثير الحركة)
//
struct GlassButton77: View {
    var title: String
    var isSelected: Bool = true
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .opacity(isSelected ? 0.9 : 0.6)
        }
        .buttonStyle(.glassProminent)
        .tint(isSelected ? Color(red: 1.0, green: 0.57, blue: 0.19)
                         : Color.gray.opacity(0.4))
    }
}


//
// MARK: - تأثير الضغط (Scale)
//

struct ScaleButtonStyle77: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}
