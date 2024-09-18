//
//  NewChartView.swift
//  Circa
//
//  Created by Damilare on 13/09/2024.
//

import SwiftUI
import Charts

struct SleepChartView: View {
    @ObservedObject var viewModel: SleepViewModel
    
    var body: some View {
        VStack {
            if viewModel.sleepData.isEmpty {
                Text("No sleep data")
            } else {
                Chart(viewModel.sleepData, id: \.date) { dataPoint in
                    BarMark(
                        x: .value("Date", dataPoint.date, unit: .day),
                        y: .value("Duration", dataPoint.duration)
                    )
                    .foregroundStyle(.primaryOrange)
                    .cornerRadius(8)
                }
                .foregroundStyle(.primaryOrange)
                .chartYAxis {
                    AxisMarks(position: .leading, values: .automatic(desiredCount: 7)) { value in
                        AxisGridLine(stroke: StrokeStyle(dash: [2]))
                            .foregroundStyle(.cardStroke)
                        AxisTick()
                        AxisValueLabel {
                            if let duration = value.as(Double.self) {
                                let hours = 12 - Int(duration)
                                let minutes = 00
                                let timeString = String(format: "%02d:%02d", hours, minutes)
                                return Text(timeString)
                            }
                            return Text("")
                        }
                        .font(.custom("FKGroteskNeueTrial-Regular", size: 9))
                        .foregroundStyle(Color.white)
                    }
                }
                .chartYScale(domain: [0, 12])
                .chartXAxis {
                    AxisMarks(values: .automatic(desiredCount: 7)) { value in
                        AxisGridLine().foregroundStyle(.cardStroke)
                        AxisValueLabel(centered: true) {
                            if let date = value.as(Date.self) {
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "E"
                                return Text(dateFormatter.string(from: date))
                            }
                            return Text("")
                        }
                        .font(.custom("FKGroteskNeueTrial-Regular", size: 12))
                        .foregroundStyle(Color.white)
                    }
                }
                
            }
        }
    }
}




#Preview {
    SleepChartView(viewModel: SleepViewModel())
}



