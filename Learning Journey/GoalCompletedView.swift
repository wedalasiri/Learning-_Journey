import SwiftUI

struct GoalCompletedView: View {
    // MARK: - States
    @State private var showMonthPicker = false
    @State private var selectedMonth = Calendar.current.component(.month, from: Date())
    @State private var selectedYear = Calendar.current.component(.year, from: Date())
    
    private let calendar = Calendar.current
    
    var body: some View {
        ZStack {
            // خلفية سوداء
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                // MARK: - العنوان (الشهر والسنة)
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text(monthYearFormatter.string(from: calendar.date(from: DateComponents(year: selectedYear, month: selectedMonth))!))
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Button {
                            withAnimation(.easeInOut) {
                                showMonthPicker.toggle()
                            }
                        } label: {
                            Image(systemName: showMonthPicker ? "chevron.up" : "chevron.down")
                                .foregroundColor(.orange)
                        }
                        
                        Spacer()
                    }
                }
                .padding(.horizontal)
                
                // MARK: - Month & Year Picker
                if showMonthPicker {
                    VStack {
                        HStack {
                            // Month Picker
                            Picker("Select Month", selection: $selectedMonth) {
                                ForEach(1...12, id: \.self) { month in
                                    Text(monthFormatter.string(from: calendar.date(from: DateComponents(year: selectedYear, month: month))!))
                                        .tag(month)
                                }
                            }
                            .pickerStyle(.wheel)
                            .frame(width: 150, height: 120)
                            
                            // Year Picker
                            Picker("Select Year", selection: $selectedYear) {
                                ForEach(2020...2030, id: \.self) { year in
                                    Text("\(year)").tag(year)
                                }
                            }
                            .pickerStyle(.wheel)
                            .frame(width: 100, height: 120)
                        }
                        
                        // Done Button
                        Button("Done") {
                            withAnimation {
                                showMonthPicker = false
                            }
                        }
                        .padding(.top, 8)
                        .foregroundColor(.orange)
                    }
                    .padding()
                    .background(Color.white.opacity(0.15))
                    .cornerRadius(20)
                    .padding(.horizontal)
                }
                
                Spacer()
            }
        }
    }
    
    // MARK: - Formatters
    private var monthYearFormatter: DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "MMMM yyyy"
        return f
    }
    
    private var monthFormatter: DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "MMMM"
        return f
    }
}

#Preview {
    GoalCompletedView()
}
