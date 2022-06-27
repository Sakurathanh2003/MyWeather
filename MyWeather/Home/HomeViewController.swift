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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    private func config() {
        configCollectionView()
    }
    
    private func configCollectionView() {
        weatherCollectionView.registerCell(type: WeatherCell.self)
        weatherCollectionView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
        weatherCollectionView.delegate = self
        weatherCollectionView.dataSource = self
        weatherCollectionView.backgroundColor = .clear
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueCell(type: WeatherCell.self, indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        
        return cell
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
