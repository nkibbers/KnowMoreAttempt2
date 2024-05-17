//
//  TriviaQuestionView.swift
//  KnowMoreAttempt2
//
//  Created by Ved Ketan Dave on 17/5/2024.
//

import SwiftUI

struct TriviaQuestionView: View {
    let question: String
    let answers: [String]
    @State private var selectedAnswer: String?
    
    var body: some View {
        ZStack  {
            Image("whitebg")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text(question)
                    .font(Font.custom("Mont-HeavyDEMO", size: 30))
                    .foregroundStyle(.kmBlack)
                    .multilineTextAlignment(.center)
                    .kerning(-1)
                    .padding()
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 2), spacing: 0) {
                    ForEach(answers, id: \.self) { answer in
                        AnswerButton(answer: answer, bgImageName: imageForAnswer(answer),
                                     fgImageName: foregroundImageForAnswer(answer))
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
    
    func imageForAnswer(_ answer: String) -> String {
        switch answer {
        case "Taylor Swift":
            return "yellowbg"
        case "Rudra Parikh":
            return "purplebg"
        case "Albert Einstein":
            return "lightbluebg"
        case "Wesley Hahn":
            return "brownbg"
        default:
            return "blackbg"
        }
    }
    
    func foregroundImageForAnswer(_ answer: String) -> String {
        switch answer {
        case "Taylor Swift":
            return "orangebg"
        case "Rudra Parikh":
            return "greenbg"
        case "Albert Einstein":
            return "tangerinebg"
        case "Wesley Hahn":
            return "yellowbg"
        default:
            return "defaultText"
        }
    }
}

struct AnswerButton: View {
    let answer: String
    let bgImageName: String
    let fgImageName: String

    var body: some View {
        Button(action: {
            // Handle answer selection
        }) {
            ZStack {
                Image(bgImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .clipped()
                TextOverlay(answer: answer, fgImageName: fgImageName)
            }
        }
    }
}

struct TextOverlay: View {
    let answer: String
    let fgImageName: String

    var body: some View {
        Text(answer)
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
                        Text(answer)
                            .font(.title3)
                            .fontWeight(.bold)
                    )
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(Rectangle()) // Make the entire frame tappable
    }
}

struct TriviaQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaQuestionView(
            question: "Who was the original author of Frankenstein?",
            answers: ["Taylor Swift", "Rudra Parikh", "Albert Einstein", "Wesley Hahn"]
        )
    }
}
