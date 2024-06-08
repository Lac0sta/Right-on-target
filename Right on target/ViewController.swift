//
//  ViewController.swift
//  Right on target
//
//  Created by Aleksei Frolov on 08.06.2024.
//

import UIKit

class ViewController: UIViewController {

    var number: Int = 0
    var round: Int = 0
    var points: Int = 0
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    @IBAction func checkNumber() {
        if round == 0 {
            number = Int.random(in: 1...50)
            label.text = String(number)
            round = 1
        } else {
            let numSlider = Int(slider.value.rounded())
            if numSlider > number {
                points += 50 - numSlider + number
            } else if numSlider < number {
                points += 50 - number + numSlider
            } else {
                points += 50
            }
            if round == 5 {
                let alert = UIAlertController(
                    title: "Game over",
                    message: "You earned \(points) points",
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Try again",
                                              style: .default,
                                              handler: nil))
                present(alert, animated: true, completion: nil)
                round = 1
                points = 0
            } else {
                round += 1
            }
            number = Int.random(in: 1...50)
            label.text = String(number)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

