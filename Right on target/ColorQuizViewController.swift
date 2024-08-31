//
//  ColorQuizViewController.swift
//  Right on target
//
//  Created by Aleksei Frolov on 25.08.2024.
//

import UIKit

class ColorQuizViewController: UIViewController {
    
    var score: Int = 0
    var correctAnswerIndex = 0
    var buttons = [UIButton]()
    var rounds = 0
    var maxRounds = 5
    
    var generator: GeneratorProtocol! = Generator(startValue: 0, endValue: 4)
    var colorConverter: ColorConverterProtocol = ColorConverter()
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    @IBOutlet var buttonFour: UIButton!
    @IBOutlet var buttonFive: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons += [buttonOne, buttonTwo, buttonThree, buttonFour, buttonFive]
        startNewRound()
    }
    
    @IBAction func checkColor(_ sender: UIButton) {
        if sender.tag == correctAnswerIndex {
            score += 1
        }
        rounds += 1
        
        if rounds == maxRounds {
            showGameOverAlert()
        } else {
            startNewRound()
        }
        scoreLabel.text = "\(score)"
    }
    
    @IBAction func hideCurrentScene() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func startNewRound() {
        let randomColors = (0..<5).map { _ in generator.getRandomColor() }
        correctAnswerIndex = Int.random(in: 0..<5)
        
        let correctColor = randomColors[correctAnswerIndex]
        let correctHex = colorConverter.convertHexString(from: correctColor)
        
        questionLabel.text = "Guess the color with HEX: \(correctHex)"
        
        for (index, button) in buttons.enumerated() {
            button.backgroundColor = randomColors[index]
        }
    }
    
    private func showGameOverAlert() {
        AlertPresenter.shared.showAlert(on: self, title: "Game over", message: "You scored \(score) points") {
            self.restartGame()
            self.startNewRound()
            self.scoreLabel.text = "\(self.score)"
        }
    }
    
    private func restartGame() {
        rounds = 0
        score = 0
    }
}
