//
//  NumberQuizGame.swift
//  Right on target
//
//  Created by Aleksei Frolov on 22.08.2024.
//

import Foundation

protocol NumberQuizGameProtocol {
    var secretValueGenerator: GeneratorProtocol { get }
    var currentRound: GameRoundProtocol! { get }
}

final class NumberQuizGame: BaseGame, NumberQuizGameProtocol {
    var currentRound: GameRoundProtocol!
    var secretValueGenerator: GeneratorProtocol
    
    init(valueGenerator: GeneratorProtocol, rounds: Int) {
        secretValueGenerator = valueGenerator
        super.init(rounds: rounds)
        startNewRound()
    }
    
    override func startNewRound() {
        guard let newSecretValue = self.getNewSecretValue() else {
            return
        }
        currentRound = GameRound(secretValue: newSecretValue)
        rounds.append(currentRound)
    }
    
    private func getNewSecretValue() -> Int? {
        let value = secretValueGenerator.getRandomValue()
        return value
    }
}
