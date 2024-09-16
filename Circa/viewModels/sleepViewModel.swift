//
//  sleepViewModel.swift
//  Circa
//
//  Created by Damilare on 30/08/2024.
//

import Foundation
import HealthKit

class SleepViewModel: ObservableObject {
    @Published var sleepData: [(date: Date, duration: Double)] = []
    @Published var sleepDuration: String = "Loading..."
    @Published var sleepQuality: String = "Loading..."
    
    private let healthKitManager = HealthKitManager()
    
    init() {
        fetchSleepData()
    }
    
    func fetchSleepData() {
        healthKitManager.fetchSleepData { [weak self] samples in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                // Process samples
                var dailySleepData: [Date: Double] = [:]
                
                for sample in samples {
                    let startDate = sample.startDate
                    let endDate = sample.endDate
                    let duration = endDate.timeIntervalSince(startDate) / 3600
                    
                    // Aggregate sleep duration by day
                    let calendar = Calendar.current
                    let dayStart = calendar.startOfDay(for: startDate)
                    dailySleepData[dayStart, default: 0.0] += duration
                }
                
                // Convert dictionary to array and sort by date
                self.sleepData = dailySleepData.map { (date: $0.key, duration: $0.value) }
                self.sleepData.sort { $0.date > $1.date }
                
                // Update sleepDuration and sleepQuality
                if let latestSample = self.sleepData.first {
                    let duration = latestSample.duration
                    self.sleepDuration = String(format: "%.0fh %.0fm", duration)
                    
                    // Update sleep quality analysis
                    switch duration {
                    case _ where duration >= 7:
                        self.sleepQuality = "Good"
                    case _ where duration >= 5:
                        self.sleepQuality = "Fair"
                    default:
                        self.sleepQuality = "Poor"
                    }
                } else {
                    self.sleepDuration = "No data"
                    self.sleepQuality = "Unknown"
                }
            }
        }
    }
}






