//
//  RecommendedAction.swift
//  Circa
//
//  Created by Busha Digital Ltd on 30/08/2024.
//

import SwiftUI

struct RecommendedAction: View {
    @State private var vibrateOnRing = false

    var body: some View {
        Toggle(isOn: $vibrateOnRing) {
            Text("Vibrate on Ring")
        }
    }
}

#Preview {
    RecommendedAction()
}
