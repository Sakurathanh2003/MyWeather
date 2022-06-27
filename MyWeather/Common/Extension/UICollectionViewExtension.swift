//
//  UICollectionViewExtension.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import Foundation
import UIKit

extension UICollectionView {
//    func registerCell<T>(type: T.Type) {
//        let name = String(describing: type)
//        self.register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
//    }
//
//    func dequeueCell<T>(type: T.Type) -> T? {
//        let name = String(describing: type)
//        return self.dequeueReusableCell(withIdentifier: name) as? T
//    }
//
//    func dequeueCell<T>(type: T.Type, indexPath: IndexPath) -> T? {
//        let name = String(describing: type)
//        return self.dequeueReusableCell(withIdentifier: name, for: indexPath) as? T
//    }
    
    func registerCell<T>(type: T.Type) {
        let name = String(describing: type)
        self.register(UINib(nibName: name, bundle: nil), forCellWithReuseIdentifier: name)
    }
    
    func dequeueCell<T>(type: T.Type, indexPath: IndexPath) -> T? {
        let name = String(describing: type)
        return self.dequeueReusableCell(withReuseIdentifier: name,for: indexPath) as? T
    }
}
