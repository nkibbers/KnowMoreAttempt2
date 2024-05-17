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
                    .font(Font.custom("Mont-HeavyDEMO", size: 30))
                    .foregroundStyle(.kmBlack)
                    .multilineTextAlignment(.center)
                    .kerning(-1)
                    .padding()
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 2), spacing: 0) {
                    ForEach(manager.answerChoices, id: \.id) { answer in
                        AnswerButtons(answer: answer)
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
}



    
#Preview {
    QuestionScreen()
        .environmentObject(QuizzoManager())
}
