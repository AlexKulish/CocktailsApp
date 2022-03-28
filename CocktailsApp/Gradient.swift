//
//  Gradient.swift
//  CocktailsApp
//
//  Created by Alex Kulish on 28.03.2022.
//

import UIKit

class Gradient {
    
    static var shared = Gradient()
    private init() {}
    
    func getGradientLayer(bounds: CGRect) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.red, UIColor.purple]
        gradient.startPoint = CGPoint(x: 0.6, y: 1.4)
        gradient.endPoint = CGPoint(x: 1.1, y: 0.9)
        return gradient
    }
    
    func gradientColor(bounds: CGRect, gradientLayer: CAGradientLayer) -> UIColor {
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        guard let cgContext = UIGraphicsGetCurrentContext() else { return .white }
        gradientLayer.render(in: cgContext)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return .white }
        UIGraphicsEndImageContext()
        return UIColor(patternImage: image)
    }
    
}
