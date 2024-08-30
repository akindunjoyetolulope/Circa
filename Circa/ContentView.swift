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
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.primaryOrange)
                Text("Hello, Circa!")
                    .bold()
                    .foregroundStyle(.textPrimary)
            }
            .padding()
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
