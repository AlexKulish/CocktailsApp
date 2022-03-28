//
//  Cocktail.swift
//  CocktailsApp
//
//  Created by Alex Kulish on 28.03.2022.
//

import Foundation

struct Cocktail: Codable {
    let drinks: [Drink]
}

struct Drink: Codable {
    let strDrink: String
}

