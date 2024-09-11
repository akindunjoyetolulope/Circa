//
//  CircaApp.swift
//  Circa
//
//  Created by Damilare on 30/08/2024.
//

import SwiftUI

@main
struct CircaApp: App {
   
    var body: some Scene {
        WindowGroup {
            MainView()
            
        }
    }
}

struct MainView: View{
    @State private var isOnboardingShown: Bool
    @State private var userName: String = ""
    
    init() {
        let completed = UserDefaults.standard.bool(forKey: "onboardingCompleted")
        let savedName = UserDefaults.standard.string(forKey: "userName") ?? ""
        _isOnboardingShown = State(initialValue: !completed)
        _userName = State(initialValue: savedName)
    }
    var body: some View{
        if isOnboardingShown {
            OnboardingView(isOnboardingShown: $isOnboardingShown, name: $userName)
        } else {
            ContentView(name: userName)
        }
        Button("Reset Onboarding") {
            UserDefaults.standard.set(false, forKey: "onboardingCompleted")
            isOnboardingShown = true
        }
    }
}
