//
//  Overview.swift
//  Circa
//
//  Created by Damilare on 04/09/2024.
//

import SwiftUI

struct Overview: View {
    @ObservedObject var viewModel: SleepViewModel
    @State var showingBottomSheet = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Weekly Overview and Chart
            VStack(alignment: .leading) {
                Text("Weekly Overview")
                    .font(.custom("FKGroteskNeueTrial-Regular", size: 14))
                    .kerning(-0.3)
                    .foregroundColor(.white)
                
                SleepChartView(viewModel: viewModel)
                    .padding(.top)
            }
            .frame(height: 180)
            .padding(16)
            
            // Divider
            Divider()
                .background(Color.cardStroke)
            
            // Bed Time Information and Info Button
            HStack {
                // Bed Time Details
                HStack(alignment: .top) {
                    Image(systemName: "clock.fill")
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading, spacing: 2) {
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
                
                // Info Button to Show Bottom Sheet
                Button {
                    showingBottomSheet.toggle()
                } label: {
                    Image(systemName: "info.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.primaryOrange)
                }
                .sheet(isPresented: $showingBottomSheet) {
                    InfoBottomSheet(showingBottomSheet: $showingBottomSheet)
                        .presentationDetents([.large])
                        .presentationDragIndicator(.visible) 
                }
            }
            .padding()
        }
        .background(Color.cardBG)
        .cornerRadius(16)
        
        //.blur(radius: showingBottomSheet ? 20 : 0)
    }
}

#Preview {
    Overview(viewModel: SleepViewModel())
}

