//
//  HealthManager.swift
//  Circa
//
//  Created by Damilare on 30/08/2024.
//

import Foundation
import HealthKit

class HealthKitManager: ObservableObject {
    private var healthStore: HKHealthStore?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
            requestAuthorization()
        }
    }
    
    private func requestAuthorization() {
        guard let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else {
            return
        }
        
        healthStore?.requestAuthorization(toShare: nil, read: [sleepType]) { (success, error) in
            if !success {
                print("Authorization failed")
            }
        }
    }
    
    func fetchSleepData(completion: @escaping ([HKCategorySample]) -> Void) {
        guard let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else {
            return
        }
        
        // Define the date range for the past 7 days
        let calendar = Calendar.current
        let endDate = Date()
        let startDate = calendar.date(byAdding: .day, value: -7, to: endDate)!
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        let query = HKSampleQuery(sampleType: sleepType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, result, error) in
            if let error = error {
                print("Error fetching sleep data: \(error.localizedDescription)")
                completion([])
            } else {
                if let result = result as? [HKCategorySample] {
                    completion(result)
                } else {
                    completion([])
                }
            }
        }
        
        healthStore?.execute(query)
    }
}
