//
//  QuizManager.swift
//  KnowMoreAttempt2
//
//  Created by Ved Ketan Dave on 17/5/2024.
//

import Foundation
import SwiftUI

class QuizManager: ObservableObject {
    
    private(set) var trivia: [Question.Result] = []
    
    @Published private(set) var index = 0
    @Published private(set) var length = 0
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var isAnswerSelected = false
    @Published private(set) var hasReachedEnd = false
    @Published private(set) var progress: CGFloat = 0.0
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var score = 0
    
    init() {
        Task.init {
            await fetchQuestions()
        }
    }
    
    func fetchQuestions() async {
        guard let url = URL(string: "https:opentdb.com/api.php?amount=5")
        else {
            fatalError("Bad url")
        }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                fatalError("Bad api call")
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Question.self, from: data)
            
            DispatchQueue.main.async {
                self.trivia = decodedData.results
                self.length = self.trivia.count
            }
        } catch {
            print("Error while fetching questions")
        }
    }
    
    func showQuestion() {
        self.isAnswerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 310)
        
        if index < length {
            let currentQuestion = trivia[index]
            question = currentQuestion.formattedQuestion
            answerChoices = currentQuestion.answer
        }
    }
    
    func nextQuestion() {
        if index+1 < length {
            index += 1
            self.showQuestion()
        } else {
            hasReachedEnd = true
        }
    }
    
    func selectedAnswer(answer: Answer) {
        isAnswerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
