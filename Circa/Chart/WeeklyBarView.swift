//
//  WeeklyBarView.swift
//  Circa
//
//  Created by Busha on 01/09/2024.
//

import SwiftUI
import Charts


struct WeeklyBarView: View {
    
    let data = [WeeklySummary(date: "Fri", time: 3.1),
                WeeklySummary(date: "Sat", time: 2.0),
                WeeklySummary(date: "Sun", time: 2.5),
                WeeklySummary(date: "Mon", time: 1.0),
                WeeklySummary(date: "Tue", time: 2.8),
                WeeklySummary(date: "Wed", time: 4.0),
                WeeklySummary(date: "Thu", time: 2.0)
                ]
    var body: some View {
        Chart {
            ForEach(data) { dataPoint in
                
                LineMark(x: .value("Date", dataPoint.date), y: .value("Time", dataPoint.time))
                    .cornerRadius(8)
            }
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
    WeeklyBarView()
}
