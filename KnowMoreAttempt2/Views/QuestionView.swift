//
//  TriviaQuestionView.swift
//  KnowMoreAttempt2
//
//  Created by Rudra Parikh on 16/5/2024.
//

import SwiftUI

struct QuestionScreen: View {
    @EnvironmentObject var manager: QuizzoManager
    let colors = ["yellowbg", "purplebg", "lightbluebg", "orangebg"]
    
    var body: some View {
        ZStack {
            Image("whitebg")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    ProgressBar(progressValue: manager.progress)
                    
                    Text("\(manager.index + 1) / \(manager.length)")
                        .font(.system(size: 14))
                        .fontWeight(.light)
                        .foregroundStyle(Color(.lightGray))
                }
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                Text(manager.question)
                    .font(Font.custom("Mont-HeavyDEMO", size: 24))
                    .foregroundStyle(.kmBlack)
                    .multilineTextAlignment(.leading)
                    .kerning(-1)
                    .padding()
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 2), spacing: 0) {
                    ForEach(Array(zip(manager.answerChoices, answerChoiceColors())), id: \.0.id) { answer, color in
                        AnswerButtons(answer: answer)
                            .background(Image(color).resizable())
                            .foregroundStyle(Color(.kmBlack))
//                            .font
                            .frame(height: 200)
                    }
                }
                
                Button {
                    manager.goToNextQuestion()
                } label: {
                    PrimaryButton(text: "Next", background:
                        manager.answerSelected ? Color(.kmBlack) : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                }
                .disabled(!manager.answerSelected)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
    
    func answerChoiceColors() -> [String] {
        let answerCount = manager.answerChoices.count
        return Array(repeating: colors, count: answerCount).flatMap { $0 }
        
        
//        func questionColors() -> [String] {
//            let numberOfColors = min(quizzoManager.playedQuestions.count, colors.count)
//            return Array(repeating: colors, count: numberOfColors).flatMap { $0 }
        
    }
}

#Preview {
    QuestionScreen()
        .environmentObject(QuizzoManager())
}
