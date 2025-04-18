//
//  ToastView.swift
//  FullFunc
//
//  Created by PENGKHIENG-KIM on 18/4/25.
//

import SwiftUI

struct ToastView: View {
    
    var message: String
    
    var body: some View {
        VStack {
            Spacer()
            Text(message)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(Color.black.opacity(0.85))
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding(.bottom, 50)
        }
    }
}
