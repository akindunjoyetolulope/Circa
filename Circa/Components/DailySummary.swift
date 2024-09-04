//
//  dailySummary.swift
//  Circa
//
//  Created by Damilare on 30/08/2024.
//

import SwiftUI
import HealthKit



struct DailySummary: View {
    @State private var setAlarm = false
    @ObservedObject var viewModel: SleepViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.cardBG
            VStack(alignment: .leading, spacing: 12) {
                
                HStack(alignment: .center) {
                    VStack (alignment: .leading, spacing: 6){
                        Text("Last night's sleep")
                            .font(.custom("FKGroteskNeueTrial-Regular", size: 14))
                            .kerning(-0.3)
                            .foregroundStyle(.white)
                        
                        Text(viewModel.sleepDuration)
                            .font(.custom("FKGroteskNeueTrial-Medium", size: 24))
                            .kerning(-0.26)
                            .foregroundColor(.white)
                        
                        Text("Sleep quality: ")
                            .font(.custom("FKGroteskNeueTrial-Regular", size: 14))
                            .kerning(-0.3)
                            .foregroundColor(.white) + Text(viewModel.sleepQuality).font(.system(size: 13))
                            .foregroundColor(viewModel.sleepQuality == "Good" ? .green : .primaryOrange)
                    }
                    
                    Spacer()
                    
                   WeeklyBarView()
                        .chartYAxis(.hidden)
                        .chartXAxis(.hidden)
                        .frame(width: .infinity, height: 60)
                        
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
                
                Divider()
                    .background(.cardStroke)
                

                HStack(spacing: 8){
                    
                    HStack(alignment: .top) {
                        Image(systemName: "clock.fill")
                            .foregroundColor(.white)
                        VStack(alignment: .leading, spacing: 2){
                            Text("I recommend you sleep at ")
                                .font(.custom("FKGroteskNeueTrial-Regular", size: 12))
                                .kerning(-0.3)
                                .foregroundStyle(.white) +
                            Text("09:30 PM tonight")
                                .font(.custom("FKGroteskNeueTrial-Medium", size: 12))
                                .kerning(-0.3)
                                .foregroundStyle(.white)
                           
                            
                            
                            Text("Click toggle to set alarm")
                                .font(.custom("FKGroteskNeueTrial-Regular", size: 10))
                                .kerning(-0.3)
                                .foregroundStyle(.white)
                        }
                    }
                    
                    Spacer()
                    
                    Toggle("Alarm", isOn: $setAlarm)
                        .toggleStyle(.switch)
                        .labelsHidden()
                }
                
            }
            .padding()
             
        }
        .frame(height: 180)
        .cornerRadius(16)
       

    }
   
}


class MockSleepViewModel: SleepViewModel {
    override init() {
        super.init()
        self.sleepDuration = "3h 17m"
        self.sleepQuality = "Terrible"
    }
    
}


struct dailySummary_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DailySummary(viewModel: MockSleepViewModel())
                .previewLayout(.sizeThatFits)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .background(Color.appBG)
                
                
            
        }
    }
}
