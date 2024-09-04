//
//  BarchartView.swift
//  Circa
//
//  Created by Busha Digital Ltd on 03/09/2024.
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
    
    // Y-axis time labels
    let timeLabels: [String] = ["00:00", "02:00", "04:00", "06:00", "08:00", "10:00", "12:00"]
    
    var body: some View {
        VStack{
            Chart {
                RuleMark(y: .value("goals", 8))
                    .foregroundStyle(.yellow)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                ForEach(data){ item in
                    BarMark(
                        x: .value("Day", item.day),
                        y: .value("Hours", item.value)
                    )
                    .foregroundStyle(.primaryOrange)
                    .cornerRadius(8)
                }
            }
            
            .chartYAxis {
                AxisMarks(position: .leading, values: .automatic(desiredCount: 7))
                { value in
                    AxisGridLine(stroke: StrokeStyle( dash: [2]))
                        .foregroundStyle(.gray)
                    AxisTick()
                    AxisValueLabel().foregroundStyle(Color.white)
                    
                    //                    if let intValue = value.as(Double.self),
                    //                       intValue >= 0 && intValue < Double(timeLabels.count) {
                    //                        AxisValueLabel {
                    //                            Text(timeLabels[Int(intValue)])
                    //                                .foregroundColor(.red) // Set the Y-axis label color to white
                    //                        }
                    //                    }
                }
            }
            
            .chartYScale(domain: [0,12])
            .chartXAxis {
                AxisMarks(values: .automatic) {
                    AxisGridLine().foregroundStyle(.gray)
                    AxisValueLabel().foregroundStyle(Color.white)
                }
            }
        }
    }
}

struct ChartData: Identifiable {
    let id = UUID()
    let day: String
    let value: Int
}
#Preview {
    BarChartView()
}
