//
//  Overview.swift
//  Circa
//
//  Created by Damilare on 04/09/2024.
//

import SwiftUI

struct Overview: View {
    @ObservedObject var viewModel: SleepViewModel
    
    var body: some View {
        
        VStack(spacing: 0) {
            VStack(alignment: .leading){
                
                Text("Weekly Overview")
                    .font(.custom("FKGroteskNeueTrial-Regular", size: 14))
                    .kerning(-0.3)
                    .foregroundStyle(.white)
                
                SleepChartView(viewModel: viewModel).padding(.top)
            }
            .frame(height: 180)
            .padding(16)
            
            Divider()
                .background(.cardStroke)
            
            HStack{
                HStack(alignment: .top){
                    Image(systemName: "clock.fill")
                        .foregroundColor(.white)
                    VStack(alignment: .leading, spacing: 2){
                        Text("You averaged 4hr 44min in bed")
                            .font(.custom("FKGroteskNeueTrial-Regular", size: 12))
                            .kerning(-0.3)
                            .foregroundColor(.white)
                        Text("23-29 Aug 2024")
                            .font(.custom("FKGroteskNeueTrial-Medium", size: 10))
                            .foregroundColor(.yellow)
                    }
                    
                }
                
                Spacer()
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .frame(width: 24.0, height: 24.0)
                    .foregroundColor(.primaryOrange)
            }
            .padding()
        }
        .background(Color.cardBG)
        .cornerRadius(16)
        
    }
    
}

#Preview {
    Overview(viewModel: SleepViewModel())
}

