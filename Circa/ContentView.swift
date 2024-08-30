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
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Hi Damilare,")
                        .font(.custom("FKGroteskNeueTrial-Regular", size: 24))
                        .foregroundStyle(.textPrimary)
                        .kerning(-0.26)
                    Text("Here’s your sleep data for the past week.")
                        .font(.custom("FKGroteskNeueTrial-Regular", size: 15))
                        .foregroundStyle(.textSecondary)
                        .kerning(-0.43)
                  
                }
                .padding(.horizontal)
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 32))
            }
            .frame(width: .infinity)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appBG)
        .ignoresSafeArea(.all)
    }
    
    /*init() {
         for familyName in UIFont.familyNames {
             print(familyName)
             
             for fontName in UIFont.fontNames(forFamilyName:familyName) {
                 print("--\(fontName)")
             }
         }
     }*/
}

#Preview {
    ContentView()
}
