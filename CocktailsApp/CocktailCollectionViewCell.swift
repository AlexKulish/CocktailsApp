//
//  CocktailCollectionViewCell.swift
//  CocktailsApp
//
//  Created by Alex Kulish on 29.03.2022.
//

import UIKit
import SnapKit

class CocktailCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CocktailCell"
    
    let cocktail: UILabel = {
        var name = UILabel()
        name.textColor = .white
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func setupView() {
        
        addSubview(cocktail)
        cocktail.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(6)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(6)
        }
    }
    
}
