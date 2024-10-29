//
//  WCProgreesView.swift
//  whatsAppClone
//
//  Created by abdullah on 24.10.2024.
//

import SwiftUI

struct WCProgreesView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .controlSize(.extraLarge)
    }
}

#Preview {
    WCProgreesView()
}
