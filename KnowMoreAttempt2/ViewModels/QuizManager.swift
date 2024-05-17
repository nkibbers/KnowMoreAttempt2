//
//  QuizManager.swift
//  KnowMoreAttempt2
//
//  Created by Ved Ketan Dave on 17/5/2024.
//

import Foundation
import SwiftUI

class QuizzoManager: ObservableObject {
    
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.0
    @Published private(set) var score = 0
    @Published var playedQuestions: [Trivia.Result] = []
    
    private let userDefaultsKey = "playedQuestions"
    
    init() {
        loadPlayedQuestions()
        Task.init {
            await fetchQuestion()
        }
    }
    
    func fetchQuestion() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=5")
        else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                fatalError("Error while fetching data")
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Trivia.self, from: data)
            
            DispatchQueue.main.async {
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
                
            }
        } catch {
            print("Error while fetching questions: \(error)")
        }
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 310)
        
        if index < length {
            let currentQuestion = trivia[index]
            question = currentQuestion.formattedQuestion
            answerChoices = currentQuestion.answer
            
            // Archive the played question
            playedQuestions.append(currentQuestion)
            savePlayedQuestions()
        }
    }
    
    func selectedAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
    
    private func savePlayedQuestions() {
        do {
            let data = try JSONEncoder().encode(playedQuestions)
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        } catch {
            print("Unable to save played questions: \(error)")
        }
    }
    
    private func loadPlayedQuestions() {
            if let data = UserDefaults.standard.data(forKey: userDefaultsKey) {
                do {
                    playedQuestions = try JSONDecoder().decode([Trivia.Result].self, from: data)
                } catch {
                    print("Unable to load played questions: \(error)")
                }
            }
        }
    
    
}
