//
//  ContentView.swift
//  Circa
//
//  Created by Busha Digital Ltd on 30/08/2024.
//

import SwiftUI

struct ContentView: View {
    let userName = UserDefaults.standard.string(forKey: "userName")
    
    var body: some View {
        ZStack{
            VStack(spacing: 2){
                HeaderView(userName: userName ?? "Circarian")
                ScrollView{
                    VStack(spacing: 0){
                        DailySummary(viewModel: SleepViewModel())
                            .padding(.horizontal)
                        Overview().padding()
                        VStack(alignment: .leading){
                            Text("Recommended Actions")
                            RecommendedAction(message: "Turn on DND by  09:00 PM")
                            RecommendedAction(message: "Send me a reminder 30mins before my recommended sleep time")
                        }.padding(.horizontal)
                    }
                }
                BottomChatView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.appBG)
        }
    }
}

#Preview {
    ContentView()
}
