//
//  ColorQuizViewController.swift
//  Right on target
//
//  Created by Aleksei Frolov on 25.08.2024.
//

import UIKit

class ColorQuizViewController: UIViewController {
    
    var game: ColorQuizGameProtocol!
    var buttons = [UIButton]()
    
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
        
        buttonOne.tag = 0
        buttonTwo.tag = 1
        buttonThree.tag = 2
        buttonFour.tag = 3
        buttonFive.tag = 4
        
        let generator = Generator(startValue: 0, endValue: 4)!
        let converter = ColorConverter()
        game = ColorQuizGame(generator: generator, converter: converter, rounds: 10)
        
        updateQuestionLabel()
        updateButtonsColor()
    }
    
    @IBAction func checkColor(_ sender: UIButton) {
        let isCorrect = game.checkAnswer(index: sender.tag)
        if isCorrect {
            updateScoreLabel()
        }
        
        if game.isGameEnded {
            showGameOverAlert()
        } else {
            game.startNewRound()
            updateQuestionLabel()
            updateButtonsColor()
        }
    }
    
    @IBAction func hideCurrentScene() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func updateButtonsColor() {
        let colors = game.getColorsForButtons()
        for(index, button) in buttons.enumerated() {
            button.backgroundColor = colors[index]
        }
    }
    
    private func updateQuestionLabel() {
        questionLabel.text = "Guess the color with HEX: \(game.currentHexColor)"
    }
    
    private func updateScoreLabel() {
        scoreLabel.text = "\(game.score)"
    }
    
    private func showGameOverAlert() {
        AlertPresenter.shared.showAlert(on: self, title: "Game over", message: "You scored \(game.score) points") {
            self.game.restartGame()
            self.updateQuestionLabel()
            self.updateButtonsColor()
            self.updateScoreLabel()
        }
    }
}
