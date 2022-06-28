//
//  ListWeatherViewController.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import UIKit

private struct Const {
    static let ratioCell: CGFloat = 324 / 184
}

class ListWeatherViewController: UIViewController {
    
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    
    var viewModel = ListWeatherViewModel.makeEmpty()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        config()
        for haha in viewModel.weatherDays {
            print(haha.location.name)
        }
    }
    
    private func config() {
        configCollectionView()
    }
    
    private func configCollectionView() {
        weatherCollectionView.registerCell(type: WeatherWidgeCell.self)
        weatherCollectionView.contentInset = UIEdgeInsets(top: 0, left: 27, bottom: 0, right: 27)
        weatherCollectionView.delegate = self
        weatherCollectionView.dataSource = self
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ListWeatherViewController: UICollectionViewDelegate {
    
}

extension ListWeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueCell(type: WeatherWidgeCell.self, indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        
        let item = viewModel.itemAt(index: indexPath.row)
        cell.bindData(viewModel: item)
        
        return cell
    }
}

extension ListWeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 27 * 2
        return CGSize(width: width , height: width / Const.ratioCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}


