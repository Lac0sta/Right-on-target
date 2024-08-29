//
//  ColorConverter.swift
//  Right on target
//
//  Created by Aleksei Frolov on 29.08.2024.
//

import UIKit

protocol ColorConverterProtocol {
    func convertHexString(from color: UIColor) -> String
}

class ColorConverter: ColorConverterProtocol {
    
    func convertHexString(from color: UIColor) -> String {
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
