//
//  HighScoreViewModel.swift
//  KnowMoreAttempt2
//
//  Created by Ved Ketan Dave on 18/5/2024.
//

import Foundation

import Foundation

class HighScoreViewModel: ObservableObject {
    @Published var playerScores: [PlayerScoreModel] = []
    
    var highScore: Int {
        playerScores.map { $0.score }.max() ?? 0
    }
    
    var encryptionKey = "savedScores"
    
    init() {
        decodeScores()
    }
    
    //append a score or update a score
    func saveScore(name: String, score: Int) {
        if let index = playerScores.firstIndex(where: { $0.name == name && $0.score < score }) {
            //update the score of an old player in the scoreboard
            playerScores[index].score = score
        } else if playerScores.firstIndex(where: { $0.name == name }) == nil {
            playerScores.append(PlayerScoreModel(name: name, score: score))
        }
        encodeScores()
        decodeScores()
    }
    
    //encoder function
    func encodeScores() {
        if let encodedScores = try? JSONEncoder().encode(playerScores) {
            UserDefaults.standard.set(encodedScores, forKey: encryptionKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    //decoder function
    func decodeScores() {
        if let savedScores = UserDefaults.standard.data(forKey: encryptionKey),
           let decodedScores = try? JSONDecoder().decode([PlayerScoreModel].self, from: savedScores) {
            playerScores = decodedScores
        }
    }
}
