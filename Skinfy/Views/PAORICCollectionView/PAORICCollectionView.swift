//
//  PAORICCollectionView.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/30/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class PAORICCollectionView: UIView {
    
    var data: [PAORICIcon] = []        
    
    var selectedIndex: Int = 0
    
    private lazy var collectionView: UICollectionView = {
        let myLayout = UICollectionViewFlowLayout()
        myLayout.itemSize = CGSize(width: 70, height: 74)
        myLayout.minimumInteritemSpacing = 0
        myLayout.minimumLineSpacing = 2
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: myLayout)
        return collectionView
    }()
    
    init(frame: CGRect, layout: UICollectionViewFlowLayout) {
        super.init(frame: frame)
        commonInit(layout: layout)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(layout: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit(layout: nil)
    }
    
    private func commonInit(layout: UICollectionViewFlowLayout?) {
        backgroundColor = .clear
        DispatchQueue.main.async {            
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.backgroundColor = .clear
            let identifier = String(describing: PAORICCollectionViewCell.self)
            self.collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
            self.addSubview(self.collectionView)
        }
    }
    
    func setCollectionViewLayout(layout: UICollectionViewLayout, animated: Bool) {
        collectionView.setCollectionViewLayout(layout, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}

extension PAORICCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PAORICCollectionViewCell.self), for: indexPath) as! PAORICCollectionViewCell
        cell.paoSymbolIconButton.imageName = data[indexPath.row].imageName
        cell.paoSymbolIconButton.labelText = data[indexPath.row].label
        cell.paoSymbolIconButton.setSelected(selected: selectedIndex == indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        collectionView.reloadData()
    }
    
    
}
