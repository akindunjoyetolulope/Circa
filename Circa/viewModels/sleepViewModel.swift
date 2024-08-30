//
//  sleepViewModel.swift
//  Circa
//
//  Created by Busha on 30/08/2024.
//

import Foundation



class SleepViewModel: ObservableObject {
    @Published var sleepDuration: String = "Loading..."
    @Published var sleepQuality: String = "Loading..."
    
    private let healthKitManager = HealthKitManager()
    
    init() {
        fetchSleepData()
    }
    
    func fetchSleepData() {
        healthKitManager.fetchSleepData { [weak self] sample in
            DispatchQueue.main.async {
                if let sample = sample {
                    let duration = sample.endDate.timeIntervalSince(sample.startDate) / 3600
                    self?.sleepDuration = String(format: "%.0fh %.0fm", floor(duration), (duration - floor(duration)) * 60)
                    
                    // Example sleep quality analysis
                    self?.sleepQuality = duration >= 7 ? "Good" : "Terrible"
                } else {
                    self?.sleepDuration = "No data"
                    self?.sleepQuality = "Unknown"
                }
            }
        }
    }
}
