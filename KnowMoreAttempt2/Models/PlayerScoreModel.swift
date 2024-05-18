//
//  PlayerScoreModel.swift
//  KnowMoreAttempt2
//
//  Created by Ved Ketan Dave on 18/5/2024.
//

import Foundation

struct PlayerScore: Codable, Identifiable {
    var id = UUID()
    var name: String
    var score: Int
}
