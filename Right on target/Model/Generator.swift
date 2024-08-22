//
//  Generator.swift
//  Right on target
//
//  Created by Aleksei Frolov on 22.08.2024.
//

import Foundation

protocol GeneratorProtocol {
    func getRandomValue() -> Int
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
}
