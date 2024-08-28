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
        scoreLabel.text = "\(score)"
        startNewRound()
    }
    
    @IBAction func hideCurrentScene() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func startNewRound() {
        let randomColors = (0..<5).map { _ in generateRandomColor() }
        correctAnswerIndex = Int.random(in: 0..<5)
        
        let correctColor = randomColors[correctAnswerIndex]
        let correctHex = hexString(from: correctColor)
        
        questionLabel.text = "Guess the color with HEX: \(correctHex)"
        
        for (index, button) in buttons.enumerated() {
            button.backgroundColor = randomColors[index]
        }
    }
    
    private func generateRandomColor() -> UIColor {
        return UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0)
    }
    
    private func hexString(from color: UIColor) -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let r = Int(red * 255)
        let g = Int(green * 255)
        let b = Int(blue * 255)
        
        return String(format: "#%02X%02X%02X", r, g, b)
    }
}
