//
//  NumberQuizViewController.swift
//  Right on target
//
//  Created by Aleksei Frolov on 08.06.2024.
//

import UIKit

class NumberQuizViewController: UIViewController {
    
    var game: NumberQuizGame!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let generator = Generator(startValue: 1, endValue: 50)!
        game = NumberQuizGame(valueGenerator: generator, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    @IBAction func hideCurrentScene() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Interaction between View and Model
    
    @IBAction func checkNumber() {
        game.currentRound.calculateScore(with: Int(slider.value))
        if game.isGameEnded {
            showGameOverAlert()
        } else {
            game.startNewRound()
            updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
        }
    }
    
    // MARK: - Updating View
    
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
    
    private func showGameOverAlert() {
        AlertPresenter.shared.showAlert(on: self, title: "Game over", message: "You scored \(game.score) points") {
            self.game.restartGame()
            self.updateLabelWithSecretNumber(newText: String(self.game.currentRound.currentSecretValue))
        }
    }
}
