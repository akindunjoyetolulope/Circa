//
//  ContentView.swift
//  Circa
//
//  Created by Busha Digital Ltd on 30/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack(spacing: 4){
                HeaderView()
                DailySummary(viewModel: SleepViewModel())
                .padding(.horizontal)
                Overview().padding()
                VStack(alignment: .leading){
                    Text("Recommended Actions")
                    RecommendedAction()
                    RecommendedAction()
                }.padding(.horizontal)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.appBG)
        }
    }
}

#Preview {
    ContentView()
}
