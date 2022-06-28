//
//  WeatherWidgeCell.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import UIKit

class WeatherWidgeCell: UICollectionViewCell {
    
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var maxMinLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindData(viewModel: ListWeatherItemViewModel) {
        tempLabel.text = viewModel.getTempCurrent() + "°"
        maxMinLabel.text = "H:\(Int(viewModel.getMaxTemp()))°   L:\(Int(viewModel.getMinTemp()))°"
        locationLabel.text = viewModel.getNameLocation()
        descriptionLabel.text = viewModel.getDescription()
        
        if let image = viewModel.getImageThumnail() {
            thumnail.image = image
        }
    }

}
