import SwiftUI

struct ActivityView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 25) {
                
                // MARK: - Header
                HStack {
                    Text("Activity")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    HStack(spacing: 16) {
                        Button(action: {}) {
                            Image(systemName: "calendar")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color(white: 0.2))
                                .clipShape(Circle())
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "person.crop.circle")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color(white: 0.2))
                                .clipShape(Circle())
                        }
                    }
                }
                .padding(.horizontal)
                
                // MARK: - Calendar Section
                VStack(spacing: 16) {
                    // Month header
                    HStack {
                        Text("October 2025")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        HStack(spacing: 20) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.orange)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.orange)
                        }
                    }
                    
                    // Weekdays & Days
                    VStack(spacing: 10) {
                        HStack(spacing: 15) {
                            ForEach(["SUN","MON","TUE","WED","THU","FRI","SAT"], id: \.self) { day in
                                Text(day)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        
                        HStack(spacing: 15) {
                            ForEach(20...26, id: \.self) { day in
                                if day == 24 {
                                    Circle()
                                        .fill(Color.orange)
                                        .frame(width: 40, height: 40)
                                        .overlay(Text("\(day)").foregroundColor(.white))
                                } else if day < 25 {
                                    Circle()
                                        .fill(Color.orange.opacity(0.3))
                                        .frame(width: 40, height: 40)
                                        .overlay(Text("\(day)").foregroundColor(.white))
                                } else {
                                    Circle()
                                        .fill(Color(white: 0.2))
                                        .frame(width: 40, height: 40)
                                        .overlay(Text("\(day)").foregroundColor(.white))
                                }
                            }
                        }
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.orange, lineWidth: 2)
                    )
                }
                .padding(.horizontal)
                
                // MARK: - Stats Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Learning Swift")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 20) {
                        StatCard(
                            icon: "flame.fill",
                            count: 3,
                            label: "Days Learned",
                            color: Color(red: 0.35, green: 0.2, blue: 0)
                        )
                        
                        StatCard(
                            icon: "cube.fill",
                            count: 1,
                            label: "Day Freezed",
                            color: Color(red: 0.1, green: 0.25, blue: 0.35)
                        )
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // MARK: - Big Orange Button
                Button(action: {}) {
                    Text("Log as\nLearned")
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 250, height: 250)
                        .background(
                            Circle()
                                .fill(Color(red: 0.8, green: 0.4, blue: 0))
                                .shadow(color: .orange.opacity(0.3), radius: 20, y: 10)
                        )
                }
                
                // MARK: - Blue Button
                Button(action: {}) {
                    Text("Log as Freezed")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                        .frame(maxWidth: 300)
                        .padding()
                        .background(
                            Capsule()
                                .fill(Color(red: 0.1, green: 0.5, blue: 0.6))
                        )
                }
                
                // Footer
                Text("1 out of 2 Freezes used")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
            }
            .padding(.top, 20)
        }
    }
}

#Preview {
    ActivityView()
}

// MARK: - Stat Card
struct StatCard: View {
    var icon: String
    var count: Int
    var label: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(.orange)
                .font(.system(size: 20))
            VStack(alignment: .leading, spacing: 2) {
                Text("\(count)")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                Text(label)
                    .font(.caption)
                    .foregroundColor(.white)
            }
        }
        .frame(width: 140, height: 60)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
            
            
            
            
        )
    }
}
