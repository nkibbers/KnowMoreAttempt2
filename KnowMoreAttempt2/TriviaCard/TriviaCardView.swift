//
//  TriviaCardView.swift
//  KnowMoreAttempt2
//
//  Created by Rudra Parikh on 13/5/2024.
//

import SwiftUI

struct TriviaCardView: View {
    
    let triviaCard: TriviaCard
    let cardColors = ["greenbg","orangebg"]
    let bgImageName: String
    
    init(triviaCard: TriviaCard, bgImageName: String) {
        self.triviaCard = triviaCard
        self.bgImageName = bgImageName
    }
    
    var body: some View {
        VStack {
            Text(triviaCard.question)
                .foregroundStyle(Color.white)
                .font(.headline)
                .padding()
                
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .aspectRatio(1, contentMode: .fit)
        .background(randomBackground())
        .cornerRadius(10)
        .padding(5)
    }
    
    private func randomBackground() -> Image {
        let randomIndex = Int.random(in: 0..<cardColors.count)
        let imageName = cardColors[randomIndex]
        return Image(imageName)
    }
}
    
struct ExpandedCardView: View {
        
        let triviaCard: TriviaCard
        let bgImageName: String
        let onClose: () -> Void
        
        var body: some View {
            VStack {
                Text(triviaCard.question)
                    .font(Font.custom("Mont-HeavyDEMO", size: 40))
                    .foregroundColor(.white)
                    .kerning(-1)
                    .padding()
                Text(triviaCard.correctAnswer)
                    .font(Font.custom("Mont-HeavyDEMO", size: 20))
                    .foregroundColor(.white)
                    .kerning(-1)
                    .padding()
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
            .background(Image(bgImageName))
            .cornerRadius(10)
            .padding()
            .onTapGesture {
                onClose()
            }
        }
        
}
