//
//  AnswerView.swift
//  KnowMoreAttempt2
//
//  Created by Ved Ketan Dave on 17/5/2024.
//

import SwiftUI

struct AnswerButtons: View {
    @EnvironmentObject var manager: QuizzoManager
    var answer: Answer
    
    @State private var isSelected = false
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {
        Button {
            if !manager.answerSelected {
                isSelected = true
                manager.selectedAnswer(answer: answer)
            }
        } label: {
            ZStack {
                Image(manager.answerBgColor)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .clipped()
                ZStack {
                    Text(answer.text)
                        .font(.title3)
                        .fontWeight(.bold)
//                        .foregroundColor(.white) // Set a default color for safety
                        .overlay(
                            Image(manager.answerBgColor)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .blendMode(.overlay)
                                .clipped()
                                .mask(
                                    Text(answer.text)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                )
                        )
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .contentShape(Rectangle())
                    
                    if isSelected {
                        Image(systemName: answer.isCorrect ? "checkmark.circle" : "x.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .foregroundStyle(Color(answer.isCorrect ? green : red))
                            .opacity(0.4)                    }
                }
            }
            
        }
    }
}

