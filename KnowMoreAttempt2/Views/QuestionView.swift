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
                        AnswerView(answer: answer)
                            .environmentObject(manager)
                            .frame(height: 200)
                        //                            .background(colorForAnswer(answer))
                        //                            .border(Color.black, width: 1)
                    }
                }
                
                HStack {
                    Button(action: {
                        // Handle previous action
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.largeTitle)
                            .foregroundColor(.kmBlack)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        // Handle next action
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.largeTitle)
                            .foregroundColor(.kmBlack)
                    }
                    .padding()
                }
                .padding(.horizontal)
            }
        }
    }
    
}




struct TriviaQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(QuizManager())
    }
}
