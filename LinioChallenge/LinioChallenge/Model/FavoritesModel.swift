//
//  FavoritesModel.swift
//  LinioChallenge
//
//  Created by Pablo Ramirez on 6/25/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

// MARK: - Favorite
class Favorite: Decodable {
    let id: Int
    let name: String
    let description: String
    let fDefault: Bool?
    let owner: Owner
    let createdAt: Date
    let visibility: String
    let products: [String: Product]
    
    init(id: Int, name: String, description: String, fDefault: Bool, owner: Owner, createdAt: Date, visibility: String, products: [String: Product]) {
        self.id = id
        self.name = name
        self.description = description
        self.fDefault = fDefault
        self.owner = owner
        self.createdAt = createdAt
        self.visibility = visibility
        self.products = products
    }
}

// MARK: - Owner
class Owner: Decodable {
    let name: String
    let email: String
    let linioId: String
    
    init(name: String, email: String, linioId: String) {
        self.name = name
        self.email = email
        self.linioId = linioId
    }
}

// MARK: - Product
class Product: Decodable {
    let id: Int
    let name: String
    let wishListPrice: Int
    let slug: String
    let url: String
    let image: String
    let linioPlusLevel: Int
    let conditionType: String
    let freeShipping: Bool
    let imported: Bool
    let active: Bool
    
    init(id: Int, name: String, wishListPrice: Int, slug: String, url: String, image: String, linioPlusLevel: Int, conditionType: String, freeShipping: Bool, imported: Bool, active: Bool) {
        self.id = id
        self.name = name
        self.wishListPrice = wishListPrice
        self.slug = slug
        self.url = url
        self.image = image
        self.linioPlusLevel = linioPlusLevel
        self.conditionType = conditionType
        self.freeShipping = freeShipping
        self.imported = imported
        self.active = active
    }
}

typealias Favorites = [Favorite]
