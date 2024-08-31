//
//  GameRound.swift
//  Right on target
//
//  Created by Aleksei Frolov on 22.08.2024.
//

import Foundation

protocol GameRoundProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get }
    func increaseScore()
    func calculateScore(with: Int)
}

class GameRound: GameRoundProtocol {
    
    // MARK: - Properties
    
    var score: Int = 0
    var currentSecretValue: Int = 0
    
    // MARK: - Initialization
    
    init(secretValue: Int) {
        currentSecretValue = secretValue
    }
    
    // MARK: - Methods
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score = 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score = 50 - currentSecretValue + value
        } else {
            score = 50
        }
    }
    
    func increaseScore() {
        score += 1
    }
}
