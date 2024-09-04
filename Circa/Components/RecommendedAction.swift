//
//  RecommendedAction.swift
//  Circa
//
//  Created by Busha Digital Ltd on 30/08/2024.
//

import SwiftUI
struct RecommendedAction: View {
    @State private var setRecommendedAction = false
    
    var body: some View {
        HStack(spacing: 6) {
            Text("Send me a reminder 30mins before my recommended sleep time")
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

struct RecommendedData {
    let text: String = "Send me a reminder 30mins before my recommended sleep time"
}


#Preview {
    RecommendedAction()
}

