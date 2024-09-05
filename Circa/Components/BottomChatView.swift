//
//  BottomChatView.swift
//  Circa
//
//  Created by Busha on 05/09/2024.
//

import SwiftUI

struct BottomChatView: View {
    @State private var message = ""
    
    var body: some View {
        VStack{
            CustomMessageField(message: $message, onSend: sendMessage)
                .padding()
        }
        .background(Color.appBG)
        .frame(height: 80)
        
    }
    
    func sendMessage() {
        print(message)
       
    }
}


struct CustomMessageField: View {
    @Binding var message: String
    var onSend: () -> Void
    
    var body: some View {
        HStack(spacing: 10) {
            TextField("Send me a message...", text: $message)
                .font(.custom("FKGroteskNeueTrial-Regular", size: 13))
                .kerning(-0.43)
            
            
            Button(action: {
                if !message.isEmpty {
                    onSend()
                }
            }) {
                Image(systemName: message.isEmpty ? "mic.fill" : "arrowshape.up.circle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(message.isEmpty ? .primaryOrange : .green)
                
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 12)
        .background(Color.appBG)
        .overlay(
            RoundedRectangle(cornerRadius: 12).stroke(Color.textFieldBorder))
        
        
        
    }
}


#Preview {
    BottomChatView()
}
