//
//  BaseGame.swift
//  Right on target
//
//  Created by Aleksei Frolov on 31.08.2024.
//

import Foundation

protocol BaseGameProtocol {
    var score: Int { get }
    var isGameEnded: Bool { get }
    var rounds: [GameRoundProtocol] { get }
    
    func restartGame()
    func startNewRound()
}

class BaseGame: BaseGameProtocol {
    var score: Int { rounds.reduce(0) { $0 + $1.score } }
    var isGameEnded: Bool { roundsCount == rounds.count }
    var rounds: [GameRoundProtocol] = []
    private var roundsCount: Int!
    
    init(rounds: Int) {
        roundsCount = rounds
    }
    
    func restartGame() {
        rounds = []
        startNewRound()
    }
    
    @objc func startNewRound() {
        fatalError("This method must be overridden by a subclass")
    }
}
