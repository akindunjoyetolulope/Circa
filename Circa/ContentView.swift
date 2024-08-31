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
            VStack{
                HeaderView()
                Spacer()
                Text("Hello Circa")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.appBG)
        }
    }
}

#Preview {
    ContentView()
}
