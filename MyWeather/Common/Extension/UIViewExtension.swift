//
//  UIViewExtension.swift
//  custom
//
//  Created by Vu Thanh on 20/06/2022.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
        
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            self.layer.borderColor = newValue?.cgColor
        }
        
        get {
            guard let cgcolor = self.layer.borderColor else {
                return nil
            }
            
            return UIColor.init(cgColor: cgcolor)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        
        get {
            return self.layer.borderWidth
        }
    }
    
    func fitSuperviewConstraint(edgeInset: UIEdgeInsets = .zero) {
       self.translatesAutoresizingMaskIntoConstraints = false
       let superview = self.superview!
       self.topAnchor.constraint(equalTo: superview.topAnchor, constant: edgeInset.top).isActive = true
       self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: edgeInset.left).isActive = true
       self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -edgeInset.right).isActive = true
       self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -edgeInset.bottom).isActive = true
   }
}

extension UIView {
    func blurView(alpha: CGFloat, style: UIBlurEffect.Style) {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = alpha
        self.insertSubview(blurEffectView, at: 0)
        blurEffectView.fitSuperviewConstraint()
    }
}
