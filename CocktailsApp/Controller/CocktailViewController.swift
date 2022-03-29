//
//  CocktailViewController.swift
//  CocktailsApp
//
//  Created by Alex Kulish on 28.03.2022.
//

import UIKit

class CocktailViewController: UIViewController {
    
    private var drinks: [Drink] = []
    private var customCollectionView = CollectionViewSettings()
    
    override func loadView() {
        super.loadView()
        self.view = customCollectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setView()
        fetchCocktail()
    }
    
    private func fetchCocktail() {
        
        DispatchQueue.main.async {
            NetworkManager.shared.fetchData { [self] cocktail in
                drinks = cocktail.drinks
                customCollectionView.itemCollectionView.reloadData()
            }
        }
    }
    

}

// MARK: - UICollectionViewDelegate

extension CocktailViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        let gradient = Gradient.shared.getGradientLayer(bounds: cell.bounds)
        cell.backgroundColor = Gradient.shared.gradientColor(bounds: cell.bounds, gradientLayer: gradient)
    }
    
}

// MARK: - UICollectionViewDataSource

extension CocktailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        drinks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CocktailCell", for: indexPath) as? CocktailCollectionViewCell else { fatalError("error") }
        cell.cocktail.text = drinks[indexPath.item].strDrink
        cell.backgroundColor = .gray
        cell.layer.cornerRadius = 10
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CocktailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
}


// MARK: - Delegate

extension CocktailViewController {

    private func setView() {
        customCollectionView.itemCollectionView.delegate = self
        customCollectionView.itemCollectionView.dataSource = self
        customCollectionView.itemCollectionView.register(CocktailCollectionViewCell.self, forCellWithReuseIdentifier: CocktailCollectionViewCell.identifier)
    }

}
