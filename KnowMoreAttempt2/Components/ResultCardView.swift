//
//  ResultCardView.swift
//  KnowMoreAttempt2
//
//  Created by Rudra Parikh on 17/5/2024.
//

import SwiftUI

struct ResultCardView: View {
    
    let card: CardData
    var body: some View {
        HStack {
            Text(card.title)
//                .font(.system(size: 16, weight: .medium))
            
            Spacer()
            
            Text("\(card.value)")
//                .font(.system(size: 16, weight: .bold))
            
        }
        .padding()
        .font(Font.custom("Louis George Cafe Bold", size: 24))
//        .background(Color("CardColor"))
        .cornerRadius(8)
    }
}

#Preview {
    ResultCardView(card: CardData(title: "Total Number of questions", value: 10))
}
