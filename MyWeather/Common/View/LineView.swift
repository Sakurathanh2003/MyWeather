//
//  LineView.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import UIKit

@IBDesignable
class LineView: UIView {
    @IBInspectable var color: UIColor = .clear
    
    var path = UIBezierPath()

    
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.clipsToBounds = true
        drawPath()
    }
    
    func drawPath() {
        path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: self.frame.width, y: 0),
                          controlPoint: CGPoint(x: self.frame.width / 2, y: self.frame.height / 1.5))
        color.setStroke()
        path.stroke()
    }


}
