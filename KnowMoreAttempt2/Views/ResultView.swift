//
//  ResultView.swift
//  KnowMoreAttempt2
//
//  Created by Ved Ketan Dave on 17/5/2024.
//

import SwiftUI

struct ResultScreen: View {
    @EnvironmentObject var manager: QuizzoManager
    
    
    var body: some View {
        if manager.reachedEnd {
            VStack(spacing: 30) {
                
                Image("Result_Illustration")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 143.78, height: 151.11)
                
                Text("Results of the Quiz")
                    .font(.system(size: 22, weight: .bold))
                    .multilineTextAlignment(.center)
                

                VStack {
                    ResultCardView(card: CardData(title: "TOTAL QUESTIONS", value: manager.length))
                    ResultCardView(card: CardData(title: "CORRECT QUESTIONS", value: manager.score))
                }
                
                Spacer()
                
                Button {
                    Task.init {
                        await manager.fetchQuestion()
                    }
                } label: {
                    PrimaryButton(text: "Play Again")
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("AccentColor"))
            .navigationBarHidden(true)
        } else {
            QuestionScreen()
                .environmentObject(manager)
        }
    }
}

#Preview {
    ResultScreen()
        .environmentObject(QuizzoManager())
}
