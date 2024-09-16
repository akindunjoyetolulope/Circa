//
//  ContentView.swift
//  Circa
//
//  Created by Busha Digital Ltd on 30/08/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: SleepViewModel
    var name: String
    
    var body: some View {
       ZStack{
                VStack(spacing: 0){
                    HeaderView(name: name)
                    ScrollView{
                        VStack(spacing: -5){
                            DailySummary(viewModel: SleepViewModel())
                                .padding(.horizontal)
                            Overview(viewModel: SleepViewModel()).padding()
                            VStack(alignment: .leading){
                                Text("Recommended Actions")
                                    .foregroundStyle(.textPrimary)
                                RecommendedAction(message: "Turn on DND by  09:00 PM")
                                RecommendedAction(message: "Send me a reminder 30mins before my recommended sleep time")
                            }.padding(.horizontal)
                        }
                    }
                    BottomChatView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.appBG)
                .navigationBarBackButtonHidden(true)
            }
       
        
        
    }
}



#Preview {
    ContentView(viewModel: SleepViewModel(), name: ("Damilare"))
}

