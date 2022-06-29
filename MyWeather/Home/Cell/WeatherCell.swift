//
//  WeatherCell.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import UIKit

// 48319D

class WeatherCell: UICollectionViewCell {

    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var percentRainLabel: UILabel!
    @IBOutlet private weak var iconWeather: UIImageView!
    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cornerRadius = self.frame.width / 2
        updateFontLabel()
        setShadow()
    }

    func updateFontLabel() {
        timeLabel.font = UIFont(name: "SFProText-Semibold", size: 15)
        temperatureLabel.font = UIFont(name: "SFProDisplay-Regular", size: 20)
        percentRainLabel.font = UIFont(name: "SFProText-Semibold", size: 13)
    }
    
    func setShadow() {
        
    }
    
    func bindData(viewModel: HomeItemViewModel, now: Bool) {
        temperatureLabel.text = "\(Int(viewModel.getTemp()))" + "°"
        timeLabel.text = viewModel.getTime()
        
        if now {
            timeLabel.text = "Now"
            mainView.backgroundColor = UIColor(rgb: 0x48319D)
        } else {
            mainView.backgroundColor = UIColor(rgb: 0x48319D).withAlphaComponent(0.2)
        }
        
        if let image = viewModel.getThumnail() {
            iconWeather.image = image
        }
    }
}
