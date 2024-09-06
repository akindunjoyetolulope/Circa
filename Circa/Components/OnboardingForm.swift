//
//  OnboardingForm.swift
//  Circa
//
//  Created by Busha Digital Ltd on 05/09/2024.
//

import SwiftUI

struct OnboardingForm: View {
    @State private var name = ""
    
    var body: some View {
        VStack{
            CustomizeTextField(name: $name, onContinue: saveName)
        }
    }
    
    func saveName() {
        UserDefaults.standard.set($name, forKey: "userName")
    }
}



struct CustomizeTextField: View {
    @Binding var name: String
    @FocusState private var isFocused: Bool
    @State private var active = false
    
    var onContinue: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Nice to meet you, I'm...")
                .foregroundColor(.primaryGray)
                .font(.custom("FKGroteskNeueTrial-Regular", size: 17))
                .padding(.bottom, 2)
            HStack {
                TextField("Enter your name", text: $name)
                    .font(.custom("FKGroteskNeueTrial-Regular", size: 15))
                    .padding(2)
                    .focused($isFocused)
                    .tint(.primaryOrange)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.primaryGray.opacity(0.3), lineWidth: 1)
        )
        .background(.textFieldBg)
        
        Button(action: {
            if !name.isEmpty {
                onContinue()
            }
        }){
            Text("Continue")
        }.foregroundColor(.white)
            .disabled(name.isEmpty)
            .font(.custom("FKGroteskNeueTrial-Medium", size: 20))
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .background(name.isEmpty ? Color.gray.opacity(0.5) : Color.cardBG)
            .cornerRadius(30)
            .padding(.top)
    }
    
    func setActive() {
        
    }
}

#Preview {
    OnboardingForm()
}
