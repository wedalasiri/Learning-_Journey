import SwiftUI

struct LearnedButtonView: View {
    @State private var isPressed = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isPressed.toggle()
                }

                // يرجع للنص الأصلي بعد ثانية
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isPressed = false
                    }
                }
            }) {
                Circle()
                    .fill(Color(red: 0.07, green: 0.02, blue: 0.02))
                    .overlay(
                        Circle()
                            .stroke(Color(red: 0.55, green: 0.28, blue: 0.06), lineWidth: 1)
                    )
                    .shadow(color: Color.black.opacity(0.6), radius: 30, x: 0, y: 10)
                    .frame(width: 300, height: 300)
                    .overlay(
                        Text(isPressed ? "Done!" : "Learned\nToday")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(isPressed ? .white : Color.orange)
                            .multilineTextAlignment(.center)
                    )
            }
            .buttonStyle(PlainButtonStyle()) // عشان ما يغير شكل الزر الأصلي
        }
    }
}

#Preview {
    LearnedButtonView()
}


