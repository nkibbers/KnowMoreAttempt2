//
//  AnswerField.swift
//  KnowMoreAttempt2
//
//  Created by Ved Ketan Dave on 17/5/2024.
//

import SwiftUI

struct AnswerField: View {
    @EnvironmentObject var manager: QuizManager
    var answer: Answer
    
    @State private var isSelected = false
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {
        if #available(iOS 17.0, *) {
            HStack(spacing: 30) {
                Image(systemName: "circle")
                    .font(.caption)
                
                Text(answer.text)
                    .font(.system(size: 18))
                    .foregroundStyle(Color(.black))
                
                    .bold()
                
                if isSelected {
                    Spacer()
                    
                    Image(systemName: answer.isCorrect ? "checkmark.circle" : "x.circle")
                        .foregroundStyle(Color(answer.isCorrect ? green : red))
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(Color(manager.isAnswerSelected ? (isSelected ? Color(.lightGray) : .gray): Color(.lightGray)))
            .background(.white)
            .cornerRadius(10)
            .shadow(color: isSelected ? (answer.isCorrect ? green : red) : .gray ,radius: 5)
            .onTapGesture {
                if !manager.isAnswerSelected {
                    isSelected = true
                    manager.selectedAnswer(answer: answer)
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    AnswerField(answer: Answer(text: "Question", isCorrect: false))
        .environmentObject(QuizManager())
}
