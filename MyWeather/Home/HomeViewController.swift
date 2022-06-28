//
//  HomeViewController.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import UIKit

private struct Const {
    static let ratioCell: CGFloat = 60 / 146
}

class HomeViewController: UIViewController {

    @IBOutlet weak var weatherCollectionView: UICollectionView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var nameLocation: UILabel!
    @IBOutlet weak var maxAndMinTemp: UILabel!
    
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let viewModel = viewModel, let index = viewModel.getIndexCurrenCell() {
            weatherCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: false)
        }
        
        weatherCollectionView.isHidden = false
    }

    private func config() {
        configCollectionView()
        configLabel()
    }
    
    private func configCollectionView() {
        weatherCollectionView.registerCell(type: WeatherCell.self)
        weatherCollectionView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
        weatherCollectionView.delegate = self
        weatherCollectionView.dataSource = self
        weatherCollectionView.backgroundColor = .clear
    }
    
    private func configLabel() {
        if let viewModel = viewModel {
            tempLabel.text = viewModel.getTempCurrent() + "°"
            maxAndMinTemp.text = "H:\(Int(viewModel.getMaxTemp()))°   L:\(Int(viewModel.getMinTemp()))°"
            nameLocation.text = viewModel.getNameLocation()
        }
    }
    
    
    @IBAction func listWeatherButtonDidTap(_ sender: Any) {
        let vc = ListWeatherViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getNumberOfItemHour() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueCell(type: WeatherCell.self, indexPath: indexPath),
            let item = viewModel?.hourIndex(index: indexPath.row), let index = viewModel?.getIndexCurrenCell() else {
            return UICollectionViewCell()
        }
        
        cell.bindData(viewModel: item, now: indexPath.row == index)
        print(item)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? WeatherCell,
              let item = viewModel?.hourIndex(index: indexPath.row),
              let index = viewModel?.getIndexCurrenCell() else {
            return
        }
        
        cell.bindData(viewModel: item, now: indexPath.row == index)

    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height - 20
        return CGSize(width: height * Const.ratioCell, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}
