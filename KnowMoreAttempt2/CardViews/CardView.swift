//
//  CardView.swift
//  KnowMoreAttempt2
//
//  Created by Rudra Parikh on 15/5/2024.
//

import SwiftUI

struct CardView: View {
    
    @State var CardFlipped = false
    
    var body: some View {
        VStack {
            
            if CardFlipped == true {
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 300, height: 500)
            } else {
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 300, height: 500)
            }
        }
        .rotation3DEffect(Angle(degrees: self.CardFlipped ? 180 : 0), axis: (x:0, y: 1, z: 0))
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.3)) {
                self.CardFlipped.toggle()
            }
        }
    }
}

#Preview {
    CardView()
}
