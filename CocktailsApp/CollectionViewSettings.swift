//
//  CollectionViewSettings.swift
//  CocktailsApp
//
//  Created by Alex Kulish on 28.03.2022.
//

import UIKit
import SnapKit

class CollectionViewSettings: UIView {
    
    lazy var itemCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private func setupCollectionView() {
        
        addSubview(itemCollectionView)
        itemCollectionView.contentInset = .init(top: 8, left: 8, bottom: 8, right: 8)
        itemCollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_topMargin)
            make.leading.equalTo(self.snp_leadingMargin)
            make.trailing.equalTo(self.snp_trailingMargin)
            make.bottom.equalTo(self.snp_bottomMargin)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
