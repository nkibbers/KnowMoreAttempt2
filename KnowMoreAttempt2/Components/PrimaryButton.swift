//
//  PrimaryButton.swift
//  KnowMoreAttempt2
//
//  Created by Ved Ketan Dave on 17/5/2024.
//

import SwiftUI

struct PrimaryButton: View {
    
    var text: String
    var background: Color = Color(.kmBlack)
    
    var body: some View {
        Text(text)
            .frame(width: 300, height: 30)
            .foregroundStyle(Color(.white))
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(8)
    }
}

#Preview {
    PrimaryButton(text: "Next")
}
