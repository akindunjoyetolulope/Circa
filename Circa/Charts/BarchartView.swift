//
//  BarchartView.swift
//  Circa
//
//  Created by Busha Digital Ltd on 04/09/2024.
//

import SwiftUI
import Charts

struct BarChartView: View {
    let data: [ChartData] = [
        ChartData(day: "Fri", value: 8),
        ChartData(day: "Sat", value: 4),
        ChartData(day: "Sun", value: 1),
        ChartData(day: "Mon", value: 2),
        ChartData(day: "Tue", value: 4),
        ChartData(day: "Wed", value: 10),
        ChartData(day: "Thur", value: 6)
    ]
    
    
    var body: some View {
        VStack{
            Chart {
                RuleMark(y: .value("goals", 8))
                    .foregroundStyle(.yellow)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                ForEach(data){ item in
                    BarMark(
                        x: .value("Day", item.day),
                        y: .value("Hours", 12 - item.value)
                    )
                    .foregroundStyle(.primaryOrange)
                    .cornerRadius(8)
                }
                
            }
            .chartYAxis {
                AxisMarks(preset: .automatic, position: .leading, values: .automatic(desiredCount: 7)) { value in
                    AxisGridLine()
                    AxisValueLabel() {
                        // Damilare - Converting the Y-axis value to Int and format it as 00:00
                        if let intValue = value.as(Int.self) {
                            let displayedValue = 12 - intValue
                            let formattedValue = String(format: "%02d:00", displayedValue)
                            Text(formattedValue)
                        }
                    }
                    .font(.custom("FKGroteskNeueTrial-Regular", size: 9))
                    .foregroundStyle(.white)
                }
            }
            .chartYScale(domain: 0...12)
            .chartXAxis {
                AxisMarks(values: .automatic) {
                    AxisGridLine().foregroundStyle(.cardStroke)
                    AxisValueLabel().foregroundStyle(Color.white)
                        .font(.custom("FKGroteskNeueTrial-Regular", size: 9))
                }
            }
        }
        
    }
}

struct ChartData: Identifiable {
    let id = UUID()
    let day: String
    let value: Int
    
    // Damilare - Computed property to format the value as time in 00:00 format
    var formattedValue: String {
        let hours = value / 1 // Since our value seems to represent hours directly
        return String(format: "%02d:%02d", hours)
    }
}
#Preview {
    BarChartView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
