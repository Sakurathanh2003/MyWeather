//
//  WeatherCell.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import UIKit

class WeatherCell: UICollectionViewCell {

    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var percentRainLabel: UILabel!
    @IBOutlet private weak var iconWeather: UIImageView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cornerRadius = self.frame.width / 2
        updateFontLabel()
    }

    func updateFontLabel() {
        timeLabel.font = UIFont(name: "SFProText-Semibold", size: 15)
        temperatureLabel.font = UIFont(name: "SFProDisplay-Regular", size: 20)
        percentRainLabel.font = UIFont(name: "SFProText-Semibold", size: 13)
    }
}
