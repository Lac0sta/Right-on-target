//
//  AlertPresenter.swift
//  Right on target
//
//  Created by Aleksei Frolov on 28.08.2024.
//

import UIKit

class AlertPresenter {
    
    static let shared = AlertPresenter()
    
    private init() {}
    
    func showAlert(on viewController: UIViewController, title: String, message: String, buttonTitle: String = "OK", handler: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default) { _ in
            handler?()
        }
        
        alert.addAction(action)
        viewController.present(alert, animated: true, completion: nil)
    }
}
