//
//  ColorQuizGame.swift
//  Right on target
//
//  Created by Aleksei Frolov on 31.08.2024.
//

import UIKit

protocol ColorQuizGameProtocol {
    var currentHexColor: String { get }
    var currentRound: GameRoundProtocol! { get }
    func checkAnswer(index: Int) -> Bool
    func getColorsForButtons() -> [UIColor]
}

final class ColorQuizGame: BaseGame, ColorQuizGameProtocol {
    var currentRound: GameRoundProtocol!
    private var colors: [UIColor] = []
    private var correctAnswerIndex: Int = 0
    private let dataGenerator: GeneratorProtocol
    private let colorConverter: ColorConverterProtocol
    
    var currentHexColor: String { colorConverter.convertHexString(from: colors[correctAnswerIndex]) }
    
    init(generator: GeneratorProtocol, converter: ColorConverterProtocol, rounds: Int) {
        dataGenerator = generator
        colorConverter = converter
        super.init(rounds: rounds)
        startNewRound()
    }
    
    override func startNewRound() {
        colors = dataGenerator.getUniqueColorsArray()
        correctAnswerIndex = dataGenerator.getRandomValue()
        currentRound = GameRound(secretValue: correctAnswerIndex)
        rounds.append(currentRound)
    }
    
    func checkAnswer(index: Int) -> Bool {
        if index == correctAnswerIndex {
            return true
        }
        return false
    }
    
    func getColorsForButtons() -> [UIColor] {
        return colors
    }
}
