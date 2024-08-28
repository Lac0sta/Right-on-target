//
//  InitialViewController.swift
//  Right on target
//
//  Created by Aleksei Frolov on 25.08.2024.
//

import UIKit

class InitialViewController: UIViewController {
    
    @IBAction func showNumberQuizViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NumberQuizViewController")
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func showColorQuizViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ColorQuizViewController")
        self.present(viewController, animated: true, completion: nil)
    }
}
