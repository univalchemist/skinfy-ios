//
//  ProductIconsCollectionView.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/30/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class ProductIconsCollectionView: UIView {
    
    //static data of product icons
    struct SelectableIcon {
        var imageName: String
        var imageHeight: CGFloat
    }
    let productIcons: [SelectableIcon] = [
        SelectableIcon(imageName: "ic_product1_white", imageHeight: 36),
        SelectableIcon(imageName: "ic_product2_white", imageHeight: 29.98),
        SelectableIcon(imageName: "ic_product3_white", imageHeight: 20.4),
        SelectableIcon(imageName: "ic_product4_white", imageHeight: 41.95),
        SelectableIcon(imageName: "ic_product5_white", imageHeight: 42.9),
        SelectableIcon(imageName: "ic_product6_white", imageHeight: 30.36),
        SelectableIcon(imageName: "ic_product7_white", imageHeight: 23.37),
        SelectableIcon(imageName: "ic_product8_white", imageHeight: 41.74),
        SelectableIcon(imageName: "ic_product9_white", imageHeight: 24.94),
        SelectableIcon(imageName: "ic_product10_white", imageHeight: 46.48),
    ]
    
    var selectedIndex: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        DispatchQueue.main.async {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 70, height: 70)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 2
            let view = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
            view.delegate = self
            view.dataSource = self
            view.backgroundColor = .clear
            //view.allowsSelection = true
            //view.isUserInteractionEnabled = true
            let identifier = String(describing: ProductIconCollectionViewCell.self)
            view.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
            self.addSubview(view)
        }
    }
}

extension ProductIconsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productIcons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProductIconCollectionViewCell.self), for: indexPath) as! ProductIconCollectionViewCell
        cell.productIcon.imageName = productIcons[indexPath.row].imageName
        cell.productIcon.imageHeight = productIcons[indexPath.row].imageHeight
        if (selectedIndex == indexPath.row) {
            cell.productIcon.setSelected(selected: true)
        } else {
            cell.productIcon.setSelected(selected: false)
        }
        cell.setNeedsLayout()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        print("selected row: \(selectedIndex)")
        collectionView.reloadData()
    }
    
    
}
