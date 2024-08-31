//
//  Generator.swift
//  Right on target
//
//  Created by Aleksei Frolov on 22.08.2024.
//

import UIKit

protocol GeneratorProtocol {
    func getRandomValue() -> Int
    func getRandomColor() -> UIColor
    func getUniqueColorsArray() -> [UIColor]
}

class Generator: GeneratorProtocol {
    private var minBorderValue: Int
    private var maxBorderValue: Int
    
    init?(startValue: Int, endValue: Int) {
        guard startValue <= endValue else {
            return nil
        }
        minBorderValue = startValue
        maxBorderValue = endValue
    }
    
    func getRandomValue() -> Int {
        (minBorderValue...maxBorderValue).randomElement()!
    }
    
    func getRandomColor() -> UIColor {
        UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0)
    }
    
    func getUniqueColorsArray() -> [UIColor] {
        var uniqueColors = [UIColor]()
        
        while uniqueColors.count < 5 {
            let color = getRandomColor()
            
            if !uniqueColors.contains(where: { $0.isEqual(color) }) {
                uniqueColors.append(color)
            }
        }
        return uniqueColors
    }
}
