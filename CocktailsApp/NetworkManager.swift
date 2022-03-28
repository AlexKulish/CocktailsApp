//
//  NetworkManager.swift
//  CocktailsApp
//
//  Created by Alex Kulish on 28.03.2022.
//

import Alamofire

class NetworkManager {
    
    let cocktailUrl = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"
    
    static let shared = NetworkManager()
    private init() {}
    
    func fetchData(completion: @escaping(Cocktail) -> Void) {
        
        guard let url = URL(string: cocktailUrl) else { return }
        
        AF.request(url).validate().responseDecodable(of: Cocktail.self) { response in
            switch response.result {
            case .success(let cocktail):
                completion(cocktail)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
