//
//  OnboardingForm.swift
//  Circa
//
//  Created by Busha Digital Ltd on 05/09/2024.
//

import SwiftUI

struct OnboardingForm: View {
    @State private var isOnboardingShown: Bool = !UserDefaults.standard.bool(forKey: "onboardingCompleted")
    @State private var userName: String = " "
    
    var body: some View {
        VStack{
            CustomizeTextField(isOnboardingShown: $isOnboardingShown, userName: $userName)
        }
    }
    

}



struct CustomizeTextField: View {
    @Binding var isOnboardingShown: Bool
    @Binding var userName: String
    @State private var name: String = ""
    @FocusState private var isFocused: Bool
    @State private var active = false
    
    
    
    var body: some View {
       
                VStack(alignment: .leading) {
                    Text("Nice to meet you, I'm...")
                        .foregroundColor(.primaryGray)
                        .font(.custom("FKGroteskNeueTrial-Regular", size: 17))
                        .padding(.bottom, 2)
                    
                    TextField("Enter your name", text: $name)
                        .font(.custom("FKGroteskNeueTrial-Regular", size: 15))
                        .padding(2)
                        .focused($isFocused)
                        .tint(.primaryOrange)
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.textFieldBorder, lineWidth: 1)
                )
                .background(.textFieldBg)
        
        NavigationLink(destination: ContentView(name: name)) {
            Text("Continue")
                .foregroundColor(.white)
                .disabled(name.isEmpty)
                .font(.custom("FKGroteskNeueTrial-Medium", size: 20))
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(name.isEmpty ? Color.gray.opacity(0.5) : Color.cardBG)
                .cornerRadius(30)
                .padding(.top)
        }
        .simultaneousGesture(TapGesture().onEnded {
            UserDefaults.standard.set(true, forKey: "onboardingCompleted")
            UserDefaults.standard.set(name, forKey: "userName")
            userName = name
            isOnboardingShown = false
        })
                
//        NavigationLink("Continue", destination: ContentView(name: $name))
//                    .foregroundColor(.white)
//                    .disabled(name.isEmpty)
//                    .font(.custom("FKGroteskNeueTrial-Medium", size: 20))
//                    .padding(.vertical, 12)
//                    .frame(maxWidth: .infinity)
//                    .background(name.isEmpty ? Color.gray.opacity(0.5) : Color.cardBG)
//                    .cornerRadius(30)
//                    .padding(.top)
        }
       
    
    
    func setActive() {
        
    }
}

#Preview {
    OnboardingForm()
}
