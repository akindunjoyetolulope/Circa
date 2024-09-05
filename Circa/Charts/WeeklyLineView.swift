//
//  WeeklyLineView.swift
//  Circa
//
//  Created by Busha Digital Ltd on 06/09/2024.
//

import SwiftUI
import Charts

struct WeeklyLineView: View {
    let data = [WeeklySummary(date: "Fri", time: 2.1),
                WeeklySummary(date: "Sat", time: 3.0),
                WeeklySummary(date: "Sun", time: 4.2),
                WeeklySummary(date: "Mon", time: 3.0),
                WeeklySummary(date: "Tue", time: 2.8),
                WeeklySummary(date: "Wed", time: 3.8),
                WeeklySummary(date: "Thu", time: 4.3)
    ]
    var body: some View {
        Chart {
            ForEach(data) { dataPoint in
                LineMark(x: .value("Date", dataPoint.date),
                         y: .value("Time", dataPoint.time))
                .lineStyle(StrokeStyle.init(lineWidth: 2))
                .cornerRadius(8)
                
            }
            RuleMark(y: .value("days", 3.0))
                .foregroundStyle(.primaryOrange)
                .lineStyle(StrokeStyle(lineWidth: 2, dash: [3]))
        }
        
        .chartYScale(domain: 0...8)
        .foregroundStyle(.primaryOrange)
        .aspectRatio(contentMode: .fit)
        
    }
}


struct WeeklySummary: Identifiable {
    let date: String
    let time: Double
    
    let id = UUID()
}
#Preview {
    WeeklyLineView()
}
