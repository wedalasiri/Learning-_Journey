//
//
//import SwiftUI
//
//struct TestActivityView: View {
//    @State private var activeDate = Date() // التاريخ الحالي
//    @State private var learnedCountTest = 0 // عدد الأيام المتعلمة
//    @State private var freezedCountTest = 0 // عدد الأيام المجمدة
//    @State private var completedDatesTest: [Date] = [] // الأيام المتعلمة
//    @State private var freezedDatesTest: [Date] = []   // الأيام المجمدة
//    @State private var isPressed = false
//
//    
//    var body: some View {
//        ZStack {
//            Color.black.ignoresSafeArea()
//            
//            VStack(spacing: 25) {
//                
//                
//                
//                
//                // MARK: - Header
//                HStack {
//                    Text("Activity (Test)")
//                        .font(.largeTitle.bold())
//                        .foregroundColor(.white)
//                    
//                    Spacer()
//                    
//                    HStack(spacing: 16) {
//                        Button(action: {}) {
//                            Image(systemName: "calendar")
//                                .font(.system(size: 20))
//                                .foregroundColor(.white)
//                                .padding(5)
//                                .clipShape(Circle())
//                                .glassEffect(.clear)
//                        }
//                        .buttonStyle(.glass)
//                        
//                        Button(action: {}) {
//                            Image(systemName: "person.crop.circle")
//                                .font(.system(size: 20))
//                                .foregroundColor(.white)
//                                .padding(5)
//                                .clipShape(Circle())
//                                .glassEffect(.clear)
//                        }
//                        .buttonStyle(.glass)
//                    }
//                }
//                .padding(.horizontal)
//                
//                
//                
//                ZStack{
//                    //background q
//                    Rectangle()
//                        .frame(width: 375 , height: 294)
//                        .foregroundStyle(Color.gray)
//                        .cornerRadius(13)
//                    
//                    
//                    // MARK: - Calendar Section
//                    MiniCalendarView(
//                        selectedDate: currentDate,
//                        completedDates: completedDates,
//                        freezedDates: freezedDates,
//                        selectedMonth: selectedMonth,
//                        selectedYear: selectedYear
//                    )
//
//                    .padding(.horizontal)
//                    .padding(.bottom, 170)
//                
//                    
//                    
//                    
//                    Rectangle()
//                        .frame(width: 335, height: 1)
//                        
//                // MARK: - Stats Section
//                VStack(alignment: .leading, spacing: 12) {
//                    Text("Learning Swift (Test)")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                    
//                    HStack(spacing: 20) {
//                        TestStatCard(
//                            icon: "flame.fill",
//                            count: learnedCountTest,
//                            label: "Days Learned",
//                            color: Color(red: 0.35, green: 0.2, blue: 0)
//                        )
//                        
//                        TestStatCard(
//                            icon: "cube.fill",
//                            count: freezedCountTest,
//                            label: "Days Freezed",
//                            color: Color(red: 0.1, green: 0.25, blue: 0.35)
//                        )
//                    }
//                }
//                .padding(.horizontal)
//                .padding(.top,100)
//                Spacer()
//            }
//                // MARK: - Orange Button
////                Button(action: {
////                    let today = Calendar.current.startOfDay(for: Date())
////                    if !completedDatesTest.contains(today) && !freezedDatesTest.contains(today) {
////                        completedDatesTest.append(today)
////                        learnedCountTest += 1
////                    }
////                }) {
////                    Text("Log as\nLearned")
////                        .font(.system(size: 28, weight: .bold))
////                        .multilineTextAlignment(.center)
////                        .foregroundColor(.white)
////                        .frame(width: 250, height: 250)
////                }
////                .buttonStyle(.glassProminent)
////                .tint(Color(red: 1.0, green: 0.57, blue: 0.19))
////                
////                // MARK: - Blue Button
////                Button(action: {
////                    let today = Calendar.current.startOfDay(for: Date())
////                    if !freezedDatesTest.contains(today) && !completedDatesTest.contains(today) {
////                        freezedDatesTest.append(today)
////                        freezedCountTest += 1
////                    }
//                
//                
//                
//                
//                // MARK: - Orange Button
//                // MARK: - Orange Button
//                Button(action: {
//                    let today = Calendar.current.startOfDay(for: Date())
//                    if !completedDatesTest.contains(today) && !freezedDatesTest.contains(today) {
//                        completedDatesTest.append(today)
//                        learnedCountTest += 1
//                    }
//                    
//                    // تأثير الضغط المؤقت
//                    withAnimation(.easeInOut(duration: 0.3)) {
//                        isPressed.toggle()
//                    }
//                    
//                    // يرجع لحالته بعد 0.6 ثانية
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
//                        withAnimation(.easeInOut(duration: 0.3)) {
//                            isPressed.toggle()
//                        }
//                    }
//                }) {
//                    ZStack {
//                        Circle()
//                            .fill(
//                                LinearGradient(
//                                    colors: isPressed ?
//                                        [Color.orange.opacity(0.25), Color.orange.opacity(0.1)] :
//                                        [Color(red: 1.0, green: 0.57, blue: 0.19),
//                                         Color.orange.opacity(0.7)],
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
//                        Text("Log as\nLearned")
//                            .font(.system(size: 28, weight: .bold))
//                            .multilineTextAlignment(.center)
//                            .foregroundColor(.white)
//                        
//                    }
//                    
//                    
//                }
//                .buttonStyle(ScaleButtonStyle77())
//
//                
//                
//                Text("Log as Freezed")
//                                        .font(.system(size: 18, weight: .medium))
//                                        .foregroundColor(.white)
//                                        .frame(maxWidth: 300)
//                                        .padding()
//                                }
//                .buttonStyle(.glassProminent)
//                .tint(Color(red: 0.0, green: 0.82, blue: 0.88))
//                                
//                // Footer
//                Text("\(freezedCountTest) out of 2 Freezes used (Test)")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//                    .padding(.bottom, 10)
//            }
//            .padding(.top, 20)
//        }
//    }
////}
//
//
//
//
//
//
//
//
//
//
//
////// MARK: - Stat Card
////struct TestStatCard: View {
////    var icon: String
////    var count: Int
////    var label: String
////    var color: Color
////    
////    var body: some View {
////        HStack(spacing: 8) {
////            Image(systemName: icon)
////                .foregroundColor(.orange)
////                .font(.system(size: 20))
////            VStack(alignment: .leading, spacing: 2) {
////                Text("\(count)")
////                    .font(.title3.bold())
////                    .foregroundColor(.white)
////                Text(label)
////                    .font(.caption)
////                    .foregroundColor(.white)
////            }
////        }
////        .frame(width: 140, height: 60)
////        .background(
////            RoundedRectangle(cornerRadius: 20)
////                .fill(color)
////        )
////    }
////}
//
//#Preview {
//    TestActivityView()
//}
