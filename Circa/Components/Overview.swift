//
//  Overview.swift
//  Circa
//
//  Created by Busha Digital Ltd on 04/09/2024.
//

import SwiftUI

struct Overview: View {

    var body: some View {
        HStack(){
            VStack() {
                VStack(alignment: .leading){

                    Text("Weekly Overview")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .bold()

                    BarChartView().frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).padding(.top)
                }
                .padding(16)

                Divider().background(.gray)

                HStack(){
                    HStack(alignment: .top){
                        Image(systemName: "clock.fill")
                            .foregroundColor(.white)
                        VStack(alignment: .leading, spacing: 2){
                            Text("You averaged 4hr 44min in bed")
                                .font(.custom("FKGroteskNeueTrial-Regular", size: 12))
                                .foregroundColor(.white)
                            Text("23-29 Aug 2024")
                                .font(.custom("FKGroteskNeueTrial-Regular", size: 10))
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

}

#Preview {
    Overview()
}
