//
//  AnswerView.swift
//  KnowMoreAttempt2
//
//  Created by Ved Ketan Dave on 17/5/2024.
//

import SwiftUI

struct AnswerView: View {
    
    @EnvironmentObject var manager: QuizManager
    var answer: Answer

    @State private var isSelected = false
    
    var body: some View {
        Button(action: {
            isSelected = true
            manager.selectedAnswer(answer: answer)
        }) {
            ZStack {
                Image("yellowbg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .clipped()
                TextOverlay(answer: answer, fgImageName: "orangebg")
            }
        }
    }
}

struct TextOverlay: View {
    let answer: Answer
    let fgImageName: String

    var body: some View {
        Text(answer.text)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.white) // Set a default color for safety
            .overlay(
                Image(fgImageName)
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
            .contentShape(Rectangle()) // Make the entire frame tappable
    }
}


#Preview {
    AnswerView(answer: Answer(text: "Question", isCorrect: false))
        .environmentObject(QuizManager())
}
