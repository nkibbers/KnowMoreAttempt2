//
//  TriviaQuestionView.swift
//  KnowMoreAttempt2
//
//  Created by Rudra Parikh on 16/5/2024.
//

import SwiftUI

struct QuestionScreen: View {
    @EnvironmentObject var manager: QuizzoManager
    
    var body: some View {
        
        ZStack  {
            Image("whitebg")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text(manager.question)
                    .font(Font.custom("Mont-HeavyDEMO", size: 30))
                    .foregroundStyle(.kmBlack)
                    .multilineTextAlignment(.center)
                    .kerning(-1)
                    .padding()
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 2), spacing: 0) {
                    ForEach(manager.answerChoices, id: \.id) { answer in
                        AnswerButtons(answer: answer)
                        .frame(height: 200)
                    }
                }
                
                Spacer()
                
                Button {
                    manager.goToNextQuestion()
                } label: {
                    PrimaryButton(text: "Next", background:
                                    manager.answerSelected ? Color(.kmBlack) : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                }
                .disabled(!manager.answerSelected)
    
                Spacer()
            }
        }
    }
}



    
#Preview {
    QuestionScreen()
        .environmentObject(QuizzoManager())
}
