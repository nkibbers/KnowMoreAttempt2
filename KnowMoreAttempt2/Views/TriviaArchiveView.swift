//
//  TriviaArchiveView.swift
//  KnowMoreAttempt2
//
//  Created by Rudra Parikh on 17/5/2024.
//

import SwiftUI

struct TriviaArchiveView: View {
    @ObservedObject var quizzoManager: QuizzoManager
    let colors = ["tangerinebg", "lightbluebg", "yellowbg", "purplebg", "orangebg"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("whitebg")
                    .resizable()
                    .ignoresSafeArea()
                VStack (alignment: .leading) {
                    Image("blackbg")
                        .resizable()
                        .frame(width: 300, height: 100)
                        .mask {
                            Text("archive")
                                .font(Font.custom("Mont-HeavyDEMO", size: 64))
                                .foregroundColor(.white)
                                .kerning(-1)
                        }
                        .padding(.top, 50)
                    
                    ScrollView {
                        ForEach(Array(zip(quizzoManager.playedQuestions, questionColors())), id: \.0.id) { question, color in
                            VStack(alignment: .leading) {
                                Text(question.formattedQuestion)
                                    .font(Font.custom("Mont-HeavyDEMO", size: 16))
                                    .kerning(1.2)
                                    .lineSpacing(5)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                ForEach(question.answer) { answer in
                                    if (answer.isCorrect) {
                                        Text(answer.text)
                                            .font(.subheadline)
                                            .padding()
                                    }
                                }
                            }
                            .background(Image(color).resizable())
                            .padding(.horizontal, 20.0)
                        }
                    }
                    .frame(width: .infinity)
                }
            }
        }
    }
    
    func questionColors() -> [String] {
        let numberOfColors = min(quizzoManager.playedQuestions.count, colors.count)
        return Array(repeating: colors, count: numberOfColors).flatMap { $0 }
    }
}



#Preview {
    TriviaArchiveView(quizzoManager: QuizzoManager())
}
