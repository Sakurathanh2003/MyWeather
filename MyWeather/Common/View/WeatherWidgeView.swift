//
//  WeatherWidgeView.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import Foundation
import UIKit

@IBDesignable
class WeatherWidgeView: UIView {
    
    @IBInspectable var color: UIColor = .black
    var path = UIBezierPath()

    
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.clipsToBounds = true
        drawPath()
    }
    
    func drawPath() {
        path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: self.frame.height / 4))
        path.addCurve(to: CGPoint(x: self.frame.width , y: self.frame.height / 2),
                      controlPoint1: CGPoint(x: 10, y: -40),
                      controlPoint2: CGPoint(x: self.frame.width * 2 / 4, y: self.frame.height / 2))
        
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height - 20))
        
        path.addQuadCurve(to: CGPoint(x: self.frame.width - 20, y: self.frame.height),
                          controlPoint: CGPoint(x: self.frame.width, y: self.frame.height))
        
        path.addLine(to: CGPoint(x: 20, y: self.frame.height))
        
        path.addQuadCurve(to: CGPoint(x: 0, y: self.frame.height - 20),
                          controlPoint: CGPoint(x: 0, y: self.frame.height))
        
        path.addLine(to: CGPoint(x: 0, y: self.frame.height / 4))
        
        color.setFill()
        path.fill()
    }
}

