//
//  Game.swift
//  Right on target
//
//  Created by Aleksei Frolov on 22.08.2024.
//

import Foundation

protocol GameProtocol {
    var score: Int { get }
    var secretValueGenerator: GeneratorProtocol { get }
    var currentRound: GameRoundProtocol! { get }
    var isGameEnded: Bool { get }
    
    func restartGame()
    func startNewRound()
}

class Game: GameProtocol {
    var score: Int {
        rounds.reduce(0) { $0 + $1.score }
    }
    var currentRound: GameRoundProtocol!
    private var rounds: [GameRoundProtocol] = []
    var secretValueGenerator: GeneratorProtocol
    private var roundsCount: Int!
    
    var isGameEnded: Bool {
        roundsCount == rounds.count
    }
    
    init(valueGenerator: GeneratorProtocol, rounds: Int) {
        secretValueGenerator = valueGenerator
        roundsCount = rounds
        startNewRound()
    }
    
    func restartGame() {
        rounds = []
        startNewRound()
    }
    
    func startNewRound() {
        let newSecretValue = self.getNewSecretValue()
        currentRound = GameRound(secretValue: newSecretValue)
        rounds.append(currentRound)
    }
    
    private func getNewSecretValue() -> Int {
        secretValueGenerator.getRandomValue()
    }
}
