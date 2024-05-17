//
//  TriviaArchiveView.swift
//  KnowMoreAttempt2
//
//  Created by Rudra Parikh on 17/5/2024.
//

import SwiftUI

struct TriviaArchiveView: View {
    @ObservedObject var quizzoManager: QuizzoManager
    
    var body: some View {
        NavigationView {
            List(quizzoManager.playedQuestions, id: \.id) { question in
                VStack(alignment: .leading, spacing: 10) {
                    Text(question.formattedQuestion)
                        .font(.headline)
                    ForEach(question.answer) { answer in
                        if (answer.isCorrect) {
                            Text(answer.text)
                                .font(.subheadline)
//                                .foregroundColor(answer.isCorrect ? .green : .primary)
                        }
                        
                    }
                }
                .padding()
            }
            .navigationTitle("Archived Questions")
        }
    }
}


#Preview {
    TriviaArchiveView(quizzoManager: QuizzoManager())
}
