import SwiftUI

struct EditView: View {
    @State private var chosenPeriod = "Week"
    @State private var learningSubject = ""
    @State private var navigateToActivity = false
    @Environment(\.dismiss) var dismiss

    @State private var showUpdateAlert = false // <-- هنا عرفنا المتغير اللي يتحكم بالرسالة

    

    var body: some View {
        NavigationStack {
            ZStack {
                // الخلفية
                LinearGradient(colors: [.black], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    
                    HStack {
                                           // زر الرجوع
                                           Button(action: {
                                               dismiss()
                                           }) {
                                               Circle()
                                                   .fill(
                                                       LinearGradient(
                                                           colors: [Color.black.opacity(0.45), Color.gray.opacity(0.25)],
                                                           startPoint: .topLeading,
                                                           endPoint: .bottomTrailing
                                                       )
                                                   )
                                                   .frame(width: 50, height: 50)
                                                   .overlay(
                                                       Image(systemName: "chevron.left")
                                                           .font(.system(size: 22, weight: .bold))
                                                           .foregroundColor(.white)
                                                   )
                                                   .glassEffect(.clear)
                                           }
                                           
                                           Spacer()
                                           
                                           // العنوان في المنتصف
                                           Text("Learning Goal")
                                               .font(.system(size: 24, weight: .bold))
                                               .foregroundColor(.white)
                                           
                                           Spacer()
                                           
                                           // زر الصح
                        // زر الصح
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                showUpdateAlert = true
                            }
                        }) {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [Color.orange.opacity(0.8), Color.orange.opacity(0.5)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 22, weight: .bold))
                                        .foregroundColor(.white)
                                )
                                .glassEffect(.clear.tint(.orange))
                        }

                    }
                    .padding(.horizontal)
                    
                    Spacer().frame(height: 20)
                    
                    // MARK: - إدخال الموضوع
                    VStack(alignment: .leading, spacing: 16) {
                        Text("I want to learn")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        TextField("Enter topic", text: $learningSubject)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .padding(.bottom, 8)
                        Divider().background(Color.gray)
                    }
                    .padding(.horizontal)
                    
                    // MARK: - المدة
                    VStack(alignment: .leading, spacing: 20) {
                        Text("I want to learn it in a")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        HStack(spacing: 20) {
                            GlassButton77(title: "Week", isSelected: chosenPeriod == "Week") {
                                chosenPeriod = "Week"
                            }
                            GlassButton77(title: "Month", isSelected: chosenPeriod == "Month") {
                                chosenPeriod = "Month"
                            }
                            GlassButton77(title: "Year", isSelected: chosenPeriod == "Year") {
                                chosenPeriod = "Year"
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }

                // 🟠🟠🟠 هنا بالضبط أضفنا الرسالة داخل نفس ZStack 🟠🟠🟠
                if showUpdateAlert {
                    ZStack {
                        // الخلفية الغامقة
                        Color.black.opacity(0.6)
                            .ignoresSafeArea()
                            .transition(.opacity)
                        
                        VStack(spacing: 20) {
                            Text("Update Learning goal")
                                .font(.title2.bold())
                                .foregroundColor(.white)
                            
                            Text("If you update now, your streak will start over.")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                            
                            // MARK: - الأزرار الزجاجية
                            HStack(spacing: 20) {
                                GlassButton77(title: "Dismiss", isSelected: false) {
                                    withAnimation(.easeInOut(duration: 0.25)) {
                                        showUpdateAlert = false
                                    }
                                }
                                
                                GlassButton77(title: "Update", isSelected: true) {
                                    // حفظ البيانات والانتقال
                                    let defaults = UserDefaults.standard
                                    defaults.set(learningSubject, forKey: "userLearningSubject")
                                    defaults.set(chosenPeriod, forKey: "userChosenPeriod")
                                    
                                    let startDate = Date()
                                    defaults.set(startDate, forKey: "startDate")
                                    
                                    let calendar = Calendar.current
                                    var endDate: Date
                                    
                                    switch chosenPeriod {
                                    case "Month":
                                        endDate = calendar.date(byAdding: .month, value: 1, to: startDate)!
                                    case "Year":
                                        endDate = calendar.date(byAdding: .day, value: 365, to: startDate)!
                                    default:
                                        endDate = calendar.date(byAdding: .day, value: 7, to: startDate)!
                                    }
                                    
                                    defaults.set(endDate, forKey: "endDate")
                                    
                                    
                                    defaults.set(false, forKey: "isPressedLearned")
                                    defaults.set(false, forKey: "isPressedFreezed")

        

                                    
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        navigateToActivity = true
                                    }
                                }
                            }
                            .padding(.top, 8)
                        }
                        .padding()
                        
                    

                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color.black.opacity(0.45),
                                            Color.black.opacity(0.25)
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
//                                .glassEffect(.clear) // 👈 نفس التأثير الزجاجي
                        )
                        
                        


                        .padding(.horizontal, 40)
                        .shadow(radius: 15)
                        .transition(.scale.combined(with: .opacity))
                        .animation(.easeInOut(duration: 0.25), value: showUpdateAlert)
                    }
                }
                // 🟠🟠🟠 نهاية الرسالة 🟠🟠🟠
            }
            // الانتقال بعد التحديث
            .navigationDestination(isPresented: $navigateToActivity) {
                ActivityView56(
                    topic: learningSubject,
                    timeframe: chosenPeriod,
                    startDate: UserDefaults.standard.object(forKey: "startDate") as? Date ?? Date(),
                    endDate: UserDefaults.standard.object(forKey: "endDate") as? Date ?? Date()
                )
            }
            .navigationBarBackButtonHidden(true)// remove the auto back button
        }
    }
}

#Preview {
    EditView()
}
