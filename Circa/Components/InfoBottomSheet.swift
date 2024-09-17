//
//  InfoBottomSheet.swift
//  Circa
//
//  Created by Busha on 17/09/2024.
//

import SwiftUI

struct InfoBottomSheet: View {
    @Binding var showingBottomSheet: Bool
    var body: some View {
        VStack(spacing: 20){
            HStack {
                Text("Sleep average")
                    .font(.custom("FKGroteskNeueTrial-Medium", size: 20))
                    .foregroundStyle(.white)
                Spacer()
                Button("Done") {
                    showingBottomSheet = false
                }
                .font(.custom("FKGroteskNeueTrial-Medium", size: 18))
                .foregroundStyle(.primaryOrange)
//                Button {
//                    showingBottomSheet = false
//                } label: {
//                    Image(systemName: "xmark")
//                        .font(.system(size: 12, weight: .medium))
//                        .foregroundStyle(.white)
//                        .background(Circle().fill(.primaryOrange).frame(width: 24, height: 24))
//                }
                
            }
            ScrollView {
                VStack(spacing: 8) {
                    Text("Sleep is a vital component of overall health and well-being, impacting both physical and mental functions. For most adults, the recommended average sleep duration is 7-9 hours per night. However, this need varies across age groups and individual lifestyles. Sleep provides essential rest to the brain, allowing it to process information, form memories, and regulate emotions. It also aids the body in repairing tissue, producing hormones, and strengthening the immune system.")
                        .font(.custom("FKGroteskNeueTrial-Regular", size: 16))
                        .foregroundStyle(.white)
                    Text("Getting enough sleep on average helps maintain concentration, mood stability, and physical health. Conversely, chronic sleep deprivation—regularly falling below the recommended hours—can result in various negative outcomes, such as decreased cognitive performance, irritability, weakened immune response, and a heightened risk of developing conditions like heart disease, diabetes, and obesity.")
                        .font(.custom("FKGroteskNeueTrial-Regular", size: 16))
                        .foregroundStyle(.white)
                    
                    Text("Tracking your sleep average is a helpful way to monitor your sleep patterns. Modern technology, such as wearable devices and apps, can track sleep cycles and provide insights into sleep quality. To improve sleep averages, it’s essential to adopt good sleep hygiene, including maintaining a consistent bedtime routine, avoiding stimulants before bed, and creating a comfortable sleep environment conducive to rest.")
                        .font(.custom("FKGroteskNeueTrial-Regular", size: 16))
                        .foregroundStyle(.white)
                    
                    Text("In addition to the recommended sleep duration, the quality of sleep plays a significant role in how refreshed and energized one feels. Sleep is composed of different stages: light sleep, deep sleep, and REM (Rapid Eye Movement) sleep. Each stage serves distinct functions. Deep sleep is crucial for physical recovery, while REM sleep supports cognitive functions, such as memory consolidation and emotional regulation. Even if someone sleeps for the recommended number of hours, frequent disruptions or imbalances in these sleep stages can lead to fatigue and reduced mental clarity during the day.")
                        .font(.custom("FKGroteskNeueTrial-Regular", size: 16))
                        .foregroundStyle(.white)
                    
                    Text("The impact of sleep averages goes beyond just energy levels. Research shows a strong connection between sleep habits and long-term health. Consistently sleeping either too little or too much has been linked to increased risks of chronic conditions, including hypertension, stroke, and mental health disorders like anxiety and depression. Moreover, irregular sleep patterns, such as varying bedtimes and wake-up times, can disrupt the body’s circadian rhythm, which regulates the sleep-wake cycle. To maintain a healthy sleep average, it’s important to establish a consistent routine, be mindful of sleep quality, and listen to your body’s needs for rest. Making sleep a priority can significantly improve both short-term and long-term well-being.")
                        .font(.custom("FKGroteskNeueTrial-Regular", size: 16))
                        .foregroundStyle(.white)
                    Text("Overall, consistently getting the right amount of sleep enhances your quality of life, both mentally and physically.")
                        .font(.custom("FKGroteskNeueTrial-Regular", size: 16))
                        .foregroundStyle(.white)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .ignoresSafeArea(.all)
        .background(.cardBG)
        
        
        
    }
}

#Preview {
    InfoBottomSheet(showingBottomSheet: .constant(true))
}
