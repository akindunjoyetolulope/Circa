//
//  HeaderView.swift
//  Circa
//
//  Created by Busha Digital Ltd on 31/08/2024.
//

import SwiftUI

struct HeaderView: View {
    @Binding var name: String
    
    
    var body: some View {
        HStack(spacing:3) {
                VStack(alignment: .leading) {
                    Text("Hi \(name),")
                        .font(.custom("FKGroteskNeueTrial-Regular", size: 24))
                        .foregroundStyle(.textPrimary)
                        .kerning(-0.26)
                    Text("Here’s your sleep data for the past week.")
                        .font(.custom("FKGroteskNeueTrial-Regular", size: 15))
                        .foregroundStyle(.textSecondary)
                        .kerning(-0.43)
                  
                }
                Spacer()
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 32))
                    .foregroundStyle(.textPrimary)
            }
        .padding()
    }
}

#Preview {
    HeaderView(name: .constant("Damilare"))
}
