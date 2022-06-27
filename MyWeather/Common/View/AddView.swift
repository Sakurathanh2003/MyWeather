//
//  AddView.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import UIKit

@IBDesignable
class AddView: UIView {
    
    @IBInspectable var color: UIColor = .clear
    @IBInspectable var colorBackground: UIColor = .clear
    var path = UIBezierPath()
    var colorView = UIBezierPath()

    
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.clipsToBounds = true
        drawColorVieW()
        drawPath()
    }
    
    func drawColorVieW() {
        colorView = UIBezierPath()
        
        colorView.move(to: CGPoint(x: 0, y: self.frame.height))
        colorView.addCurve(to: CGPoint(x: self.frame.width / 2, y: 2),
                      controlPoint1: CGPoint(x: self.frame.width / 3, y: self.frame.height),
                      controlPoint2: CGPoint(x: self.frame.width / 6, y: 0))
        
        colorView.move(to: CGPoint(x: self.frame.width / 2, y: 2))
        colorView.addCurve(to: CGPoint(x: self.frame.width, y: self.frame.height),
                      controlPoint1: CGPoint(x: self.frame.width - self.frame.width / 6, y: 0),
                      controlPoint2: CGPoint(x: self.frame.width - self.frame.width / 3, y: self.frame.height))
        
        colorView.addLine(to: CGPoint(x: 0, y: self.frame.height))
        colorBackground.setFill()
        colorView.fill()
    }
    
    func drawPath() {
        path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: self.frame.height))
        path.addCurve(to: CGPoint(x: self.frame.width / 2, y: 2),
                      controlPoint1: CGPoint(x: self.frame.width / 3, y: self.frame.height),
                      controlPoint2: CGPoint(x: self.frame.width / 6, y: 0))
        
        path.move(to: CGPoint(x: self.frame.width / 2, y: 2))
        path.addCurve(to: CGPoint(x: self.frame.width, y: self.frame.height),
                      controlPoint1: CGPoint(x: self.frame.width - self.frame.width / 6, y: 0),
                      controlPoint2: CGPoint(x: self.frame.width - self.frame.width / 3, y: self.frame.height))
        
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        color.setStroke()
        path.stroke()
    }
    
    func getColorBackground() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.blurView(alpha: 0.5, style: .dark)
        let gradient = UIImage().gradientImage(bounds: view.bounds, colors: [colorBackground])
        view.backgroundColor = UIColor(patternImage: gradient)
    }
}
