//
//  TriviaArchiveView.swift
//  KnowMoreAttempt2
//
//  Created by Rudra Parikh on 17/5/2024.
//

import SwiftUI

struct TriviaArchiveView: View {
    @ObservedObject var quizzoManager: QuizzoManager
    let colors = ["tangeringbg", "lightbluebg", "yellowbg", "purplebg", "orangebg"]
    @State var index = 0
    
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
                        ForEach(quizzoManager.playedQuestions, id: \.id) {question in
                            VStack(alignment: .leading) {
                                Text(question.formattedQuestion)
                                    .font(.headline)
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
                            .background(Image(assignColor()).resizable())
                            .padding(.horizontal, 20.0)
                        }
                    }
                    .frame(width: .infinity)
                }
//                .navigationTitle("Archive")
            }
        }
    }
    
    func assignColor() -> String {
        if(index < 5) {
            index = 0
        } else {
            index += 1
        }
        print(colors[index])
        return colors[index]
    }
}


#Preview {
    TriviaArchiveView(quizzoManager: QuizzoManager())
}
