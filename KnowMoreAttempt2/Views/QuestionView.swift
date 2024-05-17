//
//  TriviaQuestionView.swift
//  KnowMoreAttempt2
//
//  Created by Rudra Parikh on 16/5/2024.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var manager: QuizManager
    
    @State private var selectedAnswer: String?
    
    var body: some View {
        VStack(spacing: 40) {
                    
                    HStack {
                        ProgressBar(progressValue: manager.progress)
                        
                        Text("\(manager.index + 1) / \(manager.length)")
                            .font(.system(size: 14))
                            .fontWeight(.light)
                            .foregroundStyle(Color(.lightGray))
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text(manager.question)
                            .font(.system(size: 22))
                            .foregroundStyle(Color(.black))
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        ForEach(manager.answerChoices, id: \.id) { answer in
                            AnswerField(answer: answer)
                                .environmentObject(manager)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        manager.nextQuestion()
                    } label: {
                        PrimaryButton(text: "Next", background:
                                        manager.isAnswerSelected ? Color("Green") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                    }
                    .disabled(!manager.isAnswerSelected)
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .background(Color("AccentColor"))
                .navigationBarHidden(true)
            }
    
}




struct TriviaQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(QuizManager())
    }
}
