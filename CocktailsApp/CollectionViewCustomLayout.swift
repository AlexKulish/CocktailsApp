//
//  CollectionViewCustomLayout.swift
//  CocktailsApp
//
//  Created by Alex Kulish on 29.03.2022.
//

import UIKit

class UICollectionViewCustomLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }
        
        var items = [CollectionViewItems]()
        var currentItemY: CGFloat = -1
        
        for attribute in attributes {
            if currentItemY != attribute.frame.origin.y {
                currentItemY = attribute.frame.origin.y
                items.append(CollectionViewItems(spacing: 10))
            }
            items.last?.addAttribute(attribute: attribute)
        }
        
        items.forEach { $0.customLayout(collectionViewWidth: collectionView?.frame.width ?? 0) }
        return items.flatMap { $0.attributes }
        
    }
}

class CollectionViewItems {
    
    var attributes = [UICollectionViewLayoutAttributes]()
    var spacing: CGFloat = 0
    
    var itemWidth: CGFloat {
        return attributes.reduce(0, { result, attribute -> CGFloat in
            result + attribute.frame.width
        }) + CGFloat(attributes.count - 1) * spacing
    }
    
    init(spacing: CGFloat) {
        self.spacing = spacing
    }
    
    func addAttribute(attribute: UICollectionViewLayoutAttributes) {
        attributes.append(attribute)
    }
    
    
    func customLayout(collectionViewWidth: CGFloat) {
        var offset = CGFloat(0)
        for attribute in attributes {
            attribute.frame.origin.x = offset
            offset += attribute.frame.width + spacing
        }
    }
    
}

