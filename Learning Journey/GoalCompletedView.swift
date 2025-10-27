////
////  GoalCompletedView.swift
////  Learning Journey
////
////  Created by Wed Ahmed Alasiri on 05/05/1447 AH.
////
//
//
//import SwiftUI
//
//struct GoalCompletedView9: View {
//    @State private var showMonthPicker = false
//    @State private var selectedDate = Date()
//    
//    var body: some View {
//        ZStack {
//            Color.black.ignoresSafeArea()
//            
//            VStack(spacing: 30) {
//                // Header
//                HStack {
//                    Text(monthYearFormatter.string(from: selectedDate))
//                        .font(.headline)
//                        .foregroundColor(.white)
//                    
//                    Button {
//                        withAnimation {
//                            showMonthPicker.toggle()
//                        }
//                    } label: {
//                        Image(systemName: showMonthPicker ? "chevron.up" : "chevron.down")
//                            .foregroundColor(.orange)
//                    }
//                    
//                    Spacer()
//                }
//                .padding(.horizontal)
//                
//                // Month-Year Picker
//                if showMonthPicker {
//                    MonthYearWheelPicker(selectedDate: $selectedDate)
//                        .frame(height: 200)
//                        .background(Color(UIColor.secondarySystemBackground))
//                        .cornerRadius(20)
//                        .padding(.horizontal)
//                }
//                
//                Spacer()
//            }
//        }
//    }
//    
//    private var monthYearFormatter: DateFormatter {
//        let f = DateFormatter()
//        f.dateFormat = "MMMM yyyy"
//        return f
//    }
//}
//
//
//// MARK: - UIKit Month-Year Picker (UIDatePicker)
//struct MonthYearWheelPicker: UIViewRepresentable {
//    @Binding var selectedDate: Date
//
//    func makeUIView(context: Context) -> UIDatePicker {
//        let picker = UIDatePicker()
//        picker.datePickerMode = .date
//        picker.preferredDatePickerStyle = .wheels
//        picker.locale = Locale(identifier: "en_US_POSIX")
//        picker.calendar = Calendar(identifier: .gregorian)
//        picker.addTarget(context.coordinator, action: #selector(Coordinator.dateChanged(_:)), for: .valueChanged)
//        picker.backgroundColor = .clear
//        
//        // Hide day component by setting to first day always
//        picker.setDate(startOfMonth(for: selectedDate), animated: false)
//        
//        return picker
//    }
//
//    func updateUIView(_ uiView: UIDatePicker, context: Context) {
//        uiView.setDate(startOfMonth(for: selectedDate), animated: true)
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject {
//        var parent: MonthYearWheelPicker
//        init(_ parent: MonthYearWheelPicker) { self.parent = parent }
//
//        @objc func dateChanged(_ sender: UIDatePicker) {
//            let comps = Calendar.current.dateComponents([.year, .month], from: sender.date)
//            if let date = Calendar.current.date(from: comps) {
//                parent.selectedDate = date
//            }
//        }
//    }
//
//    private func startOfMonth(for date: Date) -> Date {
//        let comps = Calendar.current.dateComponents([.year, .month], from: date)
//        return Calendar.current.date(from: comps) ?? date
//    }
//}
//
//
//#Preview {
//    GoalCompletedView9()
//}
