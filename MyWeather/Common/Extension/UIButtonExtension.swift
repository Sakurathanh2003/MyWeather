//
//  UIButtonExtension.swift
//  custom
//
//  Created by Vu Thanh on 26/06/2022.
//

import Foundation
import UIKit

extension UIButton {
    func shakeAnimation() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: self.frame.midX - 5, y: self.frame.midY)
        animation.toValue = CGPoint(x: self.frame.midX + 5, y: self.frame.midY)
        animation.duration = 0.2
        animation.repeatCount = 5
        animation.autoreverses = true
        self.layer.add(animation, forKey: nil)
    }
    
    func fadeAnimation() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 5
        animation.autoreverses = true
        self.layer.add(animation, forKey: nil)
    }
    
    func scaleAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1
        animation.toValue = 2
        animation.duration = 3
        animation.autoreverses = true
        self.layer.add(animation, forKey: nil)
    }
}
