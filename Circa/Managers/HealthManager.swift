//
//  HealthManager.swift
//  Circa
//
//  Created by Busha on 30/08/2024.
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
    
    func fetchSleepData(completion: @escaping (HKCategorySample?) -> Void) {
        guard let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else {
            return
        }
        
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        let query = HKSampleQuery(sampleType: sleepType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, result, error) in
            if let error = error {
                print("Error fetching sleep data: \(error.localizedDescription)")
                completion(nil)
            } else {
                completion(result?.first as? HKCategorySample)
            }
        }
        
        healthStore?.execute(query)
    }
}
