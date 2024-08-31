//
//  ColorQuizGame.swift
//  Right on target
//
//  Created by Aleksei Frolov on 31.08.2024.
//

import UIKit

protocol ColorQuizGameProtocol {
    var score: Int { get }
    var currentHexColor: String { get }
    var isGameEnded: Bool { get }
    
    func startNewRound()
    func restartGame()
    func checkAnswer(index: Int) -> Bool
    func getColorsForButtons() -> [UIColor]
}

final class ColorQuizGame: ColorQuizGameProtocol {
    private(set) var score: Int = 0
    private var roundsCount: Int
    private var currentRound: Int = 0
    private var colors: [UIColor] = []
    private var correctAnswerIndex: Int = 0
    private let dataGenerator: GeneratorProtocol
    private let colorConverter: ColorConverterProtocol
    
    var currentHexColor: String { colorConverter.convertHexString(from: colors[correctAnswerIndex]) }
    
    var isGameEnded: Bool { currentRound >= roundsCount }
    
    init(generator: GeneratorProtocol, converter: ColorConverterProtocol, rounds: Int) {
        dataGenerator = generator
        colorConverter = converter
        roundsCount = rounds
        startNewRound()
    }
    
    func startNewRound() {
        colors = dataGenerator.getUniqueColorsArray()
        correctAnswerIndex = dataGenerator.getRandomValue()
        currentRound += 1
    }
    
    func restartGame() {
        score = 0
        currentRound = 0
        startNewRound()
    }
    
    func checkAnswer(index: Int) -> Bool {
        if index == correctAnswerIndex {
            score += 1
            return true
        }
        return false
    }
    
    func getColorsForButtons() -> [UIColor] {
        return colors
    }
}
