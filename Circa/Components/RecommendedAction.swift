//
//  RecommendedAction.swift
//  Circa
//
//  Created by Busha Digital Ltd on 30/08/2024.
//

import SwiftUI
struct RecommendedAction: View {
    @State private var setRecommendedAction = false
    let message: String
    
    var body: some View {
        HStack(spacing: 6) {
            Text("\(message)")
                .font(.custom("FKGroteskNeueTrial-Regular", size: 12))
                .foregroundColor(.white)
            
            Spacer()
            Toggle("Alarm", isOn: $setRecommendedAction)
                .toggleStyle(.switch)
                .labelsHidden()
        }
        .padding(14)
        .background(Color.cardBG)
        .cornerRadius(16)
    }
}

#Preview {
    RecommendedAction(message: "Turn on DND by  09:00 PM")
}


