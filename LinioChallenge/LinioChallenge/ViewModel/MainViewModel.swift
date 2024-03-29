//
//  MainViewModel.swift
//  LinioChallenge
//
//  Created by Pablo Ramirez on 6/25/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

protocol MainProtocol {
    func didStartService()
    func didSuccessService()
    func didErrorService()
}

class MainViewModel{
    
    let service: Service = Service()
    var mainDelegate: MainProtocol?
    
    var favorites: [Favorite] = []
    var productsArray: [Product] = []
    
    init() {
        //getFavoritesService()
    }
    
    func getFavoritesService(){
        mainDelegate?.didStartService()
        
        service.performFavoritesService()
        service.onSuccessFavoritesService = {(_ response: [Favorite]) -> Void in
            
            print("response = ", response)
            self.favorites = response
            self.getTotalProducts()
            self.mainDelegate?.didSuccessService()
        }
        service.onServiceError = {(_ error: ServiceError)  -> Void in
            
            print("Error en el servicio: ", error)
            self.mainDelegate?.didErrorService()
        }
    }
    
    func getTotalProducts(){
        if !favorites.isEmpty{
            
            for i in 0..<favorites.count{
                if let products = favorites[i].products{
                    for j in 0..<products.count{
                        productsArray.append(Array(products.values)[j])
                    }
                }
            }
        }
    }
    
//    func getFavoritesService(){
//        let jsonUrlString = "https://gist.githubusercontent.com/egteja/98ad43f47d40b0868d8a954385b5f83a/raw/5c00958f81f81d6ba0bb1b1469c905270e8cdfed/wishlist.json"
//
//        guard let url = URL(string: jsonUrlString) else{
//            print("Error en el servicio")
//
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            /// validar si hay error
//            if let error = error{
//                print("ocurrió un error: ", error)
//                return
//            }
//            /// checar el status 200 OK
////            if let httpResponse = response as? HTTPURLResponse{
////                if httpResponse.statusCode == 400{
////                    print("Error")
////                    return
////                }
////            }
//
//            guard let data = data else { return }
//
//            do{
//                let favorites = try JSONDecoder().decode([Favorite].self, from: data)
//
//                print(favorites)
//            }catch let jsopErr{
//
//                print("error serializing json object:", jsopErr)
//            }
//        }.resume()
//    }
}
