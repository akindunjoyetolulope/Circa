//
//  OnboardingView.swift
//  Circa
//
//  Created by Busha Digital Ltd on 05/09/2024.
//

import SwiftUI

struct OnboardingView: View {

    @State private var name: String = ""
//    let userName = UserDefaults.standard.string(forKey: "userName")
    
    var body: some View {
        VStack(spacing: 24){
            Spacer()
            VStack(alignment: .leading, spacing: 12){
                Text("Hi there, I’m Circa.")
                    .font(.custom("FKGroteskNeueTrial-Regular", size: 22))
                
                Text("I'm your personal sleep assistant, designed to analyze your health data and provide tailored sleep recommendations.")
                    .font(.custom("FKGroteskNeueTrial-Regular", size: 15))
                
                Text("Let's optimize your sleep schedule together!")
                    .font(.custom("FKGroteskNeueTrial-Regular", size: 15))
            }
            VStack{
                OnboardingForm()
                Text("You can change this later")
                    .foregroundColor(.primaryGray)
                    .font(.custom("FKGroteskNeueTrial-Regular", size: 13))
            }
            Spacer()
        }
        .padding()
        .background(Color.appBG)
        
        
        
    }
}

#Preview {
    OnboardingView()
}
