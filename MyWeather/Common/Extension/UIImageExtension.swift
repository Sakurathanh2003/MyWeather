//
//  UIImageExtension.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import Foundation
import UIKit

extension UIImage {
    func gradientImage(bounds: CGRect, colors: [UIColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)
        let renderer = UIGraphicsImageRenderer(bounds: bounds)

        return renderer.image { ctx in
            gradientLayer.render(in: ctx.cgContext)
        }
    }
}
